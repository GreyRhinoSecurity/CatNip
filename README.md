# 🐾 CatNip - Multi-Engine NTLM Cracker

**by [GreyRhinoSecurity](https://github.com/GreyRhinoSecurity)**  
🔒 Hashcat + John + CEWL + Dashboard + Wordlist Generator = Fully Armed 😼

---

![Version](https://img.shields.io/badge/version-v3.2.1-blue)
![License](https://img.shields.io/badge/license-MIT-green)
![Shell](https://img.shields.io/badge/language-shell-lightgrey)

---

## 📸 Live Demo

![CatNip cracking](screenshots/catnip_v321_cracking.png)

---

## 🧠 Features

| Feature              | Status | Description                                        |
|----------------------|--------|----------------------------------------------------|
| 🔓 NTLM Cracking     | ✅     | Hashcat, John, or both                             |
| 🧠 Smart Wordlist Gen| ✅     | Username + keywords + years + CEWL scraping        |
| 🎯 Rule Picker       | ✅     | Built-in + custom rules                            |
| 📂 Path Validation   | ✅     | Validates hash, wordlist, rule file                |
| 📊 Benchmark Mode    | ✅     | Compare engine speeds                              |
| 🧾 HTML Dashboard    | ✅     | Username, password, hash, source, crack time       |
| 🌐 Auto Browser Open | ✅     | Opens `dashboard.html` with xdg-open or fallback   |
| 📦 .deb Installer    | ✅     | One-command Kali/Debian setup                      |
| 📜 install.sh        | ✅     | Curl installer script                              |
| 🐳 Docker Support    | 🚧     | Coming next                                        |
| 🌐 Web UI            | 🚧     | Flask frontend in progress                         |

---

## 🚀 Quick Install

```bash
wget https://github.com/GreyRhinoSecurity/CatNip/releases/latest/download/catnip_3.2.1_all.deb
sudo dpkg -i catnip_3.2.1_all.deb
catnip
```

---

### 🐾 One-Line Install (optional)

```bash
curl -sSL https://raw.githubusercontent.com/GreyRhinoSecurity/CatNip/main/install_catnip.sh | bash
```

---

## 🔍 Usage

```bash
catnip
```

Menu:
- [1] Crack NTLM Hashes
- [2] Run Benchmarks
- [3] Generate Smart Wordlist (username + CEWL + keyword + years)

Creates:
- ✅ `catnip_custom_wordlist.txt`
- ✅ `catnip_cracked_dashboard_<timestamp>.html`
- ✅ `cracked_ntlm_<timestamp>.txt` + `cracked_john_<timestamp>.txt`

---

## 📊 HTML Dashboard

Includes:
- Username
- Cracked password
- Source (Hashcat or John)
- Crack time
- Export: CSV, Excel, PDF, Print (DataTables)

---

## 📜 License

MIT © 2025 GreyRhinoSecurity

---

## 👥 Contributions

Star ⭐ the project, fork 🍴 it, and contribute:
- New rule packs
- Wordlist logic
- HTML themes
