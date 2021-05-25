function unset_proxy -d "Unset proxy variables"
    argparse a/all g/global -- $argv || return

    set -q _flag_all && set -l proxy_vars ALL_PROXY all_proxy HTTP_PROXY http_proxy HTTPS_PROXY https_proxy FTP_PROXY ftp_proxy

    for proxy in $proxy_vars
        if set -q $proxy
            set -l message

            if set -q _flag_global
                set -gx $proxy
                set message " (in current session)"
            else
                set -eg $proxy
                set -eU $proxy
            end

            echo (set_color -o)'$'$proxy(set_color normal) is unset"$message"
        end
    end
end
