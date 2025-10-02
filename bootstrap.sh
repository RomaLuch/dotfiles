#!/usr/bin/env bash
set -e

echo "🔧 Подготавливаю окружение..."

# ------------------------------
# Создаём базовые каталоги
# ------------------------------
mkdir -p ~/.config
mkdir -p ~/.local/bin
echo "📂 Базовые каталоги созданы."

# ------------------------------
# Пакеты
# ------------------------------
general=(
    wget
    curl
    git
    unzip
    vim
    stow          # <-- добавляем stow сюда
)

hyprland=(
    hyprpaper
    hyprlock
    hypridle
    xdg-desktop-portal-hyprland
)

apps=(
    alacritty
    vlc
    nwg-dock-hyprland
    waybar
    wofi
    neovim
)

tools=(
    htop
    zsh
    openssh
)

all_packages=("${general[@]}" "${hyprland[@]}" "${apps[@]}" "${tools[@]}")

is_installed() {
    pacman -Qq "$1" &> /dev/null
}

install_packages() {
    for pkg in "$@"; do
        if ! is_installed "$pkg"; then
            echo ":: Устанавливаем $pkg ..."
            sudo pacman -S --needed --noconfirm "$pkg"
        else
            echo ":: $pkg уже установлен"
        fi
    done
}

echo "📦 Устанавливаем пакеты через pacman..."
install_packages "${all_packages[@]}"

# ------------------------------
# Разворачиваем dotfiles через stow
# ------------------------------
DOTFILES_DIR="$HOME/dotfiles"

if [ -d "$DOTFILES_DIR" ]; then
    cd "$DOTFILES_DIR"
    echo "🔗 Линкуем dotfiles через stow..."
    stow -v */
else
    echo "⚠️ Папка $DOTFILES_DIR не найдена! Клонируйте репозиторий dotfiles сначала."
fi

echo "✅ Bootstrap завершён! Все конфиги и пакеты установлены."

