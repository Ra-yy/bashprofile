#!/bin/bash

RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
BLUE=$(tput setaf 4)
RESET=$(tput sgr0)

AMASS_VERSION=3.8.2


echo "${RED} ######################################################### ${RESET}"
echo "${RED} #                 TOOLS FOR BUG BOUNTY                  # ${RESET}"
echo "${RED} ######################################################### ${RESET}"
logo(){
echo "${BLUE}
                ___ ___ _  _ _____     ___
               | _ ) _ ) || |_   _|_ _|_  )
               | _ \ _ \ __ | | | \ V // /
               |___/___/_||_| |_|  \_//___| ${RESET}"
}
logo
echo ""
echo "${GREEN} Tools created by the best people in the InfoSec Community ${RESET}"
echo "${GREEN}                   Thanks to everyone!                     ${RESET}"
echo ""


echo "${GREEN} [+] Updating and installing dependencies ${RESET}"
echo ""

sudo apt-get -y update

sudo add-apt-repository -y ppa:apt-fast/stable < /dev/null
sudo echo debconf apt-fast/maxdownloads string 16 | debconf-set-selections
sudo echo debconf apt-fast/dlflag boolean true | debconf-set-selections
sudo echo debconf apt-fast/aptmanager string apt-get | debconf-set-selections
sudo apt install -y apt-fast

sudo apt-fast install -y apt-transport-https
sudo apt-fast install -y libcurl4-openssl-dev
sudo apt-fast install -y libssl-dev
sudo apt-fast install -y jq
sudo apt-fast install -y libcurl4-openssl-dev libxml2 libxml2-dev libxslt1-dev ruby-dev build-essential libgmp-dev zlib1g-dev
sudo apt-fast install -y build-essential libssl-dev libffi-dev python-dev
sudo apt-fast install -y python-setuptools
sudo apt-fast install -y libldns-dev
sudo apt-fast install -y python3-pip
sudo apt-fast install -y python-dnspython
sudo apt-fast install -y git
sudo apt-fast install -y nmap phantomjs 
sudo apt-fast install -y gem
pip3 install jsbeautifier
echo ""
echo ""
sar 1 1 >/dev/null

#Setting shell functions/aliases
echo "${GREEN} [+] Setting bash_profile aliases ${RESET}"
curl https://raw.githubusercontent.com/unethicalnoob/aliases/master/bashprofile > ~/.bash_profile
echo "${BLUE} If it doesn't work, set it manually ${RESET}"
echo ""
echo ""
sar 1 1 >/dev/null 

echo "${GREEN} [+] Installing Golang ${RESET}"
if [ ! -f /usr/bin/go ];then
    cd ~
    wget -q -O - https://raw.githubusercontent.com/canha/golang-tools-install-script/master/goinstall.sh | bash
	export GOROOT=$HOME/.go
	export PATH=$GOROOT/bin:$PATH
	export GOPATH=$HOME/go
    echo 'export GOROOT=$HOME/.go' >> ~/.bash_profile
	
	echo 'export GOPATH=$HOME/go'	>> ~/.bash_profile			
	echo 'export PATH=$GOPATH/bin:$GOROOT/bin:$PATH' >> ~/.bash_profile
    source ~/.bash_profile 
else 
    echo "${BLUE} Golang is already installed${RESET}"
fi
    break
echo""
echo "${BLUE} Done Install Golang ${RESET}"
echo ""
echo ""
sar 1 1 >/dev/null

#Installing tools

echo "${RED} #################### ${RESET}"
echo "${RED} # Installing tools # ${RESET}"
echo "${RED} #################### ${RESET}"


echo "${GREEN} #### Basic Tools #### ${RESET}"

#install nmap
echo "${BLUE} installing nmap${RESET}"
sudo apt-fast install -y nmap
echo "${BLUE} done${RESET}"
echo ""

#install sqlmap
echo "${BLUE} installing sqlmap${RESET}"
sudo apt-fast install sqlmap
echo "${BLUE} done${RESET}"
echo ""

sar 1 1 >/dev/null
echo ""

echo "${GREEN}#### Installing fuzzing tools ####${RESET}"

#install ffuf
echo "${BLUE} installing ffuf${RESET}"
go get -u github.com/ffuf/ffuf
echo "${BLUE} done${RESET}"
echo ""

sar 1 1 >/dev/null

echo "${GREEN} #### Installing XSS Tools#### ${RESET}"

echo "${BLUE} installing dalfox${RESET}"
git clone https://github.com/hahwul/dalfox ~/tools/dalfox
cd ~/tools/dalfox/ && go build dalfox.go
sudo cp dalfox /usr/bin/
echo "${BLUE} done${RESET}"
echo ""

sar 1 1 >/dev/null

echo "${GREEN} #### Installing CMS Tools #### ${RESET}" 

#install wpscan
echo "${BLUE} installing wpscan${RESET}"
sudo gem install wpscan
echo "${BLUE} done${RESET}"
echo ""
sar 1 1 >/dev/null

echo "${GREEN}#### Other Tools ####${RESET}"

echo "${BLUE} Paramspider${RESET}"
git clone https://github.com/devanshbatham/ParamSpider ~/tools/ParamSpider
cd ~/tools/ParamSpider
sudo pip3 install -r requirements.txt
echo "${BLUE} done${RESET}"
echo ""

echo "${BLUE} installing gau${RESET}"
go get -u github.com/lc/gau
echo "${BLUE} done${RESET}"
echo ""

sar 1 1 >/dev/null


echo "${GREEN}#### ProjectDiscovery Pinned Tools ####${RESET}"

echo "${BLUE} installing naabu${RESET}"
GO111MODULE=on go get -u -v github.com/projectdiscovery/naabu/v2/cmd/naabu
echo "${BLUE} done${RESET}"
echo ""

echo "${BLUE} installing nuclei${RESET}"
go get -u github.com/projectdiscovery/nuclei/v2/cmd/nuclei
echo "${BLUE} done${RESET}"
echo ""

echo "${BLUE} installing subfinder${RESET}"
GO111MODULE=on go get -u -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder
echo "${BLUE} done${RESET}"
echo ""

echo "${BLUE} installing httpx${RESET}"
go get -u github.com/projectdiscovery/httpx/cmd/httpx
echo "${BLUE} done${RESET}"
echo ""
sar 1 1 >/dev/null


echo "${GREEN} #### Installing tomnomnom tools #### ${RESET}"
echo "${GREEN}   check out his other tools as well  ${RESET}"

echo "${BLUE} installing gf${RESET}"
go get -u github.com/tomnomnom/gf
echo "${BLUE} done${RESET}"
echo ""
sar 1 1 >/dev/null

echo "${GREEN} #### Other other Tools #### ${RESET}"

echo "${BLUE} installing arjun${RESET}"
git clone https://github.com/s0md3v/Arjun.git ~/tools/Arjun
echo "${BLUE} done${RESET}"
echo ""
sar 1 1 >/dev/null

git clone https://github.com/1ndianl33t/Gf-Patterns.git

echo "${GREEN} use the command 'source ~/.bash_profile' for the shell functions to work ${RESET}"
echo ""
echo "${GREEN}  ALL THE TOOLS ARE MADE BY THE BEST PEOPLE OF THE INFOSEC COMMUNITY ${RESET}"
echo ""
echo "${GREEN}                I AM JUST A SCRIPT-KIDDIE ;)                         ${RESET}"
