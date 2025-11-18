#!/usr/bin/env zsh
# pumpkane-cli.zsh
# CLI installer & manager for the Pumpkane Oh My Zsh theme

THEME_URL="https://raw.githubusercontent.com/ColinZeDev/pumpkane-oh-my-zsh-theme/refs/heads/main/pumpkane.zsh-theme"
THEME_PATH="$HOME/.oh-my-zsh/custom/themes/pumpkane.zsh-theme"

function print_header() {
    echo "===================================="
    echo "      Pumpkane Zsh Theme CLI        "
    echo "===================================="
}

function install_theme() {
    if [[ -f "$THEME_PATH" ]]; then
        echo "Existing theme found. Backing up to ${THEME_PATH}.bak"
        cp "$THEME_PATH" "$THEME_PATH.bak"
    fi

    echo "Downloading Pumpkane theme..."
    curl -fsSL "$THEME_URL" -o "$THEME_PATH"

    if [[ $? -eq 0 ]]; then
        echo "Theme installed successfully to $THEME_PATH"
    else
        echo "Failed to download theme!"
        exit 1
    fi
}

function set_theme() {
    if ! grep -q 'ZSH_THEME="pumpkane"' ~/.zshrc; then
        echo 'Setting Pumpkane as your Oh My Zsh theme...'
        sed -i.bak 's/^ZSH_THEME=.*$/ZSH_THEME="pumpkane"/' ~/.zshrc
        echo "Theme set! Original .zshrc backed up as .zshrc.bak"
    else
        echo "Pumpkane theme already set in .zshrc"
    fi
}

function set_nickname() {
    read "nickname?Enter a nickname for your prompt (leave empty to skip): "
    if [[ -n "$nickname" ]]; then
        if grep -q '^export CUSTOMUSERNICKNAME=' ~/.zshrc; then
            sed -i.bak "s/^export CUSTOMUSERNICKNAME=.*/export CUSTOMUSERNICKNAME=\"$nickname\"/" ~/.zshrc
        else
            echo "export CUSTOMUSERNICKNAME=\"$nickname\"" >> ~/.zshrc
        fi
        echo "Nickname set! Reload your shell to see it."
    fi
}

function reload_shell() {
    echo "Reloading Zsh..."
    source ~/.zshrc
    echo "Done!"
}

# -------------------
print_header
install_theme
set_theme
set_nickname
reload_shell
