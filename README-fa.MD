# MTProto Proxy Installer Script

[🇺🇸 English Toturial](https://github.com/web-elite/mtproto-proxy-installer/blob/main/README.MD)

این یک اسکریپت نصب تعاملی برای [alexbers/mtprotoproxy](https://github.com/alexbers/mtprotoproxy) است.  
این اسکریپت به شما کمک می‌کند تا به راحتی سرور پروکسی MTProto را نصب، پیکربندی، ویرایش یا حذف کنید.

<details>
  <summary><span  style="font-size:24px">📦 ویژگی‌ها</span></summary>
<hr></hr>

- نصب کاملاً تعاملی
- درخواست اطلاعات زیر:
  - تعداد کاربران
  - پورت پروکسی
  - آدرس ماسک TLS
  - بازه زمانی راه‌اندازی مجدد خودکار (از طریق کرون‌جاب)
- به صورت خودکار فایل `config.py` را تولید می‌کند
- ایجاد یک سرویس پایدار systemd (`mtproto.service`)
- پشتیبانی از ویرایش پیکربندی فعلی:
  - افزودن کاربران
  - تغییر پورت یا آدرس ماسک TLS
  - تغییر بازه زمانی راه‌اندازی مجدد خودکار
- حذف کامل:
  - فایل‌های پروکسی
  - سرویس systemd
  - کرون‌جاب
</details>
 
<details>
  <summary><span  style="font-size:24px">⚙️ نصب</span></summary>
<hr></hr>

```bash
git clone https://github.com/web-elite/mtproto-proxy-installer.git
cd mtproto-proxy-installer
chmod +x mtproto_proxy_installer.sh
sudo ./mtproto_proxy_installer.sh
```
</details>
 
<details>
  <summary><span  style="font-size:24px">📖 نحوه استفاده</span></summary>
<hr></hr>
پس از اجرای اسکریپت:

```bash
sudo ./mtproto_installer.sh
```
یک منوی تعاملی مشاهده خواهید کرد:
```bash
=== MTProto Proxy Manager ===

1) Install MTProto Proxy
2) Edit Existing Configuration
3) Uninstall Everything
0) Exit
```

### 1️⃣ نصب MTProto Proxy

تعداد کاربران مورد نظر را وارد کنید (مثلاً 100 یا 200)  
پورت پروکسی را وارد کنید (پیش‌فرض: 443)  
آدرس ماسک TLS را وارد کنید (مثلاً www.cloudflare.com)  
بازه زمانی راه‌اندازی مجدد خودکار را به دقیقه وارد کنید (مثلاً 10)  

اسکریپت موارد زیر را انجام خواهد داد:  
کلون و نصب پروکسی  
ایجاد فایل config.py با مقادیر تصادفی  
راه‌اندازی سرویس systemd  
افزودن کرون‌جاب برای راه‌اندازی مجدد خودکار  

### 2️⃣ ویرایش پیکربندی فعلی

افزودن کاربران بیشتر  
تغییر پورت یا آدرس ماسک  
تغییر بازه زمانی راه‌اندازی مجدد خودکار  

### 3️⃣ حذف کامل

توقف و غیرفعال کردن سرویس systemd  
حذف تمام فایل‌های پروکسی  
حذف کرون‌جاب راه‌اندازی مجدد خودکار  
</details>
 
<details>
  <summary><span  style="font-size:24px">🌟 حمایت کنید</span></summary>
<hr></hr>
اگر این پروژه برای شما مفید بود، لطفاً با دادن یک ⭐️ ستاره از آن حمایت کنید!
</details>
 
<details>
  <summary><span  style="font-size:24px">📄 مجوز</span></summary>
<hr></hr>
مجوز MIT
</details>