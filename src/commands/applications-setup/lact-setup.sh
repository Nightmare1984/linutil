#!/bin/sh -e

. ../common-script.sh

setuplact() {
    echo "Installing Lact"                                                   

    if command_exists lact; then
        echo "Lact is Already installed."
    
         case ${AUR_HELPERS} in
            pacman)
              ${AUR_HELPERS} -S --noconfirm lact
              ;;
            *)  
                  
        esac
    fi
}

checkEnv
checkAurHelper
setuplact