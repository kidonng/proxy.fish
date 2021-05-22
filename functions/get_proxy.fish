function get_proxy -d "Get proxy environment variables"
    argparse a/all -- $argv

    if set -q _flag_all
        set variables ALL_PROXY all_proxy HTTP_PROXY http_proxy HTTPS_PROXY https_proxy FTP_PROXY ftp_proxy
    else
        set variables $proxy_vars
    end

    for variable in $variables
        if set -q $variable
            if test -z "$$variable"
                set value "(empty)"
            else
                set value $$variable
            end

            echo (set_color -o)\$$variable(set_color normal) has been set to (set_color -o)$value(set_color normal)
        else
            echo (set_color -o)\$$variable(set_color normal) is not set
        end
    end
end
