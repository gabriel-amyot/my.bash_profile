#  Description:  This file holds my BASH configurations and aliases. It's mainly intended to be used as a cheat-sheet.
#
#  Sections:
#  1.  Environment Configuration
#  2.  Make Terminal Better (remapping defaults and adding functionality)
#  3.  File and Folder Management
#  4.  Searching
#  5.  Process Management
#  6.  Networking
#  7.  System Operations & Information
#  8.  Web Development
#  9.  Reminders & Notes
#  10. Make Git better
#  11. Make Gradle better
#  12. Team's environment specific settings & shortcuts

#  ---------------------------------------------------------------------------

#   -------------------------------
#   1. ENVIRONMENT CONFIGURATION
#   -------------------------------

#	Hardware specs
	export MEMORY=16G
	export CPU=4	

#   Change Prompt
#   ------------------------------------------------------------
    #export PS1="________________________________________________________________________________\n| \w @ \h (\u) \n| => "
    #export PS1="______________________________________________________________________________ \[\033]0;$TITLEPREFIX:${PWD//[^[:ascii:]]/?}\007\]\n\[\033[31m\]\u@\h \[\033[33m\]\w\[\033[34m\]`__git_ps1`\[\033[35m\] \n -> "
    #export PS2=" => "

#   Set Paths
#   ------------------------------------------------------------
    export PATH="$PATH:/usr/local/bin/"
    export PATH="/usr/local/git/bin:/sw/bin/:/usr/local/bin:/usr/local/:/usr/local/sbin:/usr/local/mysql/bin:$PATH"
	
	##add python
	##export PATH="$PATH:/c/Users/gabriel.amyot/AppData/Local/Programs/Python/Python38-32"
	
	##add Ant to path
	export PATH="$PATH:/c/Developer/tools/BuildTools/apache-ant-1.10.7/bin"

#   Set Default Editor (change 'vim' to the editor of your choice)
#   ------------------------------------------------------------
    export EDITOR=/usr/bin/vim

#   Set default blocksize for ls, df, du
#   from this: http://hints.macworld.com/comment.php?mode=view&cid=24491
#   ------------------------------------------------------------
    export BLOCKSIZE=1k
	
	
#	Set language to english
	export LANG=en_US.UTF-8

#   Add color to terminal
#   (this is all commented out as I use it only for Mac Terminal Profiles)
#   from http://osxdaily.com/2012/02/21/add-color-to-the-terminal-in-mac-os-x/
#   ------------------------------------------------------------
	#export CLICOLOR=1
	#export LSCOLORS=ExFxBxDxCxegedabagacad
	
	#export COLOR_NC='\e[0m' # No Color
	#export COLOR_WHITE='\e[1;37m'
	#export COLOR_BLACK='\e[0;30m'
	#export COLOR_BLUE='\e[0;34m'
	#export COLOR_LIGHT_BLUE='\e[1;34m'
	#export COLOR_GREEN='\e[0;32m'
	#export COLOR_LIGHT_GREEN='\e[1;32m'
	#export COLOR_CYAN='\e[0;36m'
	#export COLOR_LIGHT_CYAN='\e[1;36m'
	#export COLOR_RED='\e[0;31m'
	#export COLOR_LIGHT_RED='\e[1;31m'
	#export COLOR_PURPLE='\e[0;35m'
	#export COLOR_LIGHT_PURPLE='\e[1;35m'
	#export COLOR_BROWN='\e[0;33m'
	#export COLOR_YELLOW='\e[1;33m'
	#export COLOR_GRAY='\e[0;30m'
	#export COLOR_LIGHT_GRAY='\e[0;37m'

