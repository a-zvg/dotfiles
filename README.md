# Windows config

**Шаги:**

- Удалить Microsoft Teams, Teams Machine-Wide Installer, приложения Xbox, Microsoft OneDrive, Microsoft Pay, Microsoft Office 365, Приложения Microsoft 365 для предприятий, Яндекс.Музыка
- Установить драйвер SSD и Samsung Magician
- Установить Mozilla Firefox
- Персонализировать оформление: темная тема с отключенными анимацией и прозрачностью
- Отключить файл подкачки
- Отключить файл гибернации: `powercfg.exe /hibernate off`
- Отключить BitLocker
- Установить AutoHotkey и создать скрипт смены раскладки `switch_keyboards.ahk` в `shell:startup`
- Разделить диск на Windows и Data. Изменить расположение Загрузок на диск D

- Установить `Python` (только Documentation и pip +PATH)
- Установить `notebook`?
- Установить профиль по умолчанию в `%USERPROFILE%\.conan\profiles\default`:

```
[settings]
os=Windows
os_build=Windows
arch=x86_64
arch_build=x86_64
compiler=Visual Studio
compiler.version=16
compiler.cppstd=14
compiler.runtime=MD
build_type=Release
[options]
[build_requires]
[env]
```

- Установить гипервизор Hyper-V для виртуализации Windows
- Установить файловый менеджер Far Manager
- Установить SSH клиент Kitty и ассоциировать его с ktx-файлами: kitty.exe -fileassoc
- Установить текстовый редактор Notepad++
- Установить торрент-клиент qBittorrent
- Установить менеджер БД DBeaver
- Установить менеджер 7-Zip
- Установить OpenVPN Connect for Windows
- Установить X-сервер VcXsrv

## WSL

- Установить Debian: `wsl --install -d Debian`
- Создать home.vhdx образ на 100ГБ с помощью Управления дисками
- Подключить `wsl --mount --vhd D:\VHDs\home.vhdx --bare`
- Разметить через fdisk и настроить /etc/fstab

Если понадобится доступ по ssh:
  - Установить openssh-server: `sudo apt-get install openssh-server --no-install-recommends`
  - Выставить в /etc/ssh/sshd_config: `PasswordAuthentication yes`
  - Запустить ssh-сервер: `sudo service ssh start`
- Добавить прокси-сервер портов с порта 2222 на порт 22 виртуальной машины WSL:
```
netsh interface portproxy add v4tov4 listenaddress=0.0.0.0 listenport=2222 connectaddress=127.0.0.1 connectport=22
```
