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

            builtin printf "%s\$$variable%s has been set to %s$value%s\n" (builtin set_color -o) (builtin set_color normal) (builtin set_color -o) (builtin set_color normal)
        else
            builtin printf "%s\$$variable%s is not set\n" (builtin set_color -o) (builtin set_color normal)
        end
    end
end
