# 🐾 CatNip - Multi-Engine NTLM Cracker

**by [GreyRhinoSecurity](https://github.com/GreyRhinoSecurity)**  
🔒 Hashcat + John + Rule Picker + CEWL + HTML Dashboard = Fully Weaponized 😼

---

![Version](https://img.shields.io/badge/version-v3.1.1-blue)
![License](https://img.shields.io/badge/license-MIT-green)
![Shell](https://img.shields.io/badge/language-shell-lightgrey)

---

## 📸 Live Demo

![CatNip cracking](screenshots/catnip_v311_cracking.png)

---

## 🧠 Features

| Feature              | Status | Description                                        |
|----------------------|--------|----------------------------------------------------|
| 🔓 NTLM Cracking     | ✅     | Supports Hashcat, John, or both                    |
| 🎯 Rule Picker       | ✅     | System & custom rule file support                  |
| ⚠️ Path Validation   | ✅     | Validates all file paths                           |
| 🧠 Smart Wordlist Gen| ✅     | Username + keyword + CEWL + year combo             |
| 📊 Benchmark Mode    | ✅     | Hashcat & John performance testing                 |
| 🧾 HTML Dashboard    | ✅     | Auto-generated + auto-open in browser              |
| 📦 .deb Installer    | ✅     | Easy to install, self-contained                    |
| 📜 Install Script    | ✅     | One-liner setup with curl                          |
| 🐳 Docker Support    | 🚧     | Coming soon                                        |
| 🌐 Web UI (Flask)    | 🚧     | Planned                                            |

---

## 🚀 Quick Install (Latest)

```bash
wget https://github.com/GreyRhinoSecurity/CatNip/releases/latest/download/catnip_3.1.1_all.deb
sudo dpkg -i catnip_3.1.1_all.deb
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

Choose:
- [1] Crack NTLM Hashes
- [2] Run Benchmarks
- [3] Generate Smart Wordlist (username + CEWL)

Outputs:
- 📂 `catnip_custom_wordlist.txt`
- 📊 `catnip_cracked_dashboard.html`

---

## 🛣️ Roadmap

- [x] Rule selector + validation
- [x] Wordlist generation with CEWL
- [x] Auto-crack after generate
- [x] Auto-open HTML dashboard
- [ ] Docker container (coming)
- [ ] Web UI (Flask)

---

## 📜 License

MIT © 2025 GreyRhinoSecurity
