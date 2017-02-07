# init.vim
My Neovim configuration file

# Install
1. How to install Neovim:
https://github.com/neovim/neovim/wiki/Installing-Neovim  

2. Get this configuration file by cloning the repo in `~/.config/nvim`:
  ```
  git clone https://github.com/CLevasseur/init.vim.git ~/.config/nvim
  ```

3. Add support for plugins using python:
  ```
  pip2 install neovim  # python 2.X
  pip3 install neovim  # python 3.X
  ```

4. Install vim-plug:
https://github.com/junegunn/vim-plug

5. Install plugins
  ```
  $ vim
  :PlugInstall
  ```

6. Install solarized colorscheme for your terminal, on gnome in can be done by following the instructions at:
https://github.com/Anthony25/gnome-terminal-colors-solarized


7. Symlink solarized colorscheme to `colors` folder: 
  ```
  mkdir ~/.config/nvim/colors/
  ln -s ~/.config/nvim/plugged/vim-colors-solarized/colors/solarized.vim ~/.config/nvim/colors/
  ```  

8. Powerline fonts used by `vim-airline` plugin are available at https://powerline.readthedocs.io/en/master/installation.html#installation-on-various-platforms

# Plugins installed
```
" Deoplete for autocompletion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Python completion integrated in deoplete
Plug 'zchee/deoplete-jedi', { 'for': ['python'] }
" Javascript completion integrated in deoplete
Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx'] }
" File explorer
Plug 'scrooloose/nerdtree'
" Fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Quickly comment one or more lines
Plug 'https://github.com/scrooloose/nerdcommenter.git'
" See git additions/removal/updates not comitted yet
Plug 'airblade/vim-gitgutter'
"
Plug 'https://github.com/tpope/vim-fugitive.git'  "'tpope/vim-fugitive.git'
" Used to select pattern with multiple cursors
Plug 'terryma/vim-multiple-cursors'
" Go to character
Plug 'easymotion/vim-easymotion'
" Syntax checker
Plug 'w0rp/ale'
" Syntax checker to be used with syntastic for python
Plug 'nvie/vim-flake8'
" Solarized colorscheme
Plug 'altercation/vim-colors-solarized'
" Snippets
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
" Python related
Plug 'vim-scripts/indentpython.vim'
" Async execution library used by many plugins
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
" Used to grep patterns across files
Plug 'https://github.com/Shougo/unite.vim.git'
" Status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" display available markers
Plug 'kshenoy/vim-signature'
Plug 'tpope/vim-obsession', { 'do': 'vim -u NONE -c \"helptags vim-obsession/doc\" -c q' }
```
