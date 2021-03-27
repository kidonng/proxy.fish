# 🐟🌐 Fish proxy

[Fish](https://fishshell.com/) plugin for querying and setting proxy environment variables.

![Screenshot](screenshot.png)

## Installation

- [Fish plug](https://github.com/kidonng/fish-plug)

  ```sh
  plug install kidonng/fish-proxy
  ```

- [Fisher](https://github.com/jorgebucaran/fisher)

  ```sh
  fisher install kidonng/fish-proxy
  ```
## Usage

### `get_proxy`

Print the following environment variables if set:

- `ALL_PROXY` / `all_proxy`
- `HTTP_PROXY` / `http_proxy`
- `HTTPS_PROXY` / `https_proxy`
- `FTP_PROXY` / `ftp_proxy`

### `set_proxy [server]`

Set environment variables in `$proxy_vars` to the specified server.

If a variable is already set to the specified server, it won't be changed (i.e. it will remain exported/unexported).

- `$proxy_vars` is set to `ALL_PROXY` by default, which is used by [curl](https://curl.se/), [Homebrew](https://brew.sh/) and most other programs.
  - If you want to use different variables, for example both  `ALL_PROXY` and `HTTP_PROXY`,  run `set -U proxy_vars ALL_PROXY HTTP_PROXY`.
- On macOS, if no server is specified, the plugin will use system proxy config (via `scutil`).
- You can configure the plugin to run `set_proxy` on interactive shell startup by `set -U proxy_launch`.
  - To silence the message on startup, use `set -U proxy_launch_silent`.

### `unset_proxy`

Unset environment variables in `$proxy_vars`.

The variables will be erased, not just unexported.

## Related

- Oh My Fish [`proxy` plugin](https://github.com/oh-my-fish/plugin-proxy)
