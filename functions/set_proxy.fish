function set_proxy -d "(Un)set ALL_PROXY environment variable"
    if test -n "$ALL_PROXY"
        set -e ALL_PROXY
        printf "%sALL_PROXY%s is unset\n" (set_color -o) (set_color normal)
        return
    end

    if test -n "$argv[1]"
        set proxy $argv[1]
    else if type -q scutil
        set output (scutil --proxy)
        if string match -eq "HTTPEnable : 1" $output
            set address (string match -r "HTTPProxy : ([\d.]+)" $output)
            set port (string match -r "HTTPPort : (\d+)" $output)
            set proxy http://$address[2]:$port[2]
        end
    end

    if set -q proxy
        set -gx ALL_PROXY $proxy
        printf "%sALL_PROXY%s is set to %s$proxy\n" (set_color -o) (set_color normal) (set_color -o)
    end
end
