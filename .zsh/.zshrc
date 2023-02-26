# More information (https://dev.to/hbenvenutti/using-zsh-without-omz-4gch)

# Zsh init
# ==================================================
export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH=$HOME/.zsh


# History config
# ==================================================
export HISTFILE=$ZSH/.zsh_history
export HISTSIZE=10000  # How many commands zsh will load to memory.
export SAVEHIST=10000  # How many commands history will save on file.

setopt EXTENDED_HISTORY  # Record command start time.
setopt HIST_FIND_NO_DUPS  # History won't show duplicates on search.
setopt HIST_IGNORE_ALL_DUPS  # Do not put duplicated command into history list.
setopt HIST_REDUCE_BLANKS  # Remove unnecessary blanks.
setopt HIST_SAVE_NO_DUPS  # Do not save duplicated command.
setopt INC_APPEND_HISTORY_TIME  # Append command to history file immediately after execution.


# Plugins & themes
# ==================================================

# Theme: Headline
source $ZSH/themes/headline/headline.zsh-theme

# Fast-Syntax-Highlighting
source $ZSH/plugins/fast-syntax-highlighting-1.55/fast-syntax-highlighting.plugin.zsh

# Zsh-autosuggestions
source $ZSH/plugins/zsh-autosuggestions-0.7.0/zsh-autosuggestions.zsh

# Jump
source $ZSH/plugins/jump-2022.02.11/jump.plugin.zsh
source $ZSH/plugins/z-1.9/z.sh


# Other
# ==================================================

# Alias
alias q="exit"
alias r="exec zsh"

alias e="nnn"
alias g="lazygit"
alias d="ncdu"
alias n="nvim"

alias t.kill="tmux kill-server"
alias t="tmux"

alias f.dir="cd ~ && cd \$(find * -type d | fzf -e)"
alias f.file="nvim \$(fzf -e)"

alias j="jump"
alias j.mark="mark"
alias j.unmark="unmarks"
alias j.list="marks"


# Export
# ==================================================

# nnn
export NNN_PLUG='s:fzcd;j:autojump;'

# fzf
export FZF_DEFAULT_OPTS='--height 85% --layout=reverse --border'

# pnpm
export PNPM_HOME="/data/data/com.termux/files/home/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end
