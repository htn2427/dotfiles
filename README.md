# dotfiles

This directory contains the dotfiles for my system

## Requirements

### Zsh

```sh
chsh -s $(which zsh)
# log out system
echo $SHELL
$SHELL --version
```

### remove Vim

```sh
sudo pacman -Rns vim
```

### Git

```sh
sudo pacman -S git
```

### Yay

```sh
cd ~/Downloads && sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
```

### fonts

```sh
sudo pacman -S ttf-nerd-fonts-symbols-mono ttf-jetbrains-mono-nerd ttf-noto-nerd ttf-cascadia-mono-nerd ttf-firacode-nerd
```

### utils

```sh
sudo pacman -S fzf ripgrep neovim wezterm mpv tmux wl-clipboard zoxide stow lazygit chafa yazi ffmpegthumbnailer p7zip jq poppler fd imagemagick
yay -S oh-my-posh
```

## Installation and setup

First, check out the dotfiles repo in your $HOME directory using git

```sh
git clone https://github.com/htn2427/dotfiles
cd ~/dotfiles
# Backup zshrc
mv ~/.zshrc ~/.zshrc.bak

stow -d ~/dotfiles -t ~ home
```

### Tmux

```sh
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
tmux
tmux source ~/.tmux.conf
# Ctrl+A I
```

### Reflector

```sh
reflector --list-countries
```

```sh
cat /etc/pacman.d/mirrorlist
cat /etc/xdg/reflector/reflector.conf
sudo cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak
nvim /etc/xdg/reflector/reflector.conf
# Add this line to reflector.conf
# --country HK,SG,TH,JP,VN
```

Enable and start reflector systemd timer

```sh
sudo systemctl enable reflector.timer
sudo systemctl start reflector.timer
```

By default, it will start `reflector.service` once in a week. If you don't want to wait for the scheduled time, you can start the reflector.service to immediately update the pacman's mirror list:

```sh
sudo systemctl start reflector.service
```

### SSH Github

```sh
ls -al ~/.ssh
ssh-keygen -t ed25519 -C "xxx@gmail.com"
cat ~/.ssh/id_ed25519.pub
```

[Add SSH keys](https://github.com/settings/keys)

```sh
git config --global user.name "xxx"
git config --global user.email "xxx@gmail.com"
```

```sh
git remote -v
git remote set-url origin git@github.com:xxx
```

### mount filesystem

```sh
sudo lsblk -o NAME,FSTYPE,LABEL,UUID,MOUNTPOINT
sudo mkdir -p /mnt/data
sudo nvim /etc/fstab
# /etc/fstab
LABEL=hpd /mnt/data ext4 defaults 0 2
sudo mount -a
systemctl daemon-reload
```

## Postgres

```sh
# Sync package database and install PostgreSQL
sudo pacman -Sy postgresql

# Create the postgres data directory with CoW disabled
sudo mkdir -p /var/lib/postgres
sudo chattr +C /var/lib/postgres
sudo mkdir /var/lib/postgres/data

# Set correct ownership and permissions
sudo chown postgres:postgres /var/lib/postgres
sudo chown postgres:postgres /var/lib/postgres/data
sudo chmod 750 /var/lib/postgres
sudo chmod 750 /var/lib/postgres/data

# Initialize the database as postgres user
sudo -u postgres initdb -D /var/lib/postgres/data

# Start and enable PostgreSQL service
sudo systemctl enable postgresql
sudo systemctl start postgresql

# Verify the service is running
sudo systemctl status postgresql

# reboot
sudo su - postgres
```
