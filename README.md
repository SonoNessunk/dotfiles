# Dotfiles

Questa repository contiene i miei **dotfiles personali**, gestiti con [GNU Stow](https://www.gnu.org/software/stow/).
L'obiettivo è mantenere una configurazione portabile e facilmente replicabile su qualsiasi sistema.

## 🛠️ Requisiti

Alcuni pacchetti che conviene avere già installati:

> ℹ️ Non è necessario installare tutti i pacchetti per utilizzare questi dotfiles. Ogni pacchetto serve solo se vuoi sfruttare anche la relativa configurazione presente nella repository.

- `alacritty`

- `tmux`

- `zsh`

- `oh-my-zsh`

- `noto-fonts` `noto-fonts-cjk` `noto-fonts-emoji` `noto-fonts-extra`

- `ttf-cascadia-code` `ttf-cascadia-code-nerd` `ttf-cascadia-mono-nerd`

- `ttf-fira-code` `ttf-firacode-nerd` `ttf-fira-mono` `ttf-fira-sans`

- `hyprland`

- `hyprcursor`

- `hyprgraphics`

- `hyprland-qt-support`

- `hyprland-qtutils`

- `hyprlock`

- `hyprpaper`

- `hyprpicker`

- `hyprpolkitagent`

- `hyprutils`

- `nwg-look`

- `qt5-wayland`

- `qt5ct`

- `qt6-wayland`

- `qt6ct`

- `cliphist`

- `dolphin`

- `fastfetch`

- `mako`

- `nm-connection-editor`

- `pavucontrol`

- `pipewire`

- `pipewire-alsa`

- `pipewire-jack`

- `pipewire-pulse`

- `waybar`

- `wl-clipboard`

- `xdg-desktop-portal`

- `xdg-desktop-portal-gtk`

- `xdg-desktop-portal-hyprland`

- `xdg-user-dirs`

- `yazi`

- `wireplumber`

- `os-prober`

### Arch linux

```bash
sudo pacman -Syu alacritty tmux zsh noto-fonts noto-fonts-cjk \
noto-fonts-emoji noto-fonts-extra ttf-cascadia-code \
ttf-cascadia-code-nerd ttf-cascadia-mono-nerd ttf-fira-code \
ttf-firacode-nerd ttf-fira-mono ttf-fira-sans hyprland hyprcursor \
hyprgraphics hyprland-qt-support hyprland-qtutils hyprlock hyprpaper \
hyprpicker hyprpolkitagent hyprutils nwg-look qt5-wayland qt5ct \
qt6-wayland qt6ct cliphist dolphin fastfetch mako nm-connection-editor \
pavucontrol pipewire pipewire-alsa pipewire-jack pipewire-pulse waybar \
wl-clipboard xdg-desktop-portal xdg-desktop-portal-gtk \
xdg-desktop-portal-hyprland xdg-user-dirs yazi wireplumber os-prober
```

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

## 📦 Setup

Per installare i dotfiles basta clonare la repository.

> ⚠️ i comandi sotto stanti clonerranno la repo nella home directory
> Usare stow quando si ha già delle configurazioni potrebbe portare a degli errori. Si consiglia di creare dei backup delle proprie configurazioni o nel caso eliminarle.
> Stow indicherà nel caso ce un file esistente che cerca di sovrascriverlo, non lo fara.

🌐 HTTPS setup

```bash
git clone https://github.com/SonoNessunk/dotfiles.git $HOME/
cd dotfiles
```

🔑 SSH setup

```bash
git clone git@github.com:SonoNessunk/dotfiles.git $HOME/
cd dotfiles
```

Poi lanciare:

```
stow . --no-folding
```

> ⚠️ Attenzione, dopo aver eseguito il comando, non eliminare la repo. Questo è perché GNU/Stow crea dei Symlinks ovvero Collegamenti.
> Se vuoi eliminare la repo ti consiglio di copiarti manualmente le configurazioni.

### 🔎 Cosa significa?

- **`stow`** → utility che crea symlink gestendo dotfiles in maniera ordinata.
- **`.`** → indica che devono essere considerate tutte le directory presenti nella repo.
- **`--no-folding`** → impedisce che Stow crea dei Symlinks alle cartelle ma solo ai file. questo è per impedire di inglobare anche file aggiunti dopo dentro la cartella (mi è successo con oh-my-zsh dove veniva symlinkato ogni cosa all'interno)

> ⚠️ Assicurati di lanciare il comando dalla root della repository.

## Altre config

```bash
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
git config --global core.editor "nano"

gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
xdg-user-dirs-update

systemctl --user enable --now waybar.service
systemctl --user enable --now hyprpolkitagent.service
systemctl --user enable --now hyprpaper.service
```

### Graphite-GTK-Dark

```bash
git clone git@github.com:vinceliuice/Graphite-gtk-theme.git
cd Graphite-gtk-theme
./install.sh -c dark -s standard -l --tweaks darker rimless
```

### Graphite-KDE-Dark

```bash
git clone https://github.com/vinceliuice/Graphite-kde-theme.git
cd Graphite-kde-theme
./install.sh -c dark --rimless
```

> ⚠️ Entrambi i temi sono stati scaricati solo nella versione dark, nel caso cambia i paramentri usi nel ./install.sh per vedere quali sono disponibili esegui `./install.sh --help`

```bash
rm -fr ~/Graphite-gtk-theme ~/Graphite-kde-theme
```

---

## 📂 Contenuto

Questi dotfiles includono la configurazione per:

- **Zsh**
  
  - `.zshrc` → configurazione principale
  - `.zshenv` → variabili d’ambiente e inizializzazione
  - [Oh My Zsh](https://ohmyz.sh/) → framework per estendere Zsh

- **Nano**
  
  - `.nanorc` → sintassi e opzioni personalizzate

- **Alacritty**
  
  - Configurazione del terminale GPU-accelerated

- **Fastfetch**
  
  - Info di sistema con output personalizzato

- **Hyprland**
  
  - Config principale di Hyprland (tiling window manager)
  - **Hyprpaper** → gestione wallpaper
  - **Hyprlock** → lockscreen minimale

- **Tmux**
  
  - Multiplexer di terminale con bindings personalizzati

- **Waybar**
  
  - Barra superiore/inferiore per Wayland con moduli custom

- **Yazi**
  
  - File manager terminal-based moderno e veloce

---
