function set_proxy -a server -d "Set proxy environment variables"
    if test -z "$server" && command -sq scutil
        set output (command scutil --proxy)
        if string match -eq "HTTPEnable : 1" $output
            set address (string match -r "HTTPProxy : ([\d.]+)" $output)
            set port (string match -r "HTTPPort : (\d+)" $output)
            set server http://$address[2]:$port[2]
        end
    end

    for proxy in $proxy_vars
        if test "$$proxy" != $server
            set -gx $proxy $server
            printf "%s$proxy%s is set to %s$server\n" (set_color -o) (set_color normal) (set_color -o)
        end
    end
end
