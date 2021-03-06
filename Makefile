init:
	mkdir -p ~/workspace
	@if [ ! -d ~/workspace/dotfiles ]; then \
		git clone git@github.com:MaksOuw/dotfiles ~/workspace/dotfiles; \
	fi
	@if [ ! -d ~/.vim/bundle/Vundle.vim ]; then \
	       git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim; \
	fi

symlink:
	mv ~/.bashrc ~/.bashrc.old
	ln -s ~/workspace/dotfiles/.bashrc ~/.bashrc
	ln -s ~/workspace/dotfiles/.bashrc.d ~/.bashrc.d
	ln -s ~/workspace/dotfiles/.gitconfig ~/.gitconfig
	ln -s ~/workspace/dotfiles/.vimrc ~/.vimrc
	ln -s ~/workspace/dotfiles/config/powerline ~/.config/powerline

install: init powerline symlink
	echo "Don't forget to :\n"
	echo "vim ~/.vimrc && :PluginInstall"

powerline:
	sudo pip3 install git+git://github.com/Lokaltog/powerline
	wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
	wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf
	sudo mv PowerlineSymbols.otf /usr/share/fonts/
	fc-cache -vf /usr/share/fonts/
	sudo mv 10-powerline-symbols.conf /etc/fonts/conf.d/
	@if [ -d ~/.config/powerline ]; then \
		mv ~/.config/powerline ~/.config/powerline-old; \
	fi

