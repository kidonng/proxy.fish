function unset_proxy -d "Unset proxy environment variables"
    for proxy in $proxy_vars
        if test -n "$$proxy"
            set -e $proxy
            printf "%s$proxy%s is unset\n" (set_color -o) (set_color normal)
        end
    end
end
