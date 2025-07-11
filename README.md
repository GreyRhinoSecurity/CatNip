# 🐾 CatNip - Multi-Engine NTLM Cracker

**by [GreyRhinoSecurity](https://github.com/GreyRhinoSecurity)**  
🔒 Hashcat + John + Benchmark + Rules = One purring powerhouse 😼

---

![Version](https://img.shields.io/badge/version-v2.8-blue)
![License](https://img.shields.io/badge/license-MIT-green)
![Shell](https://img.shields.io/badge/language-shell-lightgrey)

---

## 📸 Live Demo

![CatNip cracking](screenshots/catnip_v28_cracking.png)

---

## 🧠 Features

| Feature            | Status | Description                              |
|--------------------|--------|------------------------------------------|
| 🔓 NTLM Cracking   | ✅     | Supports hashcat, john, or both           |
| 🎯 Rule Picker     | ✅     | Select from system .rules or custom       |
| ⚡ Benchmark Mode  | ✅     | Compare cracking speeds live              |
| 📦 .deb Installer  | ✅     | Easy install on Kali/Debian               |
| 📜 Install Script  | ✅     | `curl | bash` one-liner setup             |
| 🐳 Docker Support  | 🚧     | Coming soon                               |
| 🌐 Web UI (Flask)  | 🚧     | Planned                                   |

---

## 🚀 Quick Start

Install from GitHub Releases:
```bash
curl -sSL https://raw.githubusercontent.com/GreyRhinoSecurity/CatNip/main/install_catnip.sh | bash
catnip
```

---

## 💻 Usage

Run in interactive terminal:
```bash
catnip
```

Choose:
- cracking mode (hashcat/john/both)
- rule set (default or custom)
- GPU tuning
- or benchmark engines

---

## 🛣️ Roadmap

- [x] v2.8: Rule selector + benchmarks
- [x] `.deb` + auto installer
- [ ] Docker container
- [ ] HTML dashboard
- [ ] Flask web interface
- [ ] Smart wordlist generator

---

## 📜 License

MIT © 2025 GreyRhinoSecurity