#   -----------------------------
#   2. MAKE TERMINAL BETTER
#   -----------------------------
	#alias
	alias cp='cp -iv'                           # Preferred 'cp' implementation
	alias mv='mv -iv'                           # Preferred 'mv' implementation
	alias mkdir='mkdir -pv'                     # Preferred 'mkdir' implementation
	alias ll='ls -FGlAhp'                       # Preferred 'ls' implementation
	alias less='less -FSRXc'                    # Preferred 'less' implementation
	cd() { builtin cd "$@"; ls; }               # Always list directory contents upon 'cd'
	alias cd..='cd ../'                         # Go back 1 directory level (for fast typers)
	alias ..='cd ../'                           # Go back 1 directory level
	alias ...='cd ../../'                       # Go back 2 directory levels
	alias .3='cd ../../../'                     # Go back 3 directory levels
	alias .4='cd ../../../../'                  # Go back 4 directory levels
	alias .5='cd ../../../../../'               # Go back 5 directory levels
	alias .6='cd ../../../../../../'            # Go back 6 directory levels
	alias edit='subl'                           # edit:         Opens any file in sublime editor
	alias f='open -a Finder ./'                 # f:            Opens current directory in MacOS Finder
	alias ~="cd ~"                              # ~:            Go Home
	alias c='clear'                             # c:            Clear terminal display
	alias cc='clear' 							# cc:           Clear terminal display
	alias quit='exit'
	alias reloadBashProfile='source ~/.bash_profile'
    alias pww='pwd'								# pww:           if taping pwd to fast :P
	alias which='type -all'                     # which:        Find executables
	alias path='echo -e ${PATH//:/\\n}'         # path:         Echo all executable Paths
	alias show_options='shopt'                  # Show_options: display bash options settings
	alias fix_stty='stty sane'                  # fix_stty:     Restore terminal settings when screwed up
	alias cic='set completion-ignore-case On'   # cic:          Make tab-completion case-insensitive
	
	
	#commands
	mcd () { mkdir -p "$1" && cd "$1"; }        # mcd:          Makes new Dir and jumps inside
	#trash () { command mv "$@" ~/.Trash ; }     # trash:        Moves a file to the MacOS trash
	ql () { qlmanage -p "$*" >& /dev/null; }    # ql:           Opens any file in MacOS Quicklook Preview
	alias DT='tee ~/Desktop/terminalOut.txt'    # DT:           Pipe content to file on MacOS Desktop
	

#   lr:  Full Recursive Directory Listing
#   ------------------------------------------
	alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'' | less'

#   mans:   Search manpage given in agument '1' for term given in argument '2' (case insensitive)
#           displays paginated result with colored search terms and two lines surrounding each hit.            Example: mans mplayer codec
#   --------------------------------------------------------------------
    mans () {
        man $1 | grep -iC2 --color=always $2 | less
    }

#   showa: to remind yourself of an alias (given some part of it)
#   ------------------------------------------------------------
    showa () { /usr/bin/grep --color=always -i -a1 $@ ~/Library/init/bash/aliases.bash | grep -v '^\s*$' | less -FSRXc ; }


#   -------------------------------
#   3. FILE AND FOLDER MANAGEMENT
#   -------------------------------

	zipf () { zip -r "$1".zip "$1" ; }          # zipf:         To create a ZIP archive of a folder
	alias numFiles='echo $(ls -1 | wc -l)'      # numFiles:     Count of non-hidden files in current dir
	alias make1mb='mkfile 1m ./1MB.dat'         # make1mb:      Creates a file of 1mb size (all zeros)
	alias make5mb='mkfile 5m ./5MB.dat'         # make5mb:      Creates a file of 5mb size (all zeros)
	alias make10mb='mkfile 10m ./10MB.dat'      # make10mb:     Creates a file of 10mb size (all zeros)

#   cdf:  'Cd's to frontmost window of MacOS Finder
#   ------------------------------------------------------
    cdf () {
        currFolderPath=$( /usr/bin/osascript <<EOT
            tell application "Finder"
                try
            set currFolder to (folder of the front window as alias)
                on error
            set currFolder to (path to desktop folder as alias)
                end try
                POSIX path of currFolder
            end tell
EOT
        )
        echo "cd to \"$currFolderPath\""
        cd "$currFolderPath"
    }

