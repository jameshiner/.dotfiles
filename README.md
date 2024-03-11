# .dotfiles

### open apps

- alfred
- rectangle
- karabiner elements

### set function keys to be default

preferences &rarr; keyboard &rarr; keyboard
change modifier keys\
preferences &rarr; keyboard &rarr; keyboard &rarr; modifier keys\
caps lock &rArr; control\
control &rArr; command

### spotlight

remove command space keybind\
preferences &rarr; spotlight &rarr; keyboard shortcuts\
uncheck _Show Spotlight search_

### dock

preferences &rarr; dock & menu bar\
size &rarr; small\
magnification &rarr; max\
position &rarr; left\
check _Automatically hide and show the Dock_

### add startup programs

preferences &rarr; users & groups &rarr; login items

- alfred
- karabiner elements
- rectangle

### other

mission control\
uncheck _Automatically rearrange Spaces based on most recent use_

trackpad\
preferences &rarr; trackpad\
tap to click &rarr; checked

alfred\
set keybind to <kbd>Cmd</kbd> + <kbd>Space</kbd>

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
