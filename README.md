# .dotfiles

## install

`git clone https://github.com/jameshiner/.dotfiles.git && cd .dotfiles`\
`./install.sh`

## spotlight

remove <kbd>Cmd</kbd> + <kbd>Space</kbd> keybind\
preferences &rarr; spotlight &rarr; keyboard shortcuts\
uncheck Show Spotlight search

## open apps

- alfred
  - set keybind to <kbd>Cmd</kbd> + <kbd>Space</kbd>
- rectangle
- karabiner-elements

## keyboard

**preferences &rarr; keyboard &rarr;**\
Key Repeat Rate &rarr; Fast\
Delay until repeat &rarr; Short\
Press Globe Key to  &rarr; Do nothing

**keyboard shortcuts.. &rarr;**\
&nbsp;&nbsp;&nbsp;&nbsp;**Function Keys**\
&nbsp;&nbsp;&nbsp;&nbsp;_Use Standard_ &rArr; checked

&nbsp;&nbsp;&nbsp;&nbsp;**Modifier Keys**\
&nbsp;&nbsp;&nbsp;&nbsp;caps lock &rArr; control\
&nbsp;&nbsp;&nbsp;&nbsp;control &rArr; command

## dock

**preferences &rarr; desktop & dock**\
_Automatically hide and show the Dock_ &rArr; checked

## add startup programs

preferences &rarr; users & groups &rarr; login items

- alfred
- karabiner elements
- rectangle

## other

iterm2\
import ./itermProfile.json

nvim\
run PlugInstall in init.vim\
js/ts autocompletion - run
CocInstall coc-rome coc-tsserver

scroll reverser\
reverse mouse scrolling if not using magic mouse

github\
create 2 ssh keys (name files accordingly)\
`ssh-keygen -t rsa -b 4096 -C "<your email address>"`

add keys to github accounts\
under account settings &rarr; ssh keys
for work, click the authorize sso button

start ssh agent/check if started\
`eval "$(ssh-agent -s)"`

create ssh config
`touch ~/.ssh/config`

add:

```bash
# Default GitHub
Host github.com
  HostName github.com
  User git
  IdentityFile ~/.ssh/id_rsa

# work (use git@github-work instead of git@github.com)
Host github-work
  HostName github.com
  User git
  # change to work github file name
  IdentityFile ~/.ssh/id_rsa_work
```
