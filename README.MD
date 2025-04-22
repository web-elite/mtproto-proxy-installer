# MTProto Proxy Installer Script

> [🇮🇷 فارسی](https://github.com/web-elite/mtproto-installer/README-FA.md)

This is an interactive installer script for [alexbers/mtprotoproxy](https://github.com/alexbers/mtprotoproxy).  
It helps you easily install, configure, edit, or remove the MTProto proxy server on your system.

---

## 📦 Features

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

---

## ⚙️ Installation

### 📥 Step-by-step:

```bash
git clone https://github.com/web-elite/mtproto-proxy-installer.git
cd mtproto-proxy-installer
chmod +x mtproto_proxy_installer.sh
sudo ./mtproto_proxy_installer.sh
