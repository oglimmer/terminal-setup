# OS X TERMINAL

My personal cookbook how to set up a better terminal.

### Install fish

``brew install fish``

Add an entry to /etc/shells

``echo "/usr/local/bin/fish" >>/etc/shells``

Change default shell for current user

``chsh -s /usr/local/bin/fish``

### Change terminal theme

Clone [https://github.com/benmarten/Monokai_Fish_OSX]() and execute instructions.

### Enable ALT key

Terminal -> Preferences -> Keyboard -> Use Option as Meta Key needs to be enabled.

This makes ALT-BACKSPACE work.

### Change prompt

use `fish_config` to change prompt to Sorin style.

### SSH config

Create ~/.ssh/config add:

```
Host *
	UseKeychain yes

Host 192.168.34.2 (and other VM hosts)
	StrictHostKeyChecking no
	
Host oglimmer.de
	User root
```

### Syntax hilighting for less

``brew install source-highlight``

Add this to ~/.config/fish/config.fish

```
set -x LESSOPEN "| /usr/local/bin/src-hilite-lesspipe.sh %s"
set -x LESS ' -R '
```

### View markdown files

Create a function

```
function md
	if not test -e "$argv"
    echo "File $argv doesn`t exit."
    return 1
  end
  pandoc "$argv" | lynx -stdin
end
```

Save it

``funcsave md``