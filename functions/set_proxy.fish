function set_proxy -a server -d "Set proxy variables"
    argparse a/all g/global -- $argv || return

    set -q _flag_all && set -l proxy_vars ALL_PROXY all_proxy HTTP_PROXY http_proxy HTTPS_PROXY https_proxy FTP_PROXY ftp_proxy

    if test -z "$server"
        # TODO: support more OS/DE
        if command -sq scutil
            set -l output (scutil --proxy)

            if string match -eq "HTTPEnable : 1" $output
                set -l address (string match -r "HTTPProxy : ([\d.]+)" $output)[2]
                set -l port (string match -r "HTTPPort : (\d+)" $output)[2]
                set server http://$address:$port
            end
        else
            echo (status current-command): Proxy server is neither specified nor available via system proxy config >&2
            return 1
        end
    end

    test -z "$server" && return
    
    set -l scope U
    set -l message

    if set -q _flag_global
        set scope g
        set message " (in current session)"
    end

    for proxy in $proxy_vars
        if test "$$proxy" != $server
            set -$scope -x $proxy $server
            echo (set_color -o)'$'$proxy(set_color normal) is set to (set_color -o)$server(set_color normal)"$message"
        end
    end
end