#   extract:  Extract most know archives with one command
#   ---------------------------------------------------------
    extract () {
        if [ -f $1 ] ; then
          case $1 in
            *.tar.bz2)   tar xjf $1     ;;
            *.tar.gz)    tar xzf $1     ;;
            *.bz2)       bunzip2 $1     ;;
            *.rar)       unrar e $1     ;;
            *.gz)        gunzip $1      ;;
            *.tar)       tar xf $1      ;;
            *.tbz2)      tar xjf $1     ;;
            *.tgz)       tar xzf $1     ;;
            *.zip)       unzip $1       ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1        ;;
            *)     echo "'$1' cannot be extracted via extract()" ;;
             esac
         else
             echo "'$1' is not a valid file"
         fi
    }


#   ---------------------------
#   4. SEARCHING
#   ---------------------------

	alias qfind="find . -name "                 # qfind:    Quickly search for file
	ff () { /usr/bin/find . -name "$@" ; }      # ff:       Find file under the current directory
	ffs () { /usr/bin/find . -name "$@"'*' ; }  # ffs:      Find file whose name starts with a given string
	ffe () { /usr/bin/find . -name '*'"$@" ; }  # ffe:      Find file whose name ends with a given string
	ffa () { /usr/bin/find . -name '*'"$@"'*' ; }  # ffe:      Find file whose name contains a given string
	
	#GREP
		#grep 'word' filename
		#grep 'word' file1 file2 file3
		#grep 'string1 string2'  filename
		#cat otherfile | grep 'something'
		#command | grep 'something'
		#command option1 | grep 'data'
		#grep --color 'data' fileName
	alias aliasgrep='alias | grep ' # alias | grep 'word'
		
#   spotlight: Search for a file using MacOS Spotlight's metadata
#   -----------------------------------------------------------
    spotlight () { mdfind "kMDItemDisplayName == '$@'wc"; }


#   ---------------------------
#   5. PROCESS MANAGEMENT
#   ---------------------------

#   findPid: find out the pid of a specified process
#   -----------------------------------------------------
#       Note that the command name can be specified via a regex
#       E.g. findPid '/d$/' finds pids of all processes with names ending in 'd'
#       Without the 'sudo' it will only find processes of the current user
#   -----------------------------------------------------
    findPid () { lsof -t -c "$@" ; }

#   memHogsTop, memHogsPs:  Find memory hogs
#   -----------------------------------------------------
    alias memHogsTop='top -l 1 -o rsize | head -20'
    alias memHogsPs='ps wwaxm -o pid,stat,vsize,rss,time,command | head -10'

#   cpuHogs:  Find CPU hogs
#   -----------------------------------------------------
    alias cpu_hogs='ps wwaxr -o pid,stat,%cpu,time,command | head -10'

#   topForever:  Continual 'top' listing (every 10 seconds)
#   -----------------------------------------------------
    alias topForever='top -l 9999999 -s 10 -o cpu'

#   ttop:  Recommended 'top' invocation to minimize resources
#   ------------------------------------------------------------
#       Taken from this macosxhints article
#       http://www.macosxhints.com/article.php?story=20060816123853639
#   ------------------------------------------------------------
    alias ttop="top -R -F -s 10 -o rsize"

#   my_ps: List processes owned by my user:
#   ------------------------------------------------------------
    my_ps() { ps $@ -u $USER -o pid,%cpu,%mem,start,time,bsdtime,command ; }


