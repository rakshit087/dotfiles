# My ![Ubuntu](https://img.shields.io/badge/Ubuntu-E95420?style=for-the-badge&logo=ubuntu&logoColor=white) dotfiles

## System Info
- OS: Ubuntu 20.04.3 LTS
- DE: Gnome 3
- Shell: zsh
- Icon Pack: Numix Circle

## My Extensions
- Clipboard Indicator: Saves a clipboard history.
- User Themes: To change user themes
- Dash to Dock: To Customize Dock

## Notes on Using Ubuntu📓

### 🔷 Changing Default Shell
I am using fish shell as my default shell. This can be done by the chsh command where chsh stands for change shell

`chsh -s /usr/bin/fish`

### 🔷 Removing Snaps
It's just a personal preference, but I don't like snaps. To remove them from Ubuntu, I used

`sudo apt remove snapd`  
`sudo umount /dev/loop*`  
`sudo rm -rf /snap`  
`sudo rm -rf /var/lib/snapd`  
`sudo rm -rf /etc/systemd/system/snap`

### 🔷 Loading dconf Configurations
Gnome uses dconf for configurations. Dconf stores its data in a binary format rather than plain text files.
To dump dconf data I used:

`dconf dump / > ~/.config/dconf/user.conf`

This .config file can be loaded by

`dconf load / < ~/.config/dconf/user.conf`

### 🔷 Setting App Switching to current tab only
This can be done by

`gsettings set org.gnome.shell.app-switcher current-workspace-only true`

I had dumped this to user.conf too.
