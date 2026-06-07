if status is-interactive
# Commands to run in interactive sessions can go here
end

# Show a command history
function history
    builtin history --show-time='%F %T '
end

# Create a backup of file
function backup --argument filename
    cp $filename $filename.bak
end

# Copy DIR1 DIR2
function copy
    set count (count $argv | tr -d \n)
    if test "$count" = 2; and test -d "$argv[1]"
        set from (echo $argv[1] | trim-right /)
        set to (echo $argv[2])
        command cp -r $from $to
    else
        command cp $argv
    end
end

# aliases

# eza
alias ls='eza -al --color=always --group-directories-first --icons=always' # preferred listing
alias la='eza -a --color=always --group-directories-first --icons=always'  # all files and dirs
alias ll='eza -l --color=always --group-directories-first --icons=always'  # long format
alias lt='eza -aT --color=always --group-directories-first --icons=always' # tree listing
alias l.="eza -a | grep -e '^\.'"                                          # show only dotfiles
# cd
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
# ps
alias psmem='ps aux | sort -nr -k 4'
alias psmem10='ps aux | sort -nr -k 4 | head -10'

#open gpg
export GPG_TTY=$(tty)

# brew
#alias update='brew upgrade'
#alias cleanup='brew autoremove && brew cleanup'

#homebrew
#eval "$(/opt/homebrew/bin/brew shellenv fish)"

# claude accounts
#alias claude-gs="CLAUDE_CONFIG_DIR=~/.claude-gs claude"
#alias claude-knot="CLAUDE_CONFIG_DIR=~/.claude claude"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
#if test -f /opt/homebrew/Caskroom/miniforge/base/bin/conda
#    eval /opt/homebrew/Caskroom/miniforge/base/bin/conda "shell.fish" "hook" $argv | source
#else
#    if test -f "/opt/homebrew/Caskroom/miniforge/base/etc/fish/conf.d/conda.fish"
#        . "/opt/homebrew/Caskroom/miniforge/base/etc/fish/conf.d/conda.fish"
#    else
#        set -x PATH "/opt/homebrew/Caskroom/miniforge/base/bin" $PATH
#    end
#end
# <<< conda initialize <<<

