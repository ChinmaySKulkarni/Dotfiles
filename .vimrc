" NOTE: Pressing 'K' over any term brings up its man page. (useful in C).

"""Coloring Related Changes. Change color of statusbar depending on mode.

function! InsertStatuslineColor(mode)
	if a:mode == 'i'
		hi statusline guibg=Cyan ctermfg=6 guifg=Black ctermbg=0
	elseif a:mode == 'r'
		hi statusline guibg=Purple ctermfg=5 guifg=Black ctermbg=0
	else
		hi statusline guibg=DarkRed ctermfg=1 guifg=Black ctermbg=0
	endif
endfunction

au InsertEnter * call InsertStatuslineColor(v:insertmode)
au InsertLeave * hi statusline guibg=DarkGrey ctermfg=8 guifg=White ctermbg=15

"Colorscheme of the Gods and same as Sublime \m/.
"colorscheme monokai
"Vim version of monokai. Using this colorscheme since it works better with hlsearch.
colorscheme molokai


"""	Indentation related changes

"Configurations for vim-indent-guides plugin. <Leader> ig
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=4
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=6

"Indentation Guide like sublime. NOTE that there is a space after the last '\'
"below.
:set listchars=tab:\|\ 
:set list

"Set the number of spaces to be inserted when tab is pressed.
set tabstop=4

"Set indenting to 4 spaces. Just like tab.
set shiftwidth=4

"using 'vim-better-whitespace' plug-in which automatically highlights all
"whitespaces.
"Type :StripWhiteSpace to remove all the whitespaces.
"Type :ToggleWhiteSpace to toggle highlighting of whitespaces on/off.

"Load language-specific indentation files.
filetype plugin indent on


"""	Mouse changes/keyboard key remappings

"Enable mouse click to re-position cursor.
set mouse=a

"This is used to change the '<Leader>' key. By default it is '\'.
let mapleader=','

"Source $MYVIMRC reloads the saved $MYVIMRC
nmap <Leader>s :source $MYVIMRC

"Turn off search highlight.
nnoremap <Leader><space> :nohlsearch<CR>


"""	Line number/highlighting related changes

"Set line numbers.
set number

"Highlight current line.
set cursorline

"Allow backspace to delete previous characters.
set backspace=2

"Show the line marking at 100 characters.
set colorcolumn=100


"""	Command information/file information/Status bar configurations

"Show the last command entered in bottom bar.
set showcmd

"Display the name of the file that you are currently working on.
set laststatus=2

"Set the column and line number in the status bar.
set ruler


"""	Search related changes

"Highlight all search matches.
set hlsearch

"Incremental search: Search as characters are entered.
set incsearch

"Case insensitive searching.
set ignorecase
"Smart case searching is enabled when you search and then type '\s'. If you
"type '\s' again, it will disable smart case searching and searching will go
"back to ignorecase.
map \s :set smartcase!<CR>:set smartcase?<CR>

"Don't wrap lines.
set nowrap


"""	Command menu changes

"Visual auto-complete for command menu.
set wildmenu

"Ignore compiled files and other useless files.
set wildignore=*.o,*~,*.pyc,*.swp,*.class

"Change the terminal's title.
set title


"""	Folding related changes

"Enable folding.
set foldenable

"Open most folds by default.
set foldlevelstart=10

"Space used to open/close folds.
nnoremap <space> za

"Fold based on the indent level.
set foldmethod=indent


"""	Auto-Complete, Language related plugins and changes.

"Syntax highlighting.
syntax on
syntax enable

"Prevent annoying preview from coming up everytime you use autocomplete.
set completeopt-=preview

"Syntastic Configurations for syntax checking in code.
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_python_python_use_codec = 1
"Enable balloon error messages.
"let g:syntastic_enable_balloons = 1


"""	Misc.

"Highlights matching parenthesis-like characters.
"NOTE: Using '%' next to a parenthesis takes you to its matching brace.
set showmatch

"Use all enhancements and improvements of vim.
set nocompatible

"Paste text into vim without auto-indent.
set pastetoggle=<F10>

"Invoke Pathogen infect()
execute pathogen#infect()

"Return to last edit position when opening files.
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%


