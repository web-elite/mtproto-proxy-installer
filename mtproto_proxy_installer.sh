#!/bin/bash

INSTALL_DIR="/mtprotoproxy"
CONFIG_FILE="$INSTALL_DIR/config.py"
SERVICE_FILE="/etc/systemd/system/mtproto.service"
CRON_JOB_FILE="/etc/cron.d/mtproto-restart"

function install_mtproto() {
    echo "[+] Installing MTProto Proxy..."

    # Get user input
    read -p "Number of initial users: " user_count
    read -p "Port number (e.g., 443 or 8443): " port
    read -p "Mask address (e.g., www.cloudflare.com): " mask
    read -p "Service restart interval (minutes): " restart_minutes

    # Install prerequisites
    apt update
    apt install -y git python3 python3-pip

    # Clone and install
    git clone https://github.com/alexbers/mtprotoproxy.git $INSTALL_DIR
    pip3 install -r $INSTALL_DIR/requirements.txt

    # Generate users
    users=""
    links=""
    server_ip=$(curl -s https://api.ipify.org)

    for i in $(seq 1 $user_count); do
        username="user$i"
        secret=$(openssl rand -hex 16)
        users+="    \"$username\": \"$secret\",\n"

        link="tg://proxy?server=$server_ip&port=$port&secret=dd$secret"
        links+="$username: $link\n"
    done
    users=$(echo -e "$users" | sed '$ s/,$//')

    # Write config
    cat >$CONFIG_FILE <<EOF
PORT = $port

USERS = {
$users}

MODES = {
    "classic": False,
    "secure": True,
    "tls": True
}

TLS_DOMAIN = "$mask"
EOF

    # Create systemd service
    cat >$SERVICE_FILE <<EOF
[Unit]
Description=MTProto Proxy Python Service
After=network.target

[Service]
ExecStart=/usr/bin/python3 $INSTALL_DIR/mtprotoproxy.py
Restart=always
User=root

[Install]
WantedBy=multi-user.target
EOF

    # Enable and start service
    systemctl daemon-reexec
    systemctl daemon-reload
    systemctl enable mtproto
    systemctl start mtproto

    # Create cron job for restart
    echo "*/$restart_minutes * * * * root systemctl restart mtproto" >$CRON_JOB_FILE

    echo "[+] Installation completed successfully."
    echo -e "$links" >/mtprotoproxy/proxy.txt
    echo -e "\n✅ These proxy links saved in the file '/mtprotoproxy/proxy.txt'.\n"
}

function edit_mtproto() {
    echo "[*] Editing MTProto Proxy"

    if [ ! -f "$CONFIG_FILE" ]; then
        echo "[!] Config file not found."
        exit 1
    fi

    echo "[1] Add new users"
    echo "[2] Change port"
    echo "[3] Change mask"
    echo "[4] Change restart interval"
    read -p "Your choice: " choice

    case $choice in
    1)
        read -p "Number of new users: " count
        for i in $(seq 1 $count); do
            username="user$(date +%s%N | cut -b10-19)"
            secret=$(openssl rand -hex 16)
            sed -i "/USERS = {/a \    \"$username\": \"$secret\"," $CONFIG_FILE
            sleep 0.1
        done
        ;;
    2)
        read -p "New port: " port
        sed -i "s/^PORT = .*/PORT = $port/" $CONFIG_FILE
        ;;
    3)
        read -p "New mask address: " mask
        sed -i "s/^TLS_DOMAIN = .*/TLS_DOMAIN = \"$mask\"/" $CONFIG_FILE
        ;;
    4)
        read -p "New restart interval (minutes): " minutes
        echo "*/$minutes * * * * root systemctl restart mtproto" >$CRON_JOB_FILE
        ;;
    *)
        echo "Invalid option"
        ;;
    esac

    systemctl restart mtproto
    echo "[+] Changes saved and service restarted."
}

function uninstall_mtproto() {
    echo "[!] Uninstalling MTProto Proxy..."

    systemctl stop mtproto
    systemctl disable mtproto
    rm -f $SERVICE_FILE
    rm -f $CRON_JOB_FILE
    rm -rf $INSTALL_DIR

    systemctl daemon-reload
    echo "[+] MTProto Proxy uninstalled."
}

echo "========== MTProto Proxy Installer =========="
echo "[1] Install"
echo "[2] Edit"
echo "[3] Uninstall"
read -p "Your choice: " action

case $action in
1) install_mtproto ;;
2) edit_mtproto ;;
3) uninstall_mtproto ;;
*) echo "Invalid option" ;;
esac
