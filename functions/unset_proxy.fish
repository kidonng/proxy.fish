function unset_proxy -d "Unset proxy environment variables"
    argparse g/global -- $argv || return

    for proxy in $proxy_vars
        if set -q $proxy
            if set -q _flag_global
                set -gx $proxy
                set message " (in current shell)"
            else
                set -eg $proxy
                set -eU $proxy
            end

            builtin printf "%s\$$proxy%s is unset$message\n" (builtin set_color -o) (builtin set_color normal)
        end
    end
end
