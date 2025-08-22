# robbyrussell zsh theme customized to show user@server in prompt

get_host() {
  if command -v scutil > /dev/null 2>&1; then
    scutil --get LocalHostName
  else
    hostname
  fi
}
PROMPT='%(?:%F{#00ff00}%1{➜%} :%F{#ff0000}%1{➜%} ) %F{#72C6A6}%n@$(get_host) %F{#2F3E4E}%c%f '
#PROMPT="%(?:%{$fg_bold[green]%}%1{➜%} :%{$fg_bold[red]%}%1{➜%} ) %{$fg[yellow]%}%n@%m %{$fg[cyan]%}%c%{$reset_color%}"
#PROMPT='%(?:%{$fg_bold[green]%}%1{➜%} :%{$fg_bold[red]%}%1{➜%} ) %{$fg[yellow]%}%n@$(scutil --get LocalHostName) %{$fg[cyan]%}%c%{$reset_color%} '

PROMPT+=' $(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}%1{✗%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

