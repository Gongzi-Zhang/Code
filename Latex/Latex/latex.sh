#!/bin/bash

#------------------------------------------------------------------------
#
# TeXLive installation
#
#------------------------------------------------------------------------
### download image
wget http://mirror.ctan.org/systems/texlive/Images/texlive2018.iso
wget http://mirror.ctan.org/systems/texlive/Images/texlive2018.iso.sha512
sha512sum -c texlive2018.iso.sha512
### mount image
sudo mkdir -p /media/iso
sudo mount -o loop texlive2018.iso /media/iso
### install, it will be installed in /usr/local/texlive
cd /media/iso
sudo ./install-tl
### configure
cat <<EOF >> $HOME/.bashrc
export PATH="/usr/local/texlive/2018/bin/x86_64-linux:$PATH"
export INFOPATH="/usr/local/texlive/2018/texmf-dist/dot/info:$INFOPATH"
export MANPATH="/usr/local/texlive/2018/texmf-dist/doc/man:$MANPATH"
EOF
sudo apt install xzdec -y
sudo tlmgr update --self --all

#------------------------------------------------------------------------
#
# Latex management and configuration
#
#------------------------------------------------------------------------

# Latex package manager         
tlmgr option repository http://mirror.ctan.org/systems/texlive/tlnet
    # set new package repository

tlmgr info <package>
    # search the info of a package

tlmgr install <package>
    # install new package
tlmgr install --dry-run <package> 
    # to show the package dependencies.

tlmgr update --list
    # report update list
tlmgr update --all
    # update 

## error
"cannot setup TLPDB in /home/USER/texmf at /usr/bin/tlmgr line 5604"
tlmgr init-usertree
    # init usertree, which create texmf/web2c, texmf/tlpkg/tlpobj and
    # texmf/tlpkg/texlive.tlpdb file.

"Unknown directive ..."
"This is cause by version mismatch, the texlive is version 2015 while
tlmgr is query 2016 repository, so to solve the problem, you can either
upgrade your texlive to 2016 or downgrade your tlmgr to 2015 with the
command:"
tlmgr option repository ftp://tug.org/historic/systems/texlive/2015/tlnet-final

# kpse family
kpsewhich  --var-value TEXMFLOCAL
    # find systematic texmf tree.
kpsewhich {package}.sty
    # check if a package is installed or not.


# lsr: filename database
mktexlsr
    # update "TeX filename database"
texhash	~/texmf	# update personal datebase

# Fonts
tex testfont
    # standard font test file
