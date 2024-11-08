#!/usr/bin/env bash

# ==================================================
# Defining variables
# ==================================================
TARGET_DIR="$HOME/.config/Code/User"
SETTINGS_URL="https://raw.githubusercontent.com/x86-mota/vscode-settings/refs/heads/main/settings.json"
EXT_LIST=(
    postman.postman-for-vscode
    ms-azuretools.vscode-docker
    ms-python.python
    ms-dynamics-smb.al
    andrzejzwierzchowski.al-code-outline
    waldo.crs-al-language-extension
    miguelsolorio.symbols
)


# ==================================================
# Checks if the package is already installed
# ==================================================
function is_installed() {
    if ! command -v "$1" >/dev/null 2>&1; then
        return 1
    fi
}

# ==================================================
# Install VS Code extension
# ==================================================
function install_ext() {
    code --install-extension "$1"
}

# ==================================================
# Starts script execution
# ==================================================
if is_installed code; then
    mkdir -p "${TARGET_DIR}"
    curl -fsSL -o "${TARGET_DIR}/settings.json" "${SETTINGS_URL}"

    for ext in "${EXT_LIST[@]}"; do
        install_ext "${ext}"
    done
else
    Echo "ERROR: VS Code was not found on your system."
fi
