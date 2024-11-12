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
sudo pacman -S ttf-nerd-fonts-symbols-mono ttf-jetbrains-mono-nerd ttf-noto-nerd ttf-cascadia-mono-nerd
```

### Zen [zen](https://github.com/zen-browser/desktop?tab=readme-ov-file#arch-based-distributions)

```sh
# for optimized version
yay -S zen-browser-avx2-bin
```

### Node Version Manager [nvm](https://github.com/nvm-sh/nvm)

```sh
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
command -v nvm
nvm ls-remote
nvm install node
```

### utils

```sh
sudo pacman -S fzf ripgrep neovim wezterm mpv tmux wl-clipboard zoxide stow lazygit
yay -S oh-my-posh
```

## Installation and setup

First, check out the dotfiles repo in your $HOME directory using git

```sh
# Backup zshrc
mv ~/.zshrc ~/.zshrc.bak
git clone https://github.com/htn2427/dotfiles
cd ~/dotfiles
stow .
```

### Keyd

```sh
cd ~/Downloads && git clone https://github.com/rvaiya/keyd && cd keyd
make && sudo make install
sudo systemctl enable keyd && sudo systemctl start keyd
sudo cp ~/dotfiles/keyd.conf /etc/keyd/default.conf
sudo keyd reload
```

### Tmux

```sh
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
tmux
tmux source ~/.tmux.conf
# Ctrl+A I
```

### Razer

```sh
sudo pacman -S linux-headers
sudo pacman -S openrazer-daemon
# reboot
sudo gpasswd -a $USER plugdev
yay -S polychromatic
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
# --country VN,HK,SG,TH,JP
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
git remote set-url origin git@github.com:htn2427/dotfiles.git
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
sudo pacman -S postgresql
postgres --version
sudo -u postgres initdb -D /var/lib/postgres/data
```

The output will show the data directory and subdirectories being created:

```
The files belonging to this database system will be owned by user "postgres".
...
creating directory /var/lib/postgres/data ... ok
creating subdirectories ... ok
selecting dynamic shared memory implementation ... posix
selecting default max_connections ... 100
selecting default shared_buffers ... 128MB
...
Performing post-bootstrap initialization ... ok
syncing data to disk ... ok

Success. You can now start the database server using:

pg_ctl -D /var/lib/postgres/data -l logfile start
```

```sh
sudo systemctl enable postgresql
sudo systemctl start postgresql
sudo systemctl status postgresql
# reboot
sudo su - postgres
```
