# copied from .bash_aliases {{
# cli
alias tree="tree --dirsfirst -I '*target*|*node_modules*'"
alias h="history | cat | head"
alias convert2pdf="libreoffice --headless --convert-to pdf"
# alias pdfunite="pdfunite input1.pdf input2.pdf output.pdf"
alias setreact="npm create vite@latest client -- --template react-swc"
alias codinator="code"
alias reloadmouse="sudo modprobe -r psmouse && sudo modprobe psmouse"
alias blockall="sudo cp /home/hassaan/Downloads/.block_all /etc/hosts"
alias getSSHkey25519="ssh-keygen -l -f /etc/ssh/ssh_host_ed25519_key.pub"
alias histgrep="history | grep"
alias leet="code /home/hassaan/Downloads/Leet/"
alias c="copyq copy -"
alias bat="batcat --style header,header-filename,header-filesize "
alias cod="codium"
alias jmc="GTK_THEME=Adwaita:light ~/Downloads/applications/JDK\ Mission\ Control/jmc &;"

alias cdthemis="cd ~/Project/themis-cache/"
alias cdinfivr="cd ~/Downloads/infivr2/gdpr/gdprFix/infivrAnalytics/"

# Common files
# alias cdd="cd ~/Downloads/"

alias bashrc="code ~/.bashrc"
alias config="code ~/.config/fish/config.fish"
alias aliases="code ~/.config/fish/aliases.fish"


# Themis cache stuff
alias buildprotos='cd ~/Project/themis-cache/common/ && protoc --proto_path=src/main/java/common/parsing/protobuf --java_out=src/main/java src/main/java/common/parsing/protobuf/*.proto && cd ../sdk && mvn dependency:resolve && cd ../core && mvn dependency:resolve'



# apps
function localsend
    localsend_app &
end

function sufyan
    librewolf "https://discord.com/channels/@me/772176305616846878" &
end

function github
    librewolf "https://github.com/Hassaaan1010?tab=repositories" &
end


function whatsapp
    librewolf "https://web.whatsapp.com/" &
end

function obsidian
    ~/Downloads/applications/Obsidian-1.10.6.AppImage &
end

function mail
    librewolf "https://mail.google.com/mail/u/0/?tab=rm&ogbl#inbox" &
end

function randoms
    librewolf "https://discord.com/channels/763301332479246337/763301332945207299" &
end

function gpt
    librewolf "https://chatgpt.com/" &
end

function types
    librewolf "https://www.speedcoder.net/race/" &
end

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

function cdd
    cd ~/Downloads
    cd $argv[1]
end

# Run a command and copy its output to the clipboard:
function run_copy
    eval $argv | copyq copy -
end

# history of last n commands
function hist
    history | head -n $argv[1]
end

function swap_clear
    sudo swapoff -a && sudo swapon -a
    echo "Swap cleared."
end
