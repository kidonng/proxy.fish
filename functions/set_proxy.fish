function set_proxy -d "Set proxy environment variables"
    argparse g/global -- $argv || return
    set server $argv[1]

    if test -z "$server" && command -sq scutil
        set output (command scutil --proxy)
        if string match -eq "HTTPEnable : 1" $output
            set address (string match -r "HTTPProxy : ([\d.]+)" $output)
            set port (string match -r "HTTPPort : (\d+)" $output)
            set server http://$address[2]:$port[2]
        end
    end

    if test -z "$server"
        echo Proxy server is neither detected nor specified >&2
        return 1
    end

    if set -q _flag_global
        set scope g
        set message " (in current shell)"
    else
        set scope U
    end

    for proxy in $proxy_vars
        if test "$$proxy" != $server
            set -$scope -x $proxy $server
            echo (set_color -o)\$$proxy(set_color normal) is set to (%set_color -o)$server(set_color normal)"$message"
        end
    end
end
