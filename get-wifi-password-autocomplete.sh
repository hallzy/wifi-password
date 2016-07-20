_files() {
  # This gets the list of files I want to see
  \sudo grep "psk=" /etc/NetworkManager/system-connections/* -Rl | xargs -I {} basename "{}"
}


__get-password() {
  local cur=${COMP_WORDS[COMP_CWORD]}
  local IFS=$'\n'
  # Display those files
  COMPREPLY=( $(compgen -W "$(_files | sed -e 's/ /\\ /g' )" -- $cur) )
}

complete -F __get-password get-wifi-password
