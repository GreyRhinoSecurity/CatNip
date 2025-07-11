#!/bin/bash

# === CatNip v3.1 ===
VERSION="3.1"
MODE=1000
OUTFILE="cracked_ntlm.txt"
JOHNOUT="cracked_john.txt"
HTMLREPORT="catnip_cracked_dashboard.html"
WORDLIST_OUT="catnip_custom_wordlist.txt"
CEWLFILE="catnip_cewl.txt"
HTMLFILE="cewl_page.html"

RED='\033[0;31m'
GRN='\033[0;32m'
YEL='\033[1;33m'
BLU='\033[1;34m'
MAG='\033[1;35m'
CYN='\033[1;36m'
RST='\033[0m'

clear
echo -e "${MAG}"
echo "     /\_/\    CatNip Cracker v$VERSION"
echo "    ( o.o )   by GreyRhinoSecurity 🐾"
echo "     > ^ <    smart wordlists + cracking + dashboard"
echo -e "${RST}"
echo -e "${MAG}╔════════════════════════════════════════════════════════════╗"
echo -e "║ ${BLU}CatNip - Terminal Edition${MAG} | ${YEL}v$VERSION${MAG} | Full stack cracking suite ║"
echo -e "╚════════════════════════════════════════════════════════════╝${RST}"

echo -e "\n🎛️ ${CYN}Main Menu:${RST}"
echo "  [1] Crack NTLM Hashes 🔓"
echo "  [2] Run Engine Benchmarks ⚡"
echo "  [3] Generate Smart Wordlist (CEWL + rules) 🧠"
read -p "🔢 Choice: " MAIN_CHOICE

if [[ "$MAIN_CHOICE" == "2" ]]; then
  echo -e "\n⚙️  Running ${YEL}Hashcat Benchmark${RST}..."
  hashcat -b -m $MODE
  echo -e "\n⚙️  Running ${YEL}John Benchmark${RST}..."
  john --test --format=NT
  echo -e "\n${GRN}✅ Benchmark complete.${RST}"
  exit 0
fi

if [[ "$MAIN_CHOICE" == "3" ]]; then
  echo -e "\n🧠 ${MAG}CatNip Wordlist Generator${RST}"
  read -e -p "👤 Username: " USERNAME
  read -e -p "🔑 Keywords (comma-separated): " KEYWORDS
  read -e -p "📅 Year range (e.g., 2020-2024): " YEAR_RANGE
  read -e -p "🌐 Target URL for CEWL (optional): " TARGET_URL

  > "$WORDLIST_OUT"
  echo "$USERNAME" >> "$WORDLIST_OUT"
  echo "${USERNAME}123" >> "$WORDLIST_OUT"
  echo "${USERNAME}@123" >> "$WORDLIST_OUT"
  echo "${USERNAME^}" >> "$WORDLIST_OUT"
  echo "${USERNAME^}123" >> "$WORDLIST_OUT"
  echo "$(echo $USERNAME | sed 's/e/3/g; s/i/1/g; s/o/0/g')" >> "$WORDLIST_OUT"

  IFS=',' read -ra KW <<< "$KEYWORDS"
  for word in "${KW[@]}"; do
    echo "$word" >> "$WORDLIST_OUT"
    echo "${USERNAME}${word}" >> "$WORDLIST_OUT"
    echo "${word}${USERNAME}" >> "$WORDLIST_OUT"
  done

  if [[ "$YEAR_RANGE" =~ ^[0-9]{4}-[0-9]{4}$ ]]; then
    START=$(echo $YEAR_RANGE | cut -d'-' -f1)
    END=$(echo $YEAR_RANGE | cut -d'-' -f2)
    for (( y=$START; y<=$END; y++ )); do
      echo "${USERNAME}${y}" >> "$WORDLIST_OUT"
      for word in "${KW[@]}"; do
        echo "${word}${y}" >> "$WORDLIST_OUT"
        echo "${USERNAME}${word}${y}" >> "$WORDLIST_OUT"
      done
    done
  fi

  if [[ -n "$TARGET_URL" ]]; then
    echo -e "\n🌐 Downloading $TARGET_URL for CEWL..."
    wget -q "$TARGET_URL" -O "$HTMLFILE"
    if [[ -s "$HTMLFILE" ]]; then
      if command -v cewl >/dev/null; then
        cewl -w "$CEWLFILE" "$HTMLFILE" --offline
        cat "$CEWLFILE" >> "$WORDLIST_OUT"
        echo -e "${GRN}✔ CEWL words added from offline HTML${RST}"
      else
        echo -e "${RED}❌ CEWL not found. Run: sudo apt install cewl${RST}"
      fi
    else
      echo -e "${RED}❌ Failed to fetch or save HTML.${RST}"
    fi
  fi

  sort -u "$WORDLIST_OUT" -o "$WORDLIST_OUT"
  echo -e "${GRN}✅ Wordlist saved: $WORDLIST_OUT${RST}"

  read -p "🔁 Use this wordlist to start cracking now? (y/n): " NEXT
  [[ "$NEXT" =~ ^[Yy]$ ]] && WORDLIST="$WORDLIST_OUT" || exit 0
fi

# === Cracking Workflow ===
[[ -z "$WORDLIST" ]] && read -e -p "📚 Wordlist (default: /usr/share/wordlists/rockyou.txt): " WORDLIST
WORDLIST=${WORDLIST:-/usr/share/wordlists/rockyou.txt}

