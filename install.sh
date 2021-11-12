# Install Homebrew
if test ! $(which brew); then
    echo "Installing homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update homebrew recipes
brew update

PACKAGES=(
	git
	neovim
	tmux
	npm
	python3
	nvm
	commitizen
	nginx
)

echo "Installing packages..."
brew install ${PACKAGES[@]}

echo "Cleaning up..."
brew clean

CASKS=(
	bitwarden
	alfred
	discord
	sencha
	visual-studio-code
	google-chrome
	firefox
	iterm2
	slack
	parallels
)

echo "Installing casks..."
brew install --cask ${CASKS[@]}

FONTS=(
	font-fira-code-nerd-font
)

echo "Installing fonts..."
brew tap homebrew/cask-fonts

brew install ${FONTS[@]}

echo "Installing global npm packages..."

ln -s ~/.dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/.dotfiles/.zprofile ~/.zprofile
ln -s ~/.dotfiles/.gitconfig ~/.gitconfig
ln -s ~/.dotfiles/.gitignore ~/.gitignore
ln -s ~/.dotfiles/.zshrc ~/.zshrc
ln -s ~/.dotfiles/.prettierrc ~/.prettierrc
ln -s ~/.dotfiles/.prettierignore ~/.prettierignore
ln -s ~/.dotfiles/.nanorc ~/.nanorc
ln -s ~/.dotfiles/scripts/ ~/scripts/
