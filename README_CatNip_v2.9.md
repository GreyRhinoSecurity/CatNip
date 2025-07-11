# 🐾 CatNip - Multi-Engine NTLM Cracker

**by [GreyRhinoSecurity](https://github.com/GreyRhinoSecurity)**  
🔒 Hashcat + John + Rule Picker + Benchmarking + HTML Dashboard = One purring powerhouse 😼

---

![Version](https://img.shields.io/badge/version-v2.9-blue)
![License](https://img.shields.io/badge/license-MIT-green)
![Shell](https://img.shields.io/badge/language-shell-lightgrey)

---

## 📸 Live Demo

![CatNip cracking](screenshots/catnip_v29_cracking.png)

---

## 🧠 Features

| Feature              | Status | Description                                      |
|----------------------|--------|--------------------------------------------------|
| 🔓 NTLM Cracking     | ✅     | Supports Hashcat, John, or both simultaneously   |
| 🎯 Rule Picker       | ✅     | Choose system .rules or custom rule file         |
| ⚠️ Path Validation   | ✅     | Verifies hash, wordlist, and rule file paths     |
| 📊 Benchmark Mode    | ✅     | Hashcat & John benchmark performance comparison  |
| 🧾 HTML Dashboard    | ✅     | Cracked results with usernames + passwords       |
| 📦 .deb Installer    | ✅     | Easy install on Kali/Debian                      |
| 📜 Install Script    | ✅     | One-liner installer via `curl`                   |
| 🐳 Docker Support    | 🚧     | In development                                   |
| 🌐 Web UI (Flask)    | 🚧     | Planned                                          |

---

## 🚀 Quick Install

### 🔧 Via .deb Package

```bash
wget https://github.com/GreyRhinoSecurity/CatNip/releases/latest/download/catnip_2.9_all.deb
sudo dpkg -i catnip_2.9_all.deb
catnip
```

---

### 🐾 One-Line Install (optional)

```bash
curl -sSL https://raw.githubusercontent.com/GreyRhinoSecurity/CatNip/main/install_catnip.sh | bash
```

---

## 🔍 Usage Example

```bash
catnip
```

1. Select engine(s): Hashcat, John, or Both  
2. Choose your wordlist  
3. Pick a rule file or provide a custom one  
4. Let it crack — and it will generate:

📄 `cracked_ntlm.txt`  
📄 `cracked_john.txt`  
📊 `catnip_cracked_dashboard.html`

---

## 🛣️ Roadmap

- [x] Rule picker and rule path validation
- [x] HTML export with cracked user:pass
- [x] Benchmarking integration
- [x] v2.9 `.deb` release
- [ ] Docker support
- [ ] HTML dashboard w/ charts
- [ ] Web UI in Flask

---

## 📜 License

MIT © 2025 GreyRhinoSecurity

---

## 👋 Contributions

Star ⭐ the project, fork 🍴 it, and submit a pull request!  
Bug reports, rule packs, and dashboard themes welcome!
