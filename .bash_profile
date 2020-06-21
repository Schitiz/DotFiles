# Starship setup
eval "$(starship init bash)"
eval "$(fasd --init auto)"

export PATH="$HOME/.cargo/bin:$PATH"

# Export utf-8
export LC_ALL=en_IN.UTF-8
export LANG=en_IN.UTF-8

# FZF Setup
export FZF_DEFAULT_OPTS='
  --height 40% --layout=reverse --border
  --color=dark
  --color=fg:-1,bg:-1,hl:#5fff87,fg+:-1,bg+:-1,hl+:#ffaf5f
  --color=info:#af87ff,prompt:#5fff87,pointer:#ff87d7,marker:#ff87d7,spinner:#ff87d7
'
export FZF_DEFAULT_COMMAND='rg --files'
source ~/.bash_aliases

# ---------------------- Load Custom Functions ------------------------------------------
if [[ -f ~/.bash_functions ]]; then
    source ~/.bash_functions
fi