read -e -p "📁 NTLM hash file: " HASH_FILE
[[ ! -f "$HASH_FILE" ]] && echo -e "${RED}❌ Hash file not found.${RST}" && exit 1
[[ ! -f "$WORDLIST" ]] && echo -e "${RED}❌ Wordlist not found.${RST}" && exit 1

echo -e "\n📏 Select Hashcat rule set:"
RULE_DIR="/usr/share/hashcat/rules"
RULES=($(find "$RULE_DIR" -maxdepth 1 -name "*.rule" | sort))
for i in "${!RULES[@]}"; do echo "  [$i] $(basename "${RULES[$i]}")"; done
echo "  [C] Custom rule path"
read -p "🎯 Choice: " RULE_CHOICE

[[ "$RULE_CHOICE" =~ ^[Cc]$ ]] && read -e -p "📂 Enter path: " CUSTOM_RULE && RULE_SELECTED="$CUSTOM_RULE" || RULE_SELECTED="${RULES[$RULE_CHOICE]}"
[[ ! -f "$RULE_SELECTED" ]] && echo -e "${RED}❌ Rule file not found.${RST}" && exit 1

echo -e "\n⚙️ Choose engine:"
echo "  [1] Hashcat 🐱"
echo "  [2] John 🔪"
echo "  [3] Both 💣"
read -p "🔢 Engine: " ENGINE_CHOICE

GPU_FLAGS=""
[[ "$ENGINE_CHOICE" =~ [13] ]] && read -p "🧠 Enable GPU tuning? (y/n): " GPU_OPT && [[ "$GPU_OPT" =~ ^[Yy]$ ]] && GPU_FLAGS="--opencl-device-types 1 --force"

cut -d ':' -f 4 "$HASH_FILE" | grep -v '^$' | sort -u > hashes.ntlm
cut -d ':' -f 1,4 "$HASH_FILE" > john_hashes.txt

spinner() {
  local pid=$!
  local spinstr='|/-\'
  echo -ne "🔄 Cracking... "
  while kill -0 $pid 2>/dev/null; do
    printf " [%c]  " "$spinstr"
    spinstr=${spinstr#?}${spinstr%${spinstr#?}}
    sleep 0.1
    printf "\b\b\b\b\b\b"
  done
  echo -e " ${GRN}✔ Done${RST}"
}

[[ "$ENGINE_CHOICE" =~ [13] ]] && {
  echo -e "\n🐱 Running Hashcat with $(basename "$RULE_SELECTED")..."
  hashcat -m $MODE -a 0 hashes.ntlm "$WORDLIST" -r "$RULE_SELECTED" $GPU_FLAGS --outfile "$OUTFILE" --quiet &
  spinner
  echo -e "\n📦 Hashcat Results:"
  hashcat -m $MODE --show hashes.ntlm
}

[[ "$ENGINE_CHOICE" =~ [23] ]] && {
  echo -e "\n🔪 Running John the Ripper..."
  john --format=NT --wordlist="$WORDLIST" john_hashes.txt > /dev/null
  echo -e "\n📦 John Results:"
  john --show --format=NT john_hashes.txt > "$JOHNOUT"
  cat "$JOHNOUT"
}

# === HTML Dashboard Export ===
echo "<html><head><title>CatNip Dashboard</title></head><body><h2>🐾 Cracked Passwords</h2><table border=1><tr><th>User</th><th>Password</th></tr>" > "$HTMLREPORT"
grep ':' "$OUTFILE" | while IFS=':' read -r hash pass; do
  user=$(grep "$hash" "$HASH_FILE" | cut -d ':' -f 1)
  echo "<tr><td>$user</td><td>$pass</td></tr>" >> "$HTMLREPORT"
done
grep ':' "$JOHNOUT" | while IFS=':' read -r user pass _; do
  echo "<tr><td>$user</td><td>$pass</td></tr>" >> "$HTMLREPORT"
done

# ... (snipped for brevity, will append to HTML export in real script)

# === HTML Dashboard Export ===
echo "<html><head><title>CatNip Dashboard</title></head><body><h2>🐾 Cracked Passwords</h2><table border=1><tr><th>User</th><th>Password</th></tr>" > "$HTMLREPORT"
grep ':' "$OUTFILE" | while IFS=':' read -r hash pass; do
  user=$(grep "$hash" "$HASH_FILE" | cut -d ':' -f 1)
  echo "<tr><td>$user</td><td>$pass</td></tr>" >> "$HTMLREPORT"
done
grep ':' "$JOHNOUT" | while IFS=':' read -r user pass _; do
  echo "<tr><td>$user</td><td>$pass</td></tr>" >> "$HTMLREPORT"
done
echo "</table><p>Generated: $(date)</p></body></html>" >> "$HTMLREPORT"

echo -e "\n📊 Dashboard saved: ${CYN}$HTMLREPORT${RST}"

# === Auto-open dashboard if xdg-open available ===
if command -v xdg-open >/dev/null; then
  xdg-open "$HTMLREPORT" &>/dev/null &
  echo -e "${GRN}🌐 Dashboard opened in browser.${RST}"
else
  echo -e "${YEL}🛈 xdg-open not found. Open the dashboard manually:${RST}"
  echo -e "    file://$(realpath "$HTMLREPORT")"
fi

echo -e "${MAG}✨ CatNip v3.1.1 — Now opens the dashboard for you 😼${RST}"
