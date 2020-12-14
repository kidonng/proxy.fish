# 🐟🍎🌐 Fish macOS proxy

![Screenshot](screenshot.png)

Automatically set `ALL_PROXY` environment variable on macOS, reading proxy server form system preferences via `scutil`.

`ALL_PROXY` is widely supported, such as [curl](https://curl.se/) and [Homebrew](https://brew.sh/).

## Usage

With [Fisher](https://github.com/jorgebucaran/fisher):

```sh
fisher install kidonng/fish-macos-proxy
```

- Use `set_proxy` function to (un)set `ALL_PROXY`
  - `set_proxy` is executed at shell startup
  - You can also specify a proxy server as `set_proxy`'s argument
- Use `get_proxy` to print all proxy environment variables:
  - `ALL_PROXY` / `all_proxy`
  - `HTTP_PROXY` / `http_proxy`
  - `HTTPS_PROXY` / `https_proxy`
  - `FTP_PROXY` / `ftp_proxy`

## See also

- [zsh-osx-autoproxy](https://github.com/SukkaW/zsh-osx-autoproxy) - plugin for Zsh
