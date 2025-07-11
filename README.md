# 🐾 CatNip - Multi-Engine NTLM Cracker

**by [GreyRhinoSecurity](https://github.com/GreyRhinoSecurity)**  
🔒 Hashcat + John + CEWL + Dashboard = Fully Armed 😼

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
| 📂 Path Validation   | ✅     | Checks wordlist, rule, hash path before run        |
| 📊 Benchmark Mode    | ✅     | Hashcat + John performance tests                   |
| 🧾 HTML Dashboard    | ✅     | Now shows user, password, source + crack time      |
| 🌐 Auto-Opens Browser| ✅     | Uses xdg-open or prints clickable file:// path     |
| 📦 .deb Installer    | ✅     | Easy install for Kali, Debian                      |
| 📜 install.sh        | ✅     | Curl-ready one-liner installer                     |
| 🐳 Docker Support    | 🚧     | In progress                                        |
| 🌐 Web UI            | 🚧     | Flask integration planned                          |

---

## 🚀 Quick Install

```bash
wget https://github.com/GreyRhinoSecurity/CatNip/releases/latest/download/catnip_3.2.1_all.deb
sudo dpkg -i catnip_3.2.1_all.deb
catnip
```

---

### 🐾 One-Line Install

```bash
curl -sSL https://raw.githubusercontent.com/GreyRhinoSecurity/CatNip/main/install_catnip.sh | bash
```

---

## 🧪 Usage

```bash
catnip
```

Menu:
- [1] Crack NTLM Hashes 🔓
- [2] Run Benchmarks ⚡
- [3] Generate Smart Wordlist 🧠 (with CEWL scrape)

Output:
- 🧾 `catnip_cracked_dashboard.html`
- 📂 Automatically opens in browser
- ✅ Table includes user, password, source, crack time

---

## 🛣️ Roadmap

- [x] Crack engine selector
- [x] Rule picker + validation
- [x] Smart wordlist generator
- [x] CEWL offline scraping
- [x] HTML dashboard (multi-source + timestamps)
- [ ] Docker container
- [ ] Web UI

---

## 📜 License

MIT © 2025 GreyRhinoSecurity
