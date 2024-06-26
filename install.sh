#!/bin/sh

# Set Mac Defaults
echo "Setting MacOS defaults"
chflags nohidden ~/Library
defaults write com.apple.Finder AppleShowAllFiles true
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder ShowStatusBar -bool true
defaults write -g ApplePressAndHoldEnabled -bool false
defaults write com.apple.dock static-only -bool true
defaults write com.apple.dock autohide-delay -float 0;
defaults write com.apple.dock autohide-time-modifier -int 0
defaults write com.apple.dock showhidden -bool true
defaults write com.apple.dock tilesize -int 16
defaults write com.apple.dock orientation left

defaults write com.apple.WindowManager EnableStandardClickToShowDesktop -bool false

# tap to click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
/System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u

# disable spotlight keybinds
/usr/libexec/PlistBuddy ~/Library/Preferences/com.apple.symbolichotkeys.plist \
  -c "Delete :AppleSymbolicHotKeys:64" \
  -c "Add :AppleSymbolicHotKeys:64:enabled bool false" \
  -c "Add :AppleSymbolicHotKeys:64:value:parameters array" \
  -c "Add :AppleSymbolicHotKeys:64:value:parameters: integer 65535" \
  -c "Add :AppleSymbolicHotKeys:64:value:parameters: integer 49" \
  -c "Add :AppleSymbolicHotKeys:64:value:parameters: integer 1048576" \
  -c "Add :AppleSymbolicHotKeys:64:type string standard"

/usr/libexec/PlistBuddy ~/Library/Preferences/com.apple.symbolichotkeys.plist \
  -c "Delete :AppleSymbolicHotKeys:65" \
  -c "Add :AppleSymbolicHotKeys:65:enabled bool false" \
  -c "Add :AppleSymbolicHotKeys:65:value:parameters array" \
  -c "Add :AppleSymbolicHotKeys:65:value:parameters: integer 65535" \
  -c "Add :AppleSymbolicHotKeys:65:value:parameters: integer 49" \
  -c "Add :AppleSymbolicHotKeys:65:value:parameters: integer 1572864" \
  -c "Add :AppleSymbolicHotKeys:65:type string standard"

# restart dock
killall Dock

# Install Homebrew
if test ! $(which brew); then
    echo "Installing homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
		export PATH=/opt/homebrew/bin:$PATH
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
	pure
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
	rectangle
	karabiner-elements
	spotify
	postman
	scroll-reverser
	notion
	ticktick
 	stats
  	hiddenbar
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

# Install vim-plug
echo "Installing vim-plug"
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

echo "Installing global npm packages..."
npm i -g prettier
npm i -g yarn
npm i -g eslint
npm i -g eslint-config-airbnb
npm i -g eslint-plugin-react
npm i -g eslint-plugin-import
npm i -g eslint-plugin-jsx-a11y eslint-plugin-react eslint-plugin-react-hooks

# to get airbnb to work globally
npm install -g install-peerdeps
install-peerdeps --dev eslint-config-airbnb-base

echo "Installing node 16.X.X ..."
nvm install 16
nvm alias default 16

DOTFILES=(
	.tmux.conf
	.zprofile
	.gitconfig
	.gitignore
	.zshrc
	.prettierrc
	.prettierignore
	.nanorc
	.eslintrc.json
)

echo "Creating sym links..."
for i in ${DOTFILES[@]}; do
  ln -s ~/.dotfiles/$i ~/$i
done

mkdir -p ~/scripts/
for FILE in ./scripts; do cp $FILE ~/scripts/; done

mkdir -p ~/.config/
for FILE in ./config; do cp -R $FILE ~/.config/; done


