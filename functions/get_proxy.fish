function get_proxy -d "Display proxy variables"
    argparse a/all -- $argv

    set -q _flag_all && set -l proxy_vars ALL_PROXY all_proxy HTTP_PROXY http_proxy HTTPS_PROXY https_proxy FTP_PROXY ftp_proxy

    for variable in $proxy_vars
        if set -q $variable
            set -l value $$variable
            test -z "$value" && set value "(empty)"

            echo (set_color -o)'$'$variable(set_color normal) has been set to (set_color -o)$value(set_color normal)
        else
            echo (set_color -o)'$'$variable(set_color normal) is not set
        end
    end
end
