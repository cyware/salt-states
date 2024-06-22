# Set the title of the current Terminal to the specified string
function title() {
  if [[ -z "$ORIG" ]]; then
    ORIG=$PS1
  fi
  TITLE="\[\e]2;$*\a\]"
  PS1=${ORIG}${TITLE}
}

# Renew DCHP release using a single command
function renew-dhcp {
  echo Old IP: `myip`
  sudo dhclient -r
  sudo dhclient
  echo New IP: `myip`
}

# Clean up and convert encodings when examining shellcode
function unicode2hex-escaped {
  perl -pe 's/[^a-f\d]//gi; s/(..)(..)/\\x$2\\x$1/g;' ${*};
}
function unicode2raw {
  perl -pe 's/[^a-f\d]//gi; s/(..)(..)/chr(hex($2)).chr(hex($1))/ge;' ${*};
}
function hex-escaped2raw () 
{ 
  perl -pe 's/\\x(..)/chr(hex($1))/ge;' ${*}
}

# Use Intel's conventions when disassembling code with objdump
function objdump {
  /usr/bin/objdump -M intel ${*}
}

function inetsim {
  sudo /usr/bin/inetsim --bind-address=${1:-`myip`} ${*}
}

function fakedns {
  sudo /usr/local/bin/fakedns ${*}
}

function apt {
  sudo /usr/bin/apt ${*}
}

# Useful for hard-coding a specific IP address until the next reboot
function set-static-ip {
  NIC_NAME=$( ip link | egrep '^2\:'| awk '{print $2}' | sed 's/.$//' )
  sudo ifconfig $NIC_NAME ${*} netmask 255.255.255.0 up
  sudo systemctl restart network-manager
}

# A wrapper around the command to stop and start ngnix for old timers
function httpd {
  sudo systemctl ${*} nginx
}

# A wrapper around the "cyware" command to avoid having to specify "sudo"
function cyware {
    SUDO=/usr/bin/sudo
    CYWARE_CLI=/usr/local/bin/cyware
  if [ -e $SUDO ]; then
    if [ "$USER" == "root" ]; then
      $CYWARE_CLI ${*}
    else
      sudo $CYWARE_CLI ${*}
    fi
  else
    $CYWARE_CLI ${*}
  fi
}

function freshclam {
  sudo freshclam ${*}
}

function pecheck {
  pecheck.py -d /var/lib/gems/2.5.0/gems/pedump-0.5.4/data/userdb.txt ${*}
}

# A wrapper around the command to stop and start SSH server for old timers
function sshd {
  sudo systemctl ${*} ssh
}

# Convenient names
alias notepad="scite"
alias calc="galculator"
alias ipconfig="ifconfig"
alias xpdf="evince"

function run-wine-trace {
  WINEDEBUG=+relay wine ${*}
}