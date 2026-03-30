[[ -z "$WSL_DISTRO_NAME" ]] && return

alias explorer='explorer.exe'

# Open a folder in Windsurf from WSL
ws() {
  local folder
  folder=$(readlink -f "${1:-.}")
  windsurf --folder-uri "vscode-remote://wsl+${WSL_DISTRO_NAME}${folder}"
}
