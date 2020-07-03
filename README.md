# Kitty + Neovim + tmux Ultimate Setup

## Notes

- These instructions were written primarily for <b>Mac</b> but can be translated for Linux and Windows.
- The theme and font used throughout this setup are <b>gruvbox dark</b> <sup>2</sup> and <b>FiraCode Nerd Font</b> <sup>5</sup>.

## Preparation

1. Run `git clone https://github.com/Jrachman/kitty-nvim-tmux-ultimate-setup.git`.

## Kitty

1. Run `curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin`. <sup>1</sup>
2. Open Kitty and click on kitty --> Preferences. This should open up a Vim window with Kitty's settings.
3. Copy and paste the following to the top of the settings file:
```
# vim:fileencoding=utf-8:ft=conf:foldmethod=marker
mouse_hide_wait 0
kitty_mod cmd+shift
map kitty_mod+equal     change_font_size all +2.0
map kitty_mod+minus     change_font_size all -2.0
map kitty_mod+backspace change_font_size all 0
font_family      FiraCode Nerd Font Mono
bold_font        auto
italic_font      auto
bold_italic_font auto
font_size 12.0
macos_titlebar_color background
map alt+left send_text all \x1b\x62
map alt+right send_text all \x1b\x66\

include ./theme.conf
map cmd+d new_window
# map kitty_mod+n new_os_window
```
4. If you do not want to add a theme, please comment out the `include ./theme.conf` in your Kitty Preference file. If you do want a theme, run the following in Kitty to add gruvbox dark: <sup>2</sup>

`git clone --depth 1 https://github.com/dexpota/kitty-themes.git ~/.config/kitty/kitty-themes`

`cd ~/.config/kitty`

`ln -s ./kitty-themes/themes/gruvbox_dark.conf ~/.config/kitty/theme.conf`

5. Now, quit Kitty with CMD-q and reopen to see all of the changes in place.

## Neovim

1. Run the following: 

`brew install neovim` <sup>3</sup>

`sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'` <sup>4</sup>

`mkdir ~/.config/nvim`

`cp <path_to_kitty-nvim-tmux-ultimate-setup_folder>/init.vim ~/.config/nvim/init.vim` <sup>5</sup>

`brew tap homebrew/cask-fonts && brew cask install font-fira-code-nerd-font`

`brew install fzf` <sup>6</sup>

`brew install ripgrep` <sup>7</sup>

2. Run `nvim` (you don't call neovim, you have to call nvim instead), type `:PlugInstall`, and then click Enter.

3. Exit out of Neovim by executing `:q` until you are back in the terminal and then run `nvim` again to see the customizations.

## tmux

1. Run `brew install tmux`. <sup>8</sup>
2. Run `cp <path_to_kitty-nvim-tmux-ultimate-setup_folder>/.tmux.conf ~/.tmux.conf` and then `tmux source-file ~/.tmux.conf`.
3. Run `tmux` then run `nvim`.
4. In Neovim, execute `:Tmuxline` and then `:TmuxlineSnapshot ~/.tmux.conf`. <sup>9</sup>
5. Exit out of Neovim with `:q` and then kill your tmux session with hitting (CTRL-B)-X-Y
6. Now, run `tmux` again and your setup should be complete.

## BONUS: Spotify in Neovim!

https://github.com/srishanbhattarai/neovim-spotify ;)

## References
<sup>1</sup> https://sw.kovidgoyal.net/kitty/binary.html#customizing-the-installation

<sup>2</sup> https://github.com/dexpota/kitty-themes/tree/master/themes

<sup>3</sup> https://github.com/neovim/neovim/wiki/Installing-Neovim

<sup>4</sup> https://github.com/junegunn/vim-plug

<sup>5</sup> https://www.nerdfonts.com/font-downloads

<sup>6</sup> https://github.com/junegunn/fzf

<sup>7</sup> https://github.com/BurntSushi/ripgrep

<sup>8</sup> https://medium.com/@jeongwhanchoi/install-tmux-on-osx-and-basics-commands-for-beginners-be22520fd95e

<sup>9</sup> https://github.com/edkolev/tmuxline.vim#usage
