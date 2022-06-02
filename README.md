# extra-fzf.fish

Gutted fork of [jethrokuan/fzf](https://github.com/jethrokuan/fzf) with some extras to work with [PatrickF1/fzf.fish](https://github.com/PatrickF1/fzf.fish).

## Usage

Call `fzf_configure_dunder_bindings` somewhere in `config.fish`.
Default keymaps are:

- `Alt + c` - cd into sub-directories (recursively searched)
- `Alt + Shift + c` - cd into sub-directories, including hidden ones
- `Alt + o` - open a file/dir using xdg-open or open command
- `Alt + g` - live ripgrep
