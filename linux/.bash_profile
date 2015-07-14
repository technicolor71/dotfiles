# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
#if [ -n "$BASH_VERSION" ]; then
#    # include .bashrc if it exists
#    if [ -f "$HOME/.bashrc" ]; then
#	. "$HOME/.bashrc"
#    fi
#fi
#
## set PATH so it includes user's private bin if it exists
#if [ -d "$HOME/bin" ] ; then
#    PATH="$HOME/bin:$PATH"
#fi

#PS1="\u@\h:\e[0;34m\w\$ \e[m"
#PS1='\h:\w\[\033[0;34m\]$ \[\033[0m\]'
PS1='\h:\[\033[0;34m\]\W \[\033[0m\]'

export CLICOLOR=1
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH
export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
export HISTSIZE=100000 SAVEHIST=100000 HISTFILE=~/.bash_history
export TERM=xterm-256color

# Solarized ls colors
eval `dircolors ~/.dircolors`

# Settings from ~/.profile
alias ls='ls --color'
alias vi='/usr/bin/vim'
alias grep='grep --color=auto'
alias ll='ls -l'
alias la='ls -a'
alias l='ls -CF'
alias view='vi -R'
alias top='top -o cpu'

SSH_ENV=$HOME/.ssh/environment

function start_agent {
     echo "Initializing new SSH agent..."
     /usr/bin/ssh-agent | sed 's/^echo/#echo/' > ${SSH_ENV}
     echo succeeded
     chmod 600 ${SSH_ENV}
     . ${SSH_ENV} > /dev/null
     /usr/bin/ssh-add;
}

# Source SSH settings, if applicable

if [ -f "${SSH_ENV}" ]; then
     . ${SSH_ENV} > /dev/null
     ps x | grep "^ *${SSH_AGENT_PID}" | grep ssh-agent$ > /dev/null || {
         start_agent;
     }
else
     start_agent;
fi
