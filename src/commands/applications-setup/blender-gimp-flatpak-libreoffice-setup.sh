#!/bin/sh -e

. ../common-script.sh

setupbgal() {
    echo "Installing Blender Gimp And flatpak And libreoffice"                                                   

    if command_exists blender; then
        echo "Blender is already installed."
    fi

    if command_exists gimp; then
        echo "Gimp is already installed."
    fi

    if command_exists flatpak; then
        echo "Flatpak is already installed."
    fi

    if command_exists libreoffice; then 
        echo "LibreOffice is already installed."
    fi

    if ! command_exists blender && ! command_exists gimp && ! command_exists flatpak && ! command_exists libreoffice; then
        case ${PACKAGER} in
            pacman)
                $ESCALATION_TOOL "${PACKAGER}" -S --needed --noconfirm blender
                $ESCALATION_TOOL "${PACKAGER}" -S --needed --noconfirm gimp
                $ESCALATION_TOOL "${PACKAGER}" -S --needed --noconfirm libreoffice-fresh
                $ESCALATION_TOOL "${PACKAGER}" -S --needed --noconfirm flatpak
                ;;
            *)  
                echo "Unsupported package manager: ${PACKAGER}"  
                ;;
        esac
    fi
}

checkEnv
checkEscalationTool
setupbgal
