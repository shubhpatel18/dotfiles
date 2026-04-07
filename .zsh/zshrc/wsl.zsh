[[ -z "$WSL_DISTRO_NAME" ]] && return

alias explorer='explorer.exe'
alias wpath='wslpath -w'

# Open a folder in Windsurf from WSL
ws() {
  local folder
  folder=$(readlink -f "${1:-.}")
  windsurf --folder-uri "vscode-remote://wsl+${WSL_DISTRO_NAME}${folder}"
}

# Open a folder in Obsidian, auto-registering as a vault if needed
obsidian() {
  local folder obsidian_json
  folder=$(realpath "${1:-.}")
  obsidian_json="$HOME/.config/obsidian/obsidian.json"

  # Ensure .obsidian dir exists so Obsidian treats it as a vault
  [[ -d "${folder}/.obsidian" ]] || mkdir -p "${folder}/.obsidian"

  # Register vault if not already in obsidian.json
  mkdir -p "$(dirname "$obsidian_json")"
  [[ -f "$obsidian_json" ]] || echo '{"vaults":{}}' > "$obsidian_json"
  FOLDER="$folder" python3 -c "
import json, os, time
path = os.path.expanduser('~/.config/obsidian/obsidian.json')
cfg = json.load(open(path))
folder = os.environ['FOLDER']
if not any(v['path'] == folder for v in cfg['vaults'].values()):
    import secrets
    cfg['vaults'][secrets.token_hex(8)] = {'path': folder, 'ts': int(time.time() * 1000), 'open': True}
    json.dump(cfg, open(path, 'w'))
"

  nohup /snap/obsidian/current/obsidian --no-sandbox "obsidian://open?path=$folder" &>/dev/null &
  disown
}
