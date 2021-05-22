function unset_proxy -d "Unset proxy environment variables"
    argparse g/global -- $argv || return

    for proxy in $proxy_vars
        if set -q $proxy
            if set -q _flag_global
                set -gx $proxy
                set message " (in current session)"
            else
                set -eg $proxy
                set -eU $proxy
            end

            echo (set_color -o)\$$proxy(set_color normal) is unset"$message"
        end
    end
end
