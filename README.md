# init.vim
My Neovim configuration file

# Install
1. How to install Neovim:
https://github.com/neovim/neovim/wiki/Installing-Neovim  

2. Get this configuration file by cloning the repo in `~/.config/nvim`:
  ```
  git clone git@github.com:CLevasseur/init.vim.git ~/.config/nvim
  ```

3. Add support for plugins using python:
  ```
  pip2 install neovim  # python 2.X
  pip3 install neovim  # python 3.X
  ```

4. Install plugins
  ```
  $ vim
  :PlugInstall
  ```

5. Symlink solarized colorscheme to `colors` folder: 
  ```
  mkdir ~/.config/nvim/colors/
  ln -s ~/.config/nvim/plugged/vim-colors-solarized/colors/solarized.vim ~/.config/nvim/colors/
  ```  

5. Powerline fonts used by `vim-airline` plugin are available at https://github.com/powerline/fonts

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

" File finder  
Plug 'kien/ctrlp.vim'  

" Quickly comment one or more lines  
Plug 'https://github.com/scrooloose/nerdcommenter.git'  

" See git additions/removal/updates not comitted yet  
Plug 'airblade/vim-gitgutter'  

" Used to select pattern with multiple cursors  
Plug 'terryma/vim-multiple-cursors'  

" Go to character  
Plug 'easymotion/vim-easymotion'  

" Syntax checker  
Plug 'scrooloose/syntastic'  
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
```
