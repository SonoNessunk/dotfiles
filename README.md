# Dotfiles

Questa repository contiene i miei **dotfiles personali**, gestiti con [GNU Stow](https://www.gnu.org/software/stow/).
L’obiettivo è mantenere una configurazione portabile e facilmente replicabile su qualsiasi sistema.

## 🛠️ Requisiti

Alcuni pacchetti che conviene avere già installati:

> ℹ️ Non è necessario installare tutti i pacchetti per utilizzare questi dotfiles. Ogni pacchetto serve solo se vuoi sfruttare anche la relativa configurazione presente nella repository.

- [`zsh`](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH)
- [`oh-my-zsh`](https://ohmyz.sh/#install))
- [`alacritty`](https://alacritty.org/#Installation)
- [`fastfetch`](https://github.com/fastfetch-cli/fastfetch?tab=readme-ov-file#installation)
- [`hyprland`](https://wiki.hypr.land/Getting-Started/Installation/)
- [`hyprpaper`](https://wiki.hypr.land/Hypr-Ecosystem/hyprpaper/)
- [`hyprlock`](https://wiki.hypr.land/Hypr-Ecosystem/hyprlock/)
- [`tmux`](https://github.com/tmux/tmux/wiki/Installing)
- [`waybar`](https://github.com/Alexays/Waybar?tab=readme-ov-file#installation)
- [`yazi`](https://yazi-rs.github.io/docs/installation)

## 📦 Setup

Per installare i dotfiles basta clonare la repository.

> ⚠️ i comandi sotto stanti clonnearanno la repo nella home directory
> Usare stow quando si ha gia delle configurazioni potrebbe portare a degli errori. Si consiglia di creare dei backup delle proprie configurazioni o nel caso eliminarle.
> Stow indichera nel caso ce un file esistente che cerca di sovrascriverlo, non lo fara.

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
> ⚠️ Attenzione, dopo aver eseguito il comando, non eliminare la repo. Questo è perchè GNU/Stow crea dei Symlinks ovvero Collegamenti.
> Se vuoi elimanare la repo ti consiglio di copiarti manualmente le configurazioni.

### 🔎 Cosa significa?

- **`stow`** → utility che crea symlink gestendo dotfiles in maniera ordinata.
- **`.`** → indica che devono essere considerate tutte le directory presenti nella repo.
- **`--no-folding`** → impedisce che Stow crea dei Symlinks alle cartelle ma solo ai file. questo è per impedire di inglobare anche file aggiunti dopo dentro la cartella (mi è successo con oh-my-zsh dove veniva symlinkato ogni cosa all'interno)

> ⚠️ Assicurati di lanciare il comando dalla root della repository.

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
