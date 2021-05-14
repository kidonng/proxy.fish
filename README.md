# 🐟🌐 Fish proxy

[Fish](https://fishshell.com/) plugin for querying and setting proxy environment variables.

![Screenshot](screenshot.png)

## Installation

- [plug.fish](https://github.com/kidonng/plug.fish)

  ```sh
  plug install kidonng/fish-proxy
  ```

- [Fisher](https://github.com/jorgebucaran/fisher)

  ```sh
  fisher install kidonng/fish-proxy
  ```
## Usage

Configure `$proxy_vars` before using the following functions, e.g. `set -U proxy_vars ALL_PROXY`.

### `get_proxy`

Print variables in `$proxy_vars` in a readable format.

If `-a/--all` argument is specified, print the following variables instead:

- `ALL_PROXY` / `all_proxy`
- `HTTP_PROXY` / `http_proxy`
- `HTTPS_PROXY` / `https_proxy`
- `FTP_PROXY` / `ftp_proxy`

### `set_proxy [server]`

Set (`set -Ux`) variables in `$proxy_vars` to the specified server, skipping variables which has the same value.

If `-g/--global` argument is specified, global variable scope will be used instead.

- On macOS, if no server is specified, the plugin will use system proxy config (via `scutil`).
- Add the following code in `$__fish_config_dir/config.fish` to automatically set the variables.

  ```fish
  if status -i && functions -q set_proxy
      # or use bare `set_proxy` if you prefer verbosity
      set_proxy > /dev/null
  end
  ```

### `unset_proxy`

Unset (`set -e`) variables in `$proxy_vars`.

## Related

- Oh My Fish [`proxy` plugin](https://github.com/oh-my-fish/plugin-proxy)
