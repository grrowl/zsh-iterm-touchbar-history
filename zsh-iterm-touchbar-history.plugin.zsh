# variables
HISTORY_NUM="${HISTORY_NUM:-15}"
HISTORY_TRUNC="${HISTORY_TRUNC:-10}"

pecho() {
  if [ -n "$TMUX" ]; then
    echo -ne "\ePtmux;\e$*\e\\"
  else
    echo -ne $*
  fi
}

# F1-12: https://github.com/vmalloc/zsh-config/blob/master/extras/function_keys.zsh
# F13-F20: just running read and pressing F13 through F20. F21-24 don't print escape sequences
fnKeys=('^[OP' '^[OQ' '^[OR' '^[OS' '^[[15~' '^[[17~' '^[[18~' '^[[19~' '^[[20~' '^[[21~' '^[[23~' '^[[24~' '^[[1;2P' '^[[1;2Q' '^[[1;2R' '^[[1;2S' '^[[15;2~' '^[[17;2~' '^[[18;2~' '^[[19;2~')

function _clearTouchbar() {
  pecho "\033]1337;PopKeyLabels\a"
}

function _unbindTouchbar() {
  for fnKey in "$fnKeys[@]"; do
    bindkey -s "$fnKey" ''
  done
}

function setKey(){
  pecho "\033]1337;SetKeyLabel=F${1}=${2}\a"
  if [ "$4" != "-q" ]; then
    # bindkey -s $fnKeys[$1] "$3 \n"
    bindkey -s $fnKeys[$1] "$3"
  else
    bindkey $fnKeys[$1] $3
  fi
}

function clearKey(){
  pecho "\033]1337;SetKeyLabel=F${1}=F${1}\a"
}

precmd_iterm_touchbar() {
  _unbindTouchbar

  # Show history
  HISTORY=($(history -$HISTORY_NUM | awk '{print $2}' | sort | uniq))
  # https://unix.stackexchange.com/a/334049
  for i in $HISTORY; do
    # echo "number ${HISTORY[(ie)$i]} :: $i"
    if [ $(echo -n $i | wc -m) -gt $HISTORY_TRUNC ]; then
      setKey "${HISTORY[(ie)$i]}" "$i[0,$HISTORY_TRUNC]…" "$i"
    else
      setKey "${HISTORY[(ie)$i]}" "$i" "$i"
    fi
  done
}

autoload -Uz add-zsh-hook
add-zsh-hook precmd precmd_iterm_touchbar
