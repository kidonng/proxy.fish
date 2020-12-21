function get_proxy -d "Get proxy environment variables"
    for proxy in ALL_PROXY all_proxy HTTP_PROXY http_proxy HTTPS_PROXY https_proxy FTP_PROXY ftp_proxy
        if test -n "$$proxy"
            builtin printf "%s$proxy%s has been set to %s$$proxy\n" (builtin set_color -o) (builtin set_color normal) (builtin set_color -o)
        end
    end
end
