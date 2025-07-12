# 🐾 CatNip - Multi-Engine NTLM Cracker

**by [GreyRhinoSecurity](https://github.com/GreyRhinoSecurity)**  
💣 Hashcat + John + CEWL + Smart Wordlists + Session Folders = Your ultimate cracking companion 😼

---

![Version](https://img.shields.io/badge/version-v3.3-blue)
![License](https://img.shields.io/badge/license-MIT-green)
![Shell](https://img.shields.io/badge/language-shell-lightgrey)

---

## 📸 Live Demo

![CatNip cracking](screenshots/catnip_v33_cracking.png)

---

## 🧠 Features

| Feature              | Status | Description                                        |
|----------------------|--------|----------------------------------------------------|
| 🔓 NTLM Cracking     | ✅     | Hashcat, John, or both                             |
| 🧠 Smart Wordlist Gen| ✅     | Username + keywords + years + CEWL scraping        |
| 🎯 Rule Picker       | ✅     | Built-in + custom rules                            |
| 📂 Path Validation   | ✅     | Validates hash, wordlist, rule file paths          |
| 📊 Benchmark Mode    | ✅     | Test hashcat + john speed                          |
| 💾 Session Folders   | 🚧     | Save each run in its own timestamped folder        |
| 🧾 HTML Dashboard    | ✅     | Username, password, hash, crack time, source       |
| 🌐 Auto Browser Open | ✅     | Opens dashboard or gives file:// link              |
| 📦 .deb Installer    | ✅     | Kali/Debian ready                                  |
| 📜 install.sh        | ✅     | One-line install via curl                          |
| 🐳 Docker Support    | 🚧     | Coming soon                                        |
| 🌐 Web UI (Flask)    | 🚧     | In development                                     |

---

## 🚀 Quick Install (Latest)

```bash
wget https://github.com/GreyRhinoSecurity/CatNip/releases/latest/download/catnip_3.3_all.deb
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

Outputs:
- 🧾 Session-based: `catnip_cracked_dashboard_<timestamp>.html`
- ✅ Print + CSV + PDF export options (coming)

---

## 🛣️ Roadmap

- [x] Smart cracking engine selector
- [x] Rule picker and validation
- [x] Wordlist generator + CEWL
- [x] HTML dashboard with crack time
- [x] Auto-browser open
- [ ] Timestamped session folders
- [ ] HTML/CSV/PDF reporting per run
- [ ] Docker container + Web UI

---

## 📜 License

MIT © 2025 GreyRhinoSecurity
