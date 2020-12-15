# 🐟🌐 Fish proxy

![Screenshot](screenshot.png)

Get, set and unset proxy environment variables with ease.

## Usage

With [Fisher](https://github.com/jorgebucaran/fisher):

```sh
fisher install kidonng/fish-proxy
```

- `get_proxy` will print the following environment variables:
  - `ALL_PROXY` / `all_proxy`
  - `HTTP_PROXY` / `http_proxy`
  - `HTTPS_PROXY` / `https_proxy`
  - `FTP_PROXY` / `ftp_proxy`
- `set_proxy` will set environment variables in `$proxy_vars` to the given server
  - If no server is specified, it will use system proxy config on macOS (via `scutil`)
  - `$proxy_vars` is `ALL_PROXY` by default, which is used by many, such as [curl](https://curl.se/) and [Homebrew](https://brew.sh/)
  - `set -U proxy_launch` to run `set_proxy` at shell startup
- `unset_proxy` will unset environment variables in `$proxy_vars`

## See also

- [zsh-osx-autoproxy](https://github.com/SukkaW/zsh-osx-autoproxy)
