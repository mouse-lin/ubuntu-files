# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

#----------------------   mouse --------------------------
alias ebash="vim ~/.bashrc"
alias lbash="source ~/.bashrc"
alias vimrc="sudo vim ../../usr/share/vim/vimrc"

#rails 2.3.5/ ruby 1.8.7
#alias r="ruby script/server" 1.8.7 and  rails 2.3.5
#alias c="ruby script/console"
alias r1="ruby script/server"
alias r1p="ruby script/server -e production"
#alias cp="ruby script/console production"
alias r1d="ruby script/server --debugger"
alias rdm="bundle exec rake db:migrate"
alias rdms="rake db:migrate:reset"
#alias rp="ruby script/server -e production"
#alias rsg="ruby script/generate"
alias rdmp="bundle exec rake db:migrate RAILS_ENV=production"
alias rake="bundle exec rake"

#rails 3 /ruby 1.9.2
alias r="rails server"
alias rg="rails generate"
alias c="rails console"
alias cp="rails console production"
alias rd="rails server --debugger"
alias rdc="bundle exec rake db:create"
alias rp="rails server -e production"

#gems
alias annotate="bundle exec annotate -p after"

#network
alias vh="sudo gvim /etc/hosts"

#file
alias la="ls -a"

#rvm useage
alias showrails-v=" gem list | grep rails"

#mysql
alias mysql="mysql -u root -p000"
alias mysql-stop="sudo /etc/init.d/mysql stop"
alias mysql-start="sudo /etc/init.d/mysql start"
alias mysql-restart="sudo /etc/init.d/mysql restart"

#git
alias gp="git pull --rebase"
alias gpush="git push"
alias ts="tig status"
alias go="git checkout"
#查看单独文件修改的历史，格式：git blame file_route and name
alias gitb="git blame"


#bundler
alias binstall="sudo bundle install"

#redmine
alias gor="cd ~/code/redmine"

#ubuntu
alias rm-r="rm -rf"

#wando3 使用bash指令
alias gowando2="cd ~/wando2/depo/rails"
alias thor_b="cd ~/wando3/thor basic:clean_up"


#add 
if [[ -s "$HOME/.rvm/scripts/rvm" ]] ; then
source "$HOME/.rvm/scripts/rvm";
fi
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
#===================
 
#out
alias up="cd .."
  
#test 
alias got="cd ~/code/myjob"
#user_management
alias gou="cd ~/code/user_management"
  
#myjob
alias gomy="cd ~/code/reallyjob/mytest"
alias gored="cd ~/code/redmine"
alias gotest="cd ~/code/wando3-test"
alias gowando3="cd ~/wando3"
alias gojds="cd ~/code/jds/jds"
alias gocl="cd ~/cl"

#shell 脚本来作为启动wando3服务和console
alias wando3="sh ~/mouse-config/wando3.sh"
alias wando3-c="sh ~/wando3-c.sh"
  
#host 
alias ssh-hzu="ssh hzu@172.17.21.221"
#alias hzu="hzu@172.17.21.221"
alias ssh-wando="ssh wando@hzfs123.vicp.net"
alias ssh-bom="ssh bomdvan@172.17.21.245"
alias ssh-liwen="ssh zhangliwen@172.17.21.168"
alias ssh-test="ssh shao@172.17.21.169"
alias ssh-yibin="ssh yibin@172.17.21.247"
alias ssh-xiaoyong="ssh luxiaoyong@172.17.21.66"
alias ssh-xiaobo="ssh xiaobo@172.17.21.194"
alias ssh-rice="ssh rice@172.17.21.74"
alias ssh-root="ssh root@192.168.1.1"

alias gow3="cd ~/wando3/sample_order/myone"
alias gow2="cd ~/code/wando2/repo/rails"
    alias gopf="cd ~/monkey-gp/pf"


#rspec method
alias rrs="rake spec"

#apache 使用
alias apache-start="sudo /etc/init.d/apache2 start"
alias apache-restart="sudo /etc/init.d/apache2 restart"
alias apache-stop="sudo /etc/init.d/apache2 stop"

#nginx 使用
alias nginx-start="sudo /etc/init.d/nginx start"
alias nginx-stop="sudo /etc/init.d/nginx stop"
alias nginx-restart="sudo /etc/init.d/nginx restart"


#mongrel 使用
alias mongrel-start="mongrel_rails cluster::start"
alias mongrel-stop="mongrel_rails cluster::stop"
alias mongrel-restart="mongrel_rails cluster::restart"

#shell help
alias shell-help="sh ~/shell_help/help.sh"

# source java
export JAVA_HOME=/usr/jdk1.7.0
export CLASSPATH=$CLASSPATH:$JAVA_HOME/lib:$JAVA_HOME/jre/lib 
export PATH=$JAVA_HOME/bin:$JAVA_HOME/jre/bin:$PATH:$HOMR/bin

#三江服务器
alias ssh-cl="ssh cl@192.168.1.13"

#nosql
alias gosql="cd ~/mytest/nosql"

#vimrc
alias vc="sudo gvim /usr/share/vim/vimrc"

#rails3.1
alias asset="rm -rf public/assets && rake assets:precompile"
