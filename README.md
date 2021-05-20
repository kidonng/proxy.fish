# 🐟🌐 proxy.fish

[Fish](https://fishshell.com/) plugin for querying and setting proxy environment variables.

![Screenshot](screenshot.png)

## Installation

- [plug.fish](https://github.com/kidonng/plug.fish)

  ```sh
  plug install kidonng/proxy.fish
  ```

- [Fisher](https://github.com/jorgebucaran/fisher)

  ```sh
  fisher install kidonng/proxy.fish
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

Set variables in `$proxy_vars` to the specified server.

The proxy will be available across all shells. To limit the change to current shell, specify `-g/--global` option.

- On macOS, if no server is specified, the plugin will try to get it from system proxy config (via `scutil`).

### `unset_proxy`

Unset (erase) variables in `$proxy_vars`.

To limit the change to current shell, specify `-g/--global` option.

## Related

- Oh My Fish [`proxy` plugin](https://github.com/oh-my-fish/plugin-proxy)
