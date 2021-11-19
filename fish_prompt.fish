# Fish git prompt

set __fish_git_prompt_showdirtystate 'yes'

set __fish_git_prompt_showstashstate 'yes'

set __fish_git_prompt_showuntrackedfiles 'yes'

set __fish_git_prompt_showupstream 'yes'

set __fish_git_prompt_color_branch yellow

set __fish_git_prompt_color_upstream_ahead green

set __fish_git_prompt_color_upstream_behind red



# Status Chars

set __fish_git_prompt_char_dirtystate '~'

set __fish_git_prompt_char_stagedstate '→'

set __fish_git_prompt_char_untrackedfiles '☡'

set __fish_git_prompt_char_stashstate '↩'

set __fish_git_prompt_char_upstream_ahead '+'

set __fish_git_prompt_char_upstream_behind '-'





function fish_prompt
  # $status gets nuked as soon as something else is run, e.g. set_color
  # so it has to be saved asap.
  set -l last_status $status

  test $SSH_TTY; and printf (set_color red)(whoami)(set_color white)'@'(set_color yellow)(hostname)' '

  test $USER = 'root'; and echo (set_color red)"#"

  # Main
  echo -n (set_color cyan)(prompt_pwd) (__fish_git_prompt)

  # Current time
  if [ $last_status -ne 0 ]
      echo -n ' '(set_color red)'['(set_color yellow)$last_status(set_color red)']'
  end

  echo -n ' '(set_color red)'❯'(set_color yellow)'❯'(set_color green)'❯ '

end
