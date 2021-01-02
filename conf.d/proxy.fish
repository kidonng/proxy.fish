function _proxy_install --on-event proxy_install
    if test -z "$proxy_vars"
        set -U proxy_vars ALL_PROXY
    end
end

function _proxy_uninstall --on-event proxy_uninstall
    set -e proxy_vars proxy_launch
    builtin functions -e _proxy_install _proxy_uninstall
end

if set -q proxy_launch
    set_proxy
end
