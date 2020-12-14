function set_proxy -d "(Un)set ALL_PROXY environment variable"
    if _set_proxy $argv[1]
        return
    end

    if test -n "$ALL_PROXY"
        set -e ALL_PROXY
        printf "%sALL_PROXY%s is unset\n" (set_color -o) (set_color normal)
    else if command -sq scutil
        set output (command scutil --proxy)
        if string match -eq "HTTPEnable : 1" $output
            set address (string match -r "HTTPProxy : ([\d.]+)" $output)
            set port (string match -r "HTTPPort : (\d+)" $output)
            _set_proxy http://$address[2]:$port[2]
        end
    end
end

function _set_proxy
    set proxy $argv[1]

    if test -n "$proxy"
        set -gx ALL_PROXY $proxy
        printf "%sALL_PROXY%s is set to %s$proxy\n" (set_color -o) (set_color normal) (set_color -o)
        return
    end

    return 1
end
