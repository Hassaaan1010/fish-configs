# copied from .bash_aliases {{
# cli
alias tree="tree --dirsfirst -I node_modules/"
alias h="history | cat | head"
alias convert2pdf="libreoffice --headless --convert-to pdf *.docx *.pptx"
alias pdfunite="pdfunite input1.pdf input2.pdf output.pdf"
alias setreact="npm create vite@latest client -- --template react-swc"
alias codinator="code"
alias reloadmouse="sudo modprobe -r psmouse && sudo modprobe psmouse"
alias blockall="sudo cp /home/hassaan/Downloads/.block_all /etc/hosts"
alias getSSHkey25519="ssh-keygen -l -f /etc/ssh/ssh_host_ed25519_key.pub"
alias histgrep="history | grep"
alias leet="code /home/hassaan/Downloads/Leet/"
alias c="copyq copy -"


# Common files
alias cdd="cd ~/Downloads/"

alias bashrc="code ~/.bashrc"
alias config="code ~/.config/fish/config.fish"
alias aliases="code ~/.config/fish/aliases.fish"



# apps
alias localsend="localsend_app"
alias sufyan="librewolf https://discord.com/channels/@me/772176305616846878"
alias github="librewolf https://github.com/Hassaaan1010?tab=repositories"
alias tor="cd /opt/tor-browser && ./start-tor-browser.desktop"
alias whatsapp="librewolf https://web.whatsapp.com/"
alias mail="librewolf https://mail.google.com/mail/u/0/?tab=rm&ogbl#inbox"
alias randoms=" librewolf https://discord.com/channels/763301332479246337/763301332945207299"
alias gpt="librewolf https://chatgpt.com/"
alias types="librewolf 'https://www.speedcoder.net/race/'"

# }}

# navigation
alias ll="ls -lah"
alias ..="cd .." 
alias ...="cd ../.."
alias ranger="ranger --choosedir=$HOME/.rangerdir; cd (cat $HOME/.rangerdir)"

# function
# Create a directory and change into it
function mkcd
    mkdir -p $argv[1] && cd $argv[1]
end

# Run a command and copy its output to the clipboard:
function run_copy
    eval $argv | copyq copy -
end

# history of last n commands
function hist
    history | head -n $argv[1]
end