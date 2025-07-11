#!/bin/bash

# === CatNip v2.8 ===
VERSION="2.8"
MODE=1000
OUTFILE="cracked_ntlm.txt"
JOHNOUT="cracked_john.txt"

RED='\033[0;31m'
GRN='\033[0;32m'
YEL='\033[1;33m'
BLU='\033[1;34m'
MAG='\033[1;35m'
CYN='\033[1;36m'
RST='\033[0m'

clear
echo -e "${MAG}"
echo "     /\_/\    CatNip NTLM Cracker v$VERSION"
echo "    ( o.o )   by GreyRhinoSecurity 🐾 and Kali-Pig"
echo "     > ^ <    hashcat + john + rules + benchmark"
echo -e "${RST}"
echo -e "${MAG}╔════════════════════════════════════════════════════════════╗"
echo -e "║ ${BLU}CatNip - Terminal Edition${MAG} | ${YEL}v$VERSION${MAG}| full cracking engine 🧠   ║"
echo -e "╚════════════════════════════════════════════════════════════╝${RST}"

echo -e "\n🧠 ${CYN}Select mode:${RST}"
echo "  [1] Crack NTLM Hashes 🔓"
echo "  [2] Run Engine Benchmarks ⚡"
read -p "🔢 Choice: " MODE_CHOICE

if [[ "$MODE_CHOICE" == "2" ]]; then
  echo -e "\n⚙️  Running ${YEL}Hashcat Benchmark${RST} (mode $MODE)..."
  hashcat -b -m $MODE
  echo -e "\n⚙️  Running ${YEL}John Benchmark${RST} (NTLM format)..."
  john --test --format=NT
  echo -e "\n${GRN}✅ Benchmark complete.${RST}"
  exit 0
fi

read -e -p "📁 Path to NTLM hash file: " HASH_FILE
read -e -p "📚 Wordlist (default: /usr/share/wordlists/rockyou.txt): " WORDLIST
WORDLIST=${WORDLIST:-/usr/share/wordlists/rockyou.txt}

echo -e "\n📏 ${CYN}Select a Hashcat rule set:${RST}"
RULE_DIR="/usr/share/hashcat/rules"
RULES=($(find "$RULE_DIR" -maxdepth 1 -name "*.rule" | sort))
for i in "${!RULES[@]}"; do
  echo "  [$i] $(basename "${RULES[$i]}")"
done
echo "  [C] Provide custom path"
read -p "🎯 Choose rule index or [C]: " RULE_CHOICE

if [[ "$RULE_CHOICE" =~ ^[Cc]$ ]]; then
  read -e -p "🔍 Enter full path to custom rule file: " CUSTOM_RULE
  RULE_SELECTED="$CUSTOM_RULE"
else
  RULE_SELECTED="${RULES[$RULE_CHOICE]}"
fi

echo -e "📂 Using rule set: ${YEL}$RULE_SELECTED${RST}"

echo -e "\n🤖 ${CYN}Choose engine(s):${RST}"
echo "  [1] Hashcat 🐱"
echo "  [2] John the Ripper 🔪"
echo "  [3] Both (Advanced) 💣"
read -p "🔢 Engine: " ENGINE_CHOICE

GPU_FLAGS=""
if [[ "$ENGINE_CHOICE" == "1" || "$ENGINE_CHOICE" == "3" ]]; then
  read -p "⚙️  Enable GPU tuning for Hashcat? (y/n): " GPU_OPT
  if [[ "$GPU_OPT" =~ ^[Yy]$ ]]; then
    GPU_FLAGS="--opencl-device-types 1 --force"
  fi
fi

if [ ! -f "$HASH_FILE" ]; then
  echo -e "${RED}❌ Error: Hash file not found.${RST}"
  exit 1
fi

cut -d ':' -f 4 "$HASH_FILE" | grep -v '^$' | sort -u > hashes.ntlm
cut -d ':' -f 1,4 "$HASH_FILE" > john_hashes.txt

spinner() {
  local pid=$!
  local delay=0.1
  local spinstr='|/-\'
  echo -ne "🔄 Cracking in progress: "
  while kill -0 $pid 2>/dev/null; do
    local temp=${spinstr#?}
    printf " [%c]  " "$spinstr"
    spinstr=$temp${spinstr%"$temp"}
    sleep $delay
    printf "\b\b\b\b\b\b"
  done
  echo -e " ${GRN}✔ Done${RST}"
}

if [[ "$ENGINE_CHOICE" == "1" || "$ENGINE_CHOICE" == "3" ]]; then
  echo -e "\n🐱 ${GRN}Running Hashcat with rule set: $(basename "$RULE_SELECTED")${RST}"
  hashcat -m $MODE -a 0 hashes.ntlm "$WORDLIST" -r "$RULE_SELECTED" $GPU_FLAGS --outfile "$OUTFILE" --quiet &
  spinner
  echo -e "\n📦 ${BLU}Hashcat Results:${RST}"
  hashcat -m $MODE --show hashes.ntlm
fi

if [[ "$ENGINE_CHOICE" == "2" || "$ENGINE_CHOICE" == "3" ]]; then
  echo -e "\n🔪 ${YEL}Running John the Ripper...${RST}"
  john --format=NT --wordlist="$WORDLIST" john_hashes.txt > /dev/null
  echo -e "\n📦 ${BLU}John Results:${RST}"
  john --show --format=NT john_hashes.txt > "$JOHNOUT"
  cat "$JOHNOUT"
  echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
  cracked=$(grep -c ':' "$JOHNOUT")
  total=$(wc -l < john_hashes.txt)
  echo -e "🔓 Cracked: ${GRN}$cracked${RST} / ${YEL}$total${RST} NTLM hashes"
fi

echo -e "\n🕓 Completed at: ${CYN}$(date)${RST}"
echo -e "${MAG}✨ CatNip v$VERSION — GreyRhinoSecurity | Crack with precision 😼${RST}"
