# zsh

# Powerlevel 10k
source $(brew --prefix)/opt/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Aliases
source ~/.zaliases

# Completion
fpath+=~/.zfunc
autoload -U compinit
autoload -U zutil
autoload -U complist
compinit

# history
export HISTSIZE=5000
export SAVEHIST=5000
export HISTFILE=~/.zhistory
setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.

# the fuck !
eval $(thefuck --alias)

# no slash at the end
setopt auto_remove_slash

# cd if command not found and dir exists
setopt auto_cd

# vim mode
bindkey -v

# auto suggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=10,underline"
bindkey '^ ' autosuggest-accept
# hl
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# fzf for zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# fzf with tab
source ~/.zplugins/fzf-tab/fzf-tab.plugin.zsh
# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
# set descriptions format to enable group support
zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# preview directory's content with exa when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'
# switch group using `,` and `.`
zstyle ':fzf-tab:*' switch-group ',' '.'
zstyle ':fzf-tab:*' default-color $'\033[96m'

# zsh functions
source ~/.zutils

# doctolib stuff
source ~/.zdocto

# ensure homebrew stuff in path
export PATH="/usr/local/sbin:$PATH"
# custom ruby and utils comes first
export PATH="/usr/local/bin/rubocop-daemon-wrapper:"$HOME"/.rbenv/versions/"$(rbenv global)"/bin:$PATH"
