function unset_proxy -d "Unset proxy environment variables"
    for proxy in $proxy_vars
        if test -n "$$proxy"
            set -e $proxy
            builtin printf "%s$proxy%s is unset\n" (builtin set_color -o) (builtin set_color normal)
        end
    end
end
