
set_term_bgcolor(){
  local R=$1
  local G=$2
  local B=$3
  /usr/bin/osascript <<EOF
  tell application "iTerm"
    tell current session of first window
      set background color to {$(($R*65535/255)), $(($G*65535/255)), $(($B*65535/255))}
    end tell
  end tell
EOF
}

if [[ "$@" =~ new ]]; then
  set_term_bgcolor 40 0 0
elif [[ "$@" =~ log ]]; then
  set_term_bgcolor 0 40 0
elif [[ "$@" =~ host ]]; then
  set_term_bgcolor 0 42 51
fi

ssh $@

set_term_bgcolor 0 0 0ias ssh='myssh'