"""NOTE:The following is useful configuration information when building vim from
"source:
"
"See
"http://wikimatze.de/compiling-vim-from-source-for-ubuntu-and-mac-with-rbenv/
"And
"https://github.com/Valloric/YouCompleteMe/wiki/Building-Vim-from-source
""For steps. In the second link, do sudo make instead of
"make VIMRUNTIMEDIR=/usr/share/vim/vim74
"
"Use the following flags with ./configure:
"--with-features=huge \
"--enable-multibyte \
"--enable-rubyinterp \
"--enable-pythoninterp \
"--enable-perlinterp \
"--with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu \
"--enable-perlinterp \
"--enable-luainterp \
"--disable-nls \
"--enable-gui=gnome2 \
"--enable-cscope \
"--prefix=/usr/local \
"--without-x \
"--with-tlib=ncurses
"
"This will give you the following when you do vim --version to see features
"enabled:
"
"VIM - Vi IMproved 7.4 (2013 Aug 10, compiled May 22 2015 16:11:50)
"Included patches: 1-729
"Compiled by chinmay@chinmay-XPS-L421X
"Huge version with GTK2-GNOME GUI.  Features included (+) or not (-):
"+acl             +farsi           +mouse_netterm   +syntax
"+arabic          +file_in_path    +mouse_sgr       +tag_binary
"+autocmd         +find_in_path    -mouse_sysmouse  +tag_old_static
"+balloon_eval    +float           +mouse_urxvt     -tag_any_white
"+browse          +folding         +mouse_xterm     -tcl
"++builtin_terms  -footer          +multi_byte      +terminfo
"+byte_offset     +fork()          +multi_lang      +termresponse
"+cindent         -gettext         -mzscheme        +textobjects
"+clientserver    -hangul_input    +netbeans_intg   +title
"+clipboard       +iconv           +path_extra      +toolbar
"+cmdline_compl   +insert_expand   -perl            +user_commands
"+cmdline_hist    +jumplist        +persistent_undo +vertsplit
"+cmdline_info    +keymap          +postscript      +virtualedit
"+comments        +langmap         +printer         +visual
"+conceal         +libcall         +profile         +visualextra
"+cryptv          +linebreak       +python          +viminfo
"+cscope          +lispindent      -python3         +vreplace
"+cursorbind      +listcmds        +quickfix        +wildignore
"+cursorshape     +localmap        +reltime         +wildmenu
"+dialog_con_gui  -lua             +rightleft       +windows
"+diff            +menu            +ruby            +writebackup
"+digraphs        +mksession       +scrollbind      +X11
"+dnd             +modify_fname    +signs           -xfontset
"-ebcdic          +mouse           +smartindent     +xim
"+emacs_tags      +mouseshape      -sniff           +xsmp_interact
"+eval            +mouse_dec       +startuptime     +xterm_clipboard
"+ex_extra        -mouse_gpm       +statusline      -xterm_save
"+extra_search    -mouse_jsbterm   -sun_workshop    +xpm
"	system vimrc file: "$VIM/vimrc"
"   user vimrc file: "$HOME/.vimrc"
"	2nd user vimrc file: "~/.vim/vimrc"
"   user exrc file: "$HOME/.exrc"
"	system gvimrc file: "$VIM/gvimrc"
"   user gvimrc file: "$HOME/.gvimrc"
"	2nd user gvimrc file: "~/.vim/gvimrc"
"   system menu file: "$VIMRUNTIME/menu.vim"
"   fall-back for $VIM: "/usr/local/share/vim"
"Compilation: gcc -c -I. -Iproto -DHAVE_CONFIG_H -DFEAT_GUI_GTK  -pthread -I/usr/include/gtk-2.0 -I/usr/lib/x86_64-linux-gnu/gtk-2.0/include -I/usr/include/atk-1.0 -I/usr/include/cairo -I/usr/include/gdk-pixbuf-2.0 -I/usr/include/pango-1.0 -I/usr/include/gio-unix-2.0/ -I/usr/include/freetype2 -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -I/usr/include/pixman-1 -I/usr/include/libpng12 -I/usr/include/harfbuzz   -pthread -DORBIT2=1 -D_REENTRANT -I/usr/include/libgnomeui-2.0 -I/usr/include/libart-2.0 -I/usr/include/gconf/2 -I/usr/include/gnome-keyring-1 -I/usr/include/libgnome-2.0 -I/usr/include/libbonoboui-2.0 -I/usr/include/libgnomecanvas-2.0 -I/usr/include/gtk-2.0 -I/usr/include/gdk-pixbuf-2.0 -I/usr/include/gnome-vfs-2.0 -I/usr/lib/x86_64-linux-gnu/gnome-vfs-2.0/include -I/usr/include/dbus-1.0 -I/usr/lib/x86_64-linux-gnu/dbus-1.0/include -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -I/usr/include/orbit-2.0 -I/usr/include/libbonobo-2.0 -I/usr/include/bonobo-activation-2.0 -I/usr/include/libxml2 -I/usr/include/pango-1.0 -I/usr/include/gail-1.0 -I/usr/include/harfbuzz -I/usr/include/freetype2 -I/usr/include/atk-1.0 -I/usr/lib/x86_64-linux-gnu/gtk-2.0/include -I/usr/include/cairo -I/usr/include/gio-unix-2.0/ -I/usr/include/pixman-1 -I/usr/include/libpng12     -g -O2 -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=1
"Linking: gcc   -L. -Wl,-Bsymbolic-functions -Wl,-z,relro -L/build/buildd/ruby1.9.1-1.9.3.484/debian/lib -rdynamic -Wl,-export-dynamic  -L/usr/local/lib -Wl,--as-needed -o vim   -lgtk-x11-2.0 -lgdk-x11-2.0 -latk-1.0 -lgio-2.0 -lpangoft2-1.0 -lpangocairo-1.0 -lgdk_pixbuf-2.0 -lcairo -lpango-1.0 -lfontconfig -lgobject-2.0 -lglib-2.0 -lfreetype     -lgnomeui-2 -lSM -lICE -lbonoboui-2 -lgnomevfs-2 -lgnomecanvas-2 -lgnome-2 -lpopt -lbonobo-2 -lbonobo-activation -lORBit-2 -lart_lgpl_2 -lgtk-x11-2.0 -lgdk-x11-2.0 -latk-1.0 -lgio-2.0 -lpangoft2-1.0 -lpangocairo-1.0 -lgdk_pixbuf-2.0 -lcairo -lpango-1.0 -lfontconfig -lfreetype -lgconf-2 -lgthread-2.0 -lgmodule-2.0 -lgobject-2.0 -lglib-2.0   -lSM -lICE -lXpm -lXt -lX11 -lXdmcp -lSM -lICE  -lm -ltinfo -lnsl  -lselinux  -ldl    -L/usr/lib/python2.7/config-x86_64-linux-gnu -lpython2.7 -lpthread -ldl -lutil -lm -Xlinker -export-dynamic -Wl,-O1 -Wl,-Bsymbolic-functions   -lruby-1.9.1 -lpthread -lrt -ldl -lcrypt -lm  -L/usr/lib
"
augroup Python
	autocmd!
	autocmd Filetype python setlocal tabstop=4
augroup END
