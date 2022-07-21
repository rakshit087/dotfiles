# My ![Gnome](https://img.shields.io/badge/Gnome-E?style=for-the-badge&logo=gnome&logoColor=white) dotfiles

## System Info

- OS: EndeavourOS
- DE: Gnome 42.3
- Shell: zsh
- Icon Pack: Numix Circle
- Theme: Adwaita

## My Extensions

- [Clipboard Indicator](https://extensions.gnome.org/extension/779/clipboard-indicator/): Saves a clipboard history.
- [User Themes](https://extensions.gnome.org/extension/19/user-themes/): To change user themes

## Achieving the same setup📓

### 🔷 Changing Default Shell

I am using zsh shell as my default shell. This can be done by the chsh command where chsh stands for change shell

`chsh -s /usr/bin/zsh`

### 🔷 Setting App Switching to current tab only

This can be done by

`gsettings set org.gnome.shell.app-switcher current-workspace-only true`

### 🔷 Removing Snaps (If you use Ubuntu)

It's just a personal preference, but I don't like snaps. To remove them from Ubuntu, I used

`sudo apt remove snapd`  
`sudo umount /dev/loop*`  
`sudo rm -rf /snap`  
`sudo rm -rf /var/lib/snapd`  
`sudo rm -rf /etc/systemd/system/snap`