#   ---------------------------
#   6. NETWORKING - unix
#   ---------------------------

	alias myip='curl ip.appspot.com'                    # myip:         Public facing IP Address
	alias netCons='lsof -i'                             # netCons:      Show all open TCP/IP sockets
	alias flushDNS='dscacheutil -flushcache'            # flushDNS:     Flush out the DNS Cache
	alias lsock='sudo /usr/sbin/lsof -i -P'             # lsock:        Display open sockets
	alias lsockU='sudo /usr/sbin/lsof -nP | grep UDP'   # lsockU:       Display only open UDP sockets
	alias lsockT='sudo /usr/sbin/lsof -nP | grep TCP'   # lsockT:       Display only open TCP sockets
	alias ipInfo0='ipconfig getpacket en0'              # ipInfo0:      Get info on connections for en0
	alias ipInfo1='ipconfig getpacket en1'              # ipInfo1:      Get info on connections for en1
	alias openPorts='sudo lsof -i | grep LISTEN'        # openPorts:    All listening connections
	alias showBlocked='sudo ipfw list'                  # showBlocked:  All ipfw rules inc/ blocked IPs

#   ii:  display useful host related informaton
#   -------------------------------------------------------------------
    ii() {
        echo -e "\nYou are logged on ${RED}$HOST"
        echo -e "\nAdditionnal information:$NC " ; uname -a
        echo -e "\n${RED}Users logged on:$NC " ; w -h
        echo -e "\n${RED}Current date :$NC " ; date
        echo -e "\n${RED}Machine stats :$NC " ; uptime
        echo -e "\n${RED}Current network location :$NC " ; scselect
        echo -e "\n${RED}Public facing IP Address :$NC " ;myip
        #echo -e "\n${RED}DNS Configuration:$NC " ; scutil --dns
        echo
    }

    SSH_ENV=$HOME/.ssh/environment

    # start the ssh-agent
    function start_agent {
	    echo "Initializing new SSH agent..."
	    # spawn ssh-agent
	    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
	    echo succeeded
	    chmod 600 "${SSH_ENV}"
	    . "${SSH_ENV}" > /dev/null
	    /usr/bin/ssh-add
    }
    
    if [ -f "${SSH_ENV}" ]; then
	    . "${SSH_ENV}" > /dev/null
	    ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
	    	start_agent;
	}
    else
	    start_agent;
    fi

#   ---------------------------------------
#   7. SYSTEMS OPERATIONS & INFORMATION
#   ---------------------------------------

	alias mountReadWrite='/sbin/mount -uw /'    # mountReadWrite:   For use when booted into single-user

#   cleanupDS:  Recursively delete .DS_Store files
#   -------------------------------------------------------------------
    alias cleanupDS="find . -type f -name '*.DS_Store' -ls -delete"

#   finderShowHidden:   Show hidden files in Finder
#   finderHideHidden:   Hide hidden files in Finder
#   -------------------------------------------------------------------
    alias finderShowHidden='defaults write com.apple.finder ShowAllFiles TRUE'
    alias finderHideHidden='defaults write com.apple.finder ShowAllFiles FALSE'

#   cleanupLS:  Clean up LaunchServices to remove duplicates in the "Open With" menu
#   -----------------------------------------------------------------------------------
    alias cleanupLS="/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user && killall Finder"

#    screensaverDesktop: Run a screensaver on the Desktop
#   -----------------------------------------------------------------------------------
    alias screensaverDesktop='/System/Library/Frameworks/ScreenSaver.framework/Resources/ScreenSaverEngine.app/Contents/MacOS/ScreenSaverEngine -background'

#   ---------------------------------------
#   8. WEB DEVELOPMENT
#   ---------------------------------------

	alias apacheEdit='sudo edit /etc/httpd/httpd.conf'      # apacheEdit:       Edit httpd.conf
	alias apacheRestart='sudo apachectl graceful'           # apacheRestart:    Restart Apache
	alias editHosts='sudo edit /etc/hosts'                  # editHosts:        Edit /etc/hosts file
	alias herr='tail /var/log/httpd/error_log'              # herr:             Tails HTTP error logs
	alias apacheLogs="less +F /var/log/apache2/error_log"   # Apachelogs:   Shows apache error logs
	httpHeaders () { /usr/bin/curl -I -L $@ ; }             # httpHeaders:      Grabs headers from web page

