# MTProto Proxy Installer Script

[🇮🇷 راهنما فارسی](https://github.com/web-elite/mtproto-proxy-installer/blob/main/README-fa.MD)

This is an interactive installer script for [alexbers/mtprotoproxy](https://github.com/alexbers/mtprotoproxy).  
It helps you easily install, configure, edit, or remove the MTProto proxy server on your system.

<details>
    <summary><span  style="font-size:24px">📦 Features</span></summary>
<hr></hr>

- Full interactive installation
- Asks for:
  - Number of users
  - Proxy port
  - TLS mask address
  - Auto-restart interval (via cronjob)
- Automatically generates `config.py`
- Creates a persistent systemd service (`mtproto.service`)
- Supports editing current config:
  - Add users
  - Change port or TLS mask address
  - Change auto-restart interval
- Clean removal of:
  - Proxy files
  - Systemd service
  - Cronjob
</details>
 
<details>
    <summary><span  style="font-size:24px">⚙️ Installation</span></summary>
<hr></hr>

```bash
git clone https://github.com/web-elite/mtproto-proxy-installer.git
cd mtproto-proxy-installer
chmod +x mtproto_proxy_installer.sh
sudo ./mtproto_proxy_installer.sh
```
</details>
 
<details>
    <summary><span  style="font-size:24px">📖 How to Use</span></summary>
<hr></hr>
After running the script:

```bash
sudo ./mtproto_installer.sh
```
You will see an interactive menu:
```bash
=== MTProto Proxy Manager ===

1) Install MTProto Proxy
2) Edit Existing Configuration
3) Uninstall Everything
0) Exit
```

### 1️⃣ Install MTProto Proxy

Enter how many users you want (e.g. 100 or 200)
Enter the proxy port (default: 443)
Enter TLS masking address (e.g. www.cloudflare.com)
Enter auto-restart interval in minutes (e.g. 10)

The script will:
Clone and install the proxy
Create config.py with random secrets
Set up systemd service
Add a cronjob for auto-restarts

### 2️⃣ Edit Existing Configuration

Add more users
Change port or masking address
Change auto-restart interval

### 3️⃣ Uninstall Everything

Stops and disables systemd service
Removes all proxy files
Removes auto-restart cronjob
</details>
 
<details>
    <summary><span  style="font-size:24px">🌟 Show Some Love</span></summary>
<hr></hr>
If you found this project useful, please consider giving it a ⭐️ star!
</details>
 
<details>
    <summary><span  style="font-size:24px">📄 License</span></summary>
<hr></hr>
MIT License
</details>