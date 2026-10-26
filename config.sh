# Author: maodun
# Modifydate: 2026.10.25



set -euo pipefail



# 配置文件
stow -t ~ bash
stow -t ~ fastfetch
stow -t ~ fcitx5
stow -t ~ foot
stow -t ~ fuzzel
stow -t ~ git
stow -t ~ helix
stow -t ~ niri
stow -t /etc nvidia 
stow -t ~ ssh
stow -t ~ yazi



# 硬件驱动
sudo pacman -S amd-ucode mesa vulkan-radeon nvidia-open nvidia-utils 
sudo mkinitcpio -P

sudo pacman -S pipewire wireplumber pipewire-pulse pipewire-alsa pipewire-jack

sudo pacman -S bluez bluez-utils 
sudo systemctl enable --now bluetooth

sudo pacman -S pacman-contrib
sudo systemctl enable --now paccache.timer

sudo pacman -S tlp
sudo sed -i -E 's/^#\s*STOP_CHARGE_THRESH_BAT0=.*/STOP_CHARGE_THRESH_BAT0=80/' /etc/tlp.conf
sudo systemctl enable --now tlp.service

sudo pacman -S brightnessctl



# 桌面环境
sudo pacman -S noto-fonts noto-fonts-cjk noto-fonts-emoji ttf-jetbrains-mono-nerd

sudo pacman -S fcitx5 fcitx5-chinese-addons fcitx5-configtool

sudo pacman -S niri xwayland-satellite xdg-desktop-portal-wlr fuzzel foot

sudo pacman -S firefox git fastfetch 7zip fd ripgrep



# 网络设置
sudo pacman -S openssh
mkdir -p ~/.ssh
cd ~/.ssh
ssh-keygen -t ed25519 -C "githubkey"



# 结束
reboot
