# Dotfiles

This repository contains my **personal dotfiles**, managed with [GNU Stow](https://www.gnu.org/software/stow/).
The goal is to maintain a portable configuration that can be easily replicated on any system.

## Requirements

### Git

```bash
sudo pacman -S git
```

### Stow

```bash
sudo pacman -S stow
```

### fastfetch

```bash
sudo pacman -S fastfetch
```

### kitty

```bash
sudo pacman -S kitty
```

### nano

```bash
sudo pacman -S nano
```

### tmux

```bash
sudo pacman -S tmux
```

### yazi

```bash
sudo pacman -S yazi
```

## Installation

First, check out the dotfiles repo in your home directory using git

#### HTTPS
```bash
git clone https://github.com/SonoNessunk/dotfiles.git $HOME
cd ~/dotfiles
```

#### SSH
```bash
git clone git@github.com:SonoNessunk/dotfiles.git $HOME
cd ~/dotfiles
```

then use GNU stow to create symlinks

```
stow . --no-folding
```