#   httpDebug:  Download a web page and show info on what took time
#   -------------------------------------------------------------------
    httpDebug () { /usr/bin/curl $@ -o /dev/null -w "dns: %{time_namelookup} connect: %{time_connect} pretransfer: %{time_pretransfer} starttransfer: %{time_starttransfer} total: %{time_total}\n" ; }


#   ---------------------------------------
#   9. REMINDERS & NOTES
#   ---------------------------------------

#   remove_disk: spin down unneeded disk
#   ---------------------------------------
#   diskutil eject /dev/disk1s3

#   to change the password on an encrypted disk image:
#   ---------------------------------------
#   hdiutil chpass /path/to/the/diskimage

#   to mount a read-only disk image as read-write:
#   ---------------------------------------
#   hdiutil attach example.dmg -shadow /tmp/example.shadow -noverify

#   mounting a removable drive (of type msdos or hfs)
#   ---------------------------------------
#   mkdir /Volumes/Foo
#   ls /dev/disk*   to find out the device to use in the mount command)
#   mount -t msdos /dev/disk1s1 /Volumes/Foo
#   Mount -t hfs /dev/disk1s1 /Volumes/Foo

#   to create a file of a given size: /usr/sbin/mkfile or /usr/bin/hdiutil
#   ---------------------------------------
#   e.g.: mkfile 10m 10MB.dat
#   e.g.: hdiutil create -size 10m 10MB.dmg
#   the above create files that are almost all zeros - if random bytes are desired
#   then use: ~/Dev/Perl/randBytes 1048576 > 10MB.da

