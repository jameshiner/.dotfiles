#!/bin/sh

# Set Mac Defaults
echo "Setting MacOS defaults"
chflags nohidden ~/Library
defaults write com.apple.finder AppleShowAllFiles YES
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder ShowStatusBar -bool true

# Install Homebrew
if test ! $(which brew); then
    echo "Installing homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update homebrew recipes
echo "Updating homebrew..."
brew update
brew upgrade

PACKAGES=(
	git
	neovim
	tmux
	npm
	python3
	nvm
	nano
	commitizen
	nginx
)

echo "Installing packages..."
brew install ${PACKAGES[@]}

CASKS=(
	bitwarden
	alfred
	discord
	visual-studio-code
	google-chrome
	firefox
	iterm2
	slack
	parallels
	rectangle
	karabiner-elements
	hyperswitch
)

echo "Installing casks..."
brew install --cask ${CASKS[@]}

FONTS=(
	font-fira-mono-nerd-font
	font-fira-code-nerd-font
	font-meslo-lg-nerd-font
)

echo "Installing fonts..."
brew tap homebrew/cask-fonts

brew install ${FONTS[@]}

echo "Cleaning up..."
brew cleanup

# Install oh-my-zsh
echo "Installing oh-my-zsh"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
chsh -s /bin/zsh

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions


echo "Installing global npm packages..."
npm i -g prettier
npm i -g eslint

DOTFILES=(
	.tmux.conf
	.zprofile
	.gitconfig
	.gitignore
	.zshrc
	.prettierrc
	.prettierignore
	.nanorc
)

echo "Creating sym links..."
for i in  ${DOTFILES[@]}; do
  ln -s ~/.dotfiles/$i ~/$i
done

mkdir -p ~/scripts/
ln -s ~/.dotfiles/scripts/ ~/scripts/

mkdir -p ~/.config/
cp -R ./.config/karabiner ~/.config/

open /Applications/Alfred\ 4.app
open /Applications/Karabiner-Elements.app
open /Applications/Rectangle.app
open /Applications/HyperSwitch.app
