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

~/.config/fish/functions/fish_prompt.fish

```
# Fish git prompt
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_color_branch yellow
set __fish_git_prompt_color_upstream_ahead green
set __fish_git_prompt_color_upstream_behind red

# Status Chars
set __fish_git_prompt_char_dirtystate '⚡'
set __fish_git_prompt_char_stagedstate '→'
set __fish_git_prompt_char_untrackedfiles '☡'
set __fish_git_prompt_char_stashstate '↩'
set __fish_git_prompt_char_upstream_ahead '+'
set __fish_git_prompt_char_upstream_behind '-'


function fish_prompt
  test $SSH_TTY; and printf (set_color red)(whoami)(set_color white)'@'(set_color yellow)(hostname)' '

    test $USER = 'root'; and echo (set_color red)"#"

    # Main
  echo -n (set_color cyan)(prompt_pwd) (__fish_git_prompt) (set_color red)'❯'(set_color yellow)'❯'(set_color green)'❯ '
end
```

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