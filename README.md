# Pumpkane Zsh Theme

Pumpkane is a modern, colorful, and informative **Oh My Zsh** theme designed for clarity, aesthetics, and productivity. It features dynamic colors, Git status integration, time-based coloring, and optional nickname display.

---

## Features

* **Dynamic Username Display**
  Shows `realname(nickname)@host` if a `CUSTOMUSERNICKNAME` environment variable is set, otherwise `user@host`.

* **Path Highlighting**
  Current working directory is highlighted with a distinct color for clarity.

* **Git Integration**

  * Shows the current branch.
  * Indicates dirty (✗) or clean (✔) state.
  * Displays ahead/behind commit status relative to the remote.

* **Time-Based Coloring**
  The prompt clock changes color depending on the time of day:

  * Morning: Yellow
  * Afternoon: Light Green
  * Evening/Night: Purple

* **Exit Status Indicator**
  Shows a colored check or cross to indicate the status of the last command.

* **Modern Visuals**

  * Segmented, multi-line layout.
  * Bold, colorful, and easy-to-read prompt symbols.
  * Supports Powerline-style arrows.

---

## Installation

1. **Download the theme** to your oh my zsh themes folder:

```bash
curl -fsSL https://raw.githubusercontent.com/ColinZeDev/pumpkane-oh-my-zsh-theme/refs/heads/main/pumpkane.zsh-theme -o ~/.oh-my-zsh/custom/themes/pumpkane.zsh-theme
```

2. **Set the theme** in your `.zshrc`:

```bash
ZSH_THEME="pumpkane"
```

3. **Optional:** Set a custom nickname:

```bash
export CUSTOMUSERNICKNAME="Hollo"
```

4. **Reload Zsh**:

```bash
source ~/.zshrc
```

---

## Configuration

* **Colors** can be customized by modifying the variables at the top of `pumpkane.zsh-theme`:

```zsh
typeset -g ORANGE="%F{208}"
typeset -g WHITE="%F{255}"
typeset -g PURPLE="%F{141}"
typeset -g CYAN="%F{38}"
typeset -g YELLOW="%F{214}"
typeset -g GREEN="%F{46}"
typeset -g LIGHTRED="%F{9}"
typeset -g RED="%F{196}"
typeset -g BLUE="%F{27}"
typeset -g LIGHTGREEN="%F{82}"
```

* **Nickname Display:** Controlled via the `CUSTOMUSERNICKNAME` environment variable.

---

## Example Prompt

```
╭─[colin(nickname)@linux || ~/projects]-[14:35:42] @  main ✔ ↑1
╰─ %%
```

> The symbols and colors may vary depending on terminal support.

---

## Screenshots

![Prompt Example 1](https://raw.githubusercontent.com/ColinZeDev/pumpkane-oh-my-zsh-theme/refs/heads/main/pumpkane-ss1.png)
![Prompt Example 2]([path/to/screenshot2.png](https://raw.githubusercontent.com/ColinZeDev/pumpkane-oh-my-zsh-theme/refs/heads/main/pumpkane-ss2.png))

---

## License

MIT License © 2025 ColinZeDev

---

## Contributing

Feel free to fork, modify, and submit pull requests. Suggestions for new features or bug reports are welcome!

---

## Notes

* Designed for **Oh My Zsh** with `%F{}` color support.
* Works best with **modern terminals** that support Unicode and Powerline symbols.
* Tested with the **Kitty** & **Konsole** terminal emulators
