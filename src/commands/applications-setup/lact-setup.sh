#!/bin/sh -e

. ../common-script.sh

setuplact() {
    echo "Installing Lact"

    if command_exists lact; then
        echo "Lact is already installed."
        return
    fi

    checkAurHelper

    for helper in "${AUR_HELPERS[@]}"; do
        if command -v "${helper}" &> /dev/null; then
            echo "Using AUR helper: ${helper}"
            ${helper} -S --noconfirm lact
            return
        fi
    done

    echo "${RED}No suitable AUR helper found to install Lact!${RC}"
    exit 1
}

setuplact