#   -------------------------------
#   10. MAKE GIT BETTER
#	This section is also used as a cheat-sheet
#   Reference for pretty-formating: https://git-scm.com/docs/pretty-formats
#   -------------------------------
    #basic
	alias gc='git commit -m'
	alias go='git checkout'
	alias gs='git status'
	alias gf='git fetch'
	alias gitadd='git add -u' #add all modified sources
	alias gitall='git add --all' #add all modified sources
	alias gitAmendCommit='git commit --amend' #if commit is already pushed do: git push --force
	alias gitCleanUntrackedFiles='git clean -f'
	#Branching
	alias gitb='gitOriginBranch'
	alias gitListOriginBranch='git branch -vv'
	function gitRename() {
		git branch -m "$1" "$2" # $1=oldName  $2=newNAme
	}
	alias gitNewLocalBranch='git checkout -b'
	alias goRemoteBranch='git checkout --track' #git checkout --track origin-2/branch-2
	alias gitPushLocalBranch='git push -u' # git push -u <origin> <branch>
	
	#Merging
	alias gitMergeDry='git merge --no-commit --no-ff'
	#History
	alias gitlog="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
	alias gitlogadog='git log --all --decorate --oneline --graph'
	alias gitClosestParentBetween2Branches='git merge-base' #git merge-base branch2 branch3
	alias gitLeatestParentAncestor='gitClosestParentBetween2Branches origin-1/integration HEAD'
	alias gitDescribeHash='git describe --exact-match'
	alias gitAmmountOfCommitsSince='git rev-list --count HEAD ' #git rev-list --count HEAD ^<branch-name>
	#alias gitLeatestSvcAncestor='gitLeatestFrameworkAncestor | git describe --exact-match'
	
	#Checking out speficic folder from another origin
	alias gitBringThatOverHere='git checkout svc-origin/integration --'  #e.g.  git checkout svc-origin/integration -- config/montreal-lab

	#Squashing
	alias gitSquashPreviousCommits='git rebase -i ' #git rebase -i HEAD~<amount of commit to go squash>
	#Stashing
	alias gitStashList='git stash list --pretty=format:"%C(red)%h%C(reset) - %C(dim yellow)(%C(bold magenta)%gd%C(dim yellow))%C(reset) %<(85,trunc)%s %C(green)(%cr)(%ai)"'
	alias gsl='gitStashList'
	alias gStash='git stash save' #git stash save "<guacamole sauce WIP>"
	alias gStashDelete='git stash drop' #<stash_id>
	function gStashDeleteLastRange() { #$1..$2 is the range to be deleted
		for ((i=$2;i>=$1;i--)); do
			git stash drop $i
		done
	}
	# you can use a regular expression to find that stash: git stash apply stash^{/guacamo}
	alias gitstashshow='!f() { git stash show stash^{/$*} -p; }; f' #You can then use git sapply <regex> to apply that stash (without dropping).
	alias gitstashapply='!f() { git stash apply stash^{/$*}; }; f' #You can then use git sshow <regex> to show: files changed, insertions, and deletions
	##tags 
	function gitTagPush() { # <tag-name> <tag-comment> <origin>
		git tag -a $1 -m $2 
		git push $3 $1 
		#example
		#git tag -a pnb-1.0.1 -m "jpnb-1.0.1 delivery"
		#git push pnb-origin pnb-1.0.1 
	}
	alias gitDeleteTag='git push --delete' #git push --delete origin YOUR_TAG_NAME

	##Un-commit a non-pushed change
	alias gitUncommit='git reset --soft HEAD^'

	#Save my brazilian ass! (avoid common erros I sometimes do)
	alias pushar='pull'
	alias empurar='push'
	
	####Git tips: how to track multiple remotes###
	#1. git remote add <origin-name> <git@repo.url>   
	#2. git fetch <origin-name>
	#3. git branch <new-local-branch-name> <origin-name>/<branch-name>
	
	###Recover dropped stash
	##1. Find the stash commits
	alias gitListDroppedStash="git log --graph --oneline --decorate ( git fsck --no-reflog | awk '/dangling commit/ {print $3}' )"
	#This will show you all the commits at the tips of your commit graph which are no longer referenced from any branch or tag – every lost commit, including every stash commit you’ve ever created, will be somewhere in that graph.
	#bash/sh shell users: Version above is for Fish shell, so if you are bash/sh user just add a $ sign before to the left parenthesis.
	##2. Once you know the hash of the commit you want, you can apply it as a stash
	alias gitRecoverStash="git stash apply YOUR_WIP_COMMIT_HASH"
#   -------------------------------
#   11. MAKE GRADLE BETTER
#	This section is also used as a cheat-sheet
#   -------------------------------
	alias gradlew='./gradlew --configure-on-demand --build-cache --daemon --parallel --offline --max-workers=$CPU'
	alias gradlewQ2='./gradlew --configure-on-demand --daemon --parallel --offline'
	alias gralewS='./gradlew --stop'
	alias graldew='gradlew'
	alias gradlwe='gradlew'
	alias gradlewDependencies='gradlew frontend:dependencies'
	alias gradlewQuickCheck='gradlew assemble checkstyleMain checkstyleTest'
	alias gradlewPrecommit="gradlew assemble checkstyleMain checkstyleTest test"
	
	#Dependency analysys
	#TODO alias dependencySpecific="./gradlew -q dependencyInsight --dependency "
	
#   ------------------------------
#   12 Team's environment specific settings & shortcuts
#   -------------------------------

	##TODO

	
#   -------------------------------
#   13 OSS projects
#   -------------------------------
#   -------------------------------
#   13.1 Conductor (https://github.com/Netflix/conductor/)
#   -------------------------------	
	
	alias gotoConductor='cd /c/Developer/java-playground/OSS/conductor'
	
	alias startConductorServer='gotoConductor && cd server && ../gradlew server'
	alias buildConductorTravis='gotoConductor && ./buildViaTravis.sh && cd -'
