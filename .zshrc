
# The following lines were added by compinstall
zstyle ':completion:*' auto-description '%d'
zstyle ':completion:*' completer _complete _ignored
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'
zstyle ':completion:*' menu select=0
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle ':completion:*' special-dirs true
zstyle ':completion:*' verbose true
zstyle :compinstall filename '/home/kona/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt beep nomatch
bindkey -e

autoload -U promptinit && promptinit

# key bindings
bindkey '\e[3~' delete-char
bindkey "\e[H" beginning-of-line
bindkey "\e[F" end-of-line

if [ "`uname | grep Linux`" = "Linux" ]; then
    alias ll='ls -alh --color --time-style=long-iso'
    alias lll='ls -alh --color --time-style=full-iso'
elif [ "`uname | grep SunOS`" = "SunOS" ]; then
    alias ll='ls -alh --color --time-style=long-iso'
    alias lll='ls -alh --color --time-style=full-iso'
elif [ "`uname | grep FreeBSD`" = "FreeBSD" ]; then
    alias ll='ls -alhG'
    alias lll='ls -alhG'
fi

# konata prompt theme
prompt_konata_setup () {
  prompt_konata_color1=${1:-'blue'}
  prompt_konata_color2=${2:-'cyan'}
  prompt_konata_color3=${3:-'green'}

  #base_prompt="%K{$prompt_konata_color1}%n@%m%k "
  base_prompt="%F{$prompt_konata_color1}%B%n@%m%f%b -- %F{$prompt_konata_color3}%D{%Y %b %d %a %H:%M:%S}%f -- "
  post_prompt="%b%f%k"

  base_prompt_no_color=$(echo "$base_prompt" | perl -pe "s/%(K{.*?}|k)//g")
  post_prompt_no_color=$(echo "$post_prompt" | perl -pe "s/%(K{.*?}|k)//g")

  add-zsh-hook precmd prompt_konata_precmd
}

prompt_konata_precmd () {
  setopt noxtrace localoptions
  local base_prompt_expanded_no_color base_prompt_etc
  local space_left

  base_prompt_expanded_no_color=$(print -P "$base_prompt_no_color")
  base_prompt_etc=$(print -P "$base_prompt%(4~|...|)%3~")
  space_left=$(( $COLUMNS - $#base_prompt_expanded_no_color - 2 ))
  path_prompt="%B%F{$prompt_konata_color2}%${space_left}<...<%~$prompt_newline%F{white}"
  PS1="$base_prompt$path_prompt%# $post_prompt"
  PS2="$base_prompt$path_prompt%_> $post_prompt"
  PS3="$base_prompt$path_prompt?# $post_prompt"
}

prompt_konata_setup "$@"
