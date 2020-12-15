test -z "$proxy_vars" && set -U proxy_vars ALL_PROXY

set -q proxy_launch && set_proxy

function _proxy_uninstall --on-event proxy_uninstall
    set -e proxy_vars
    set -e proxy_launch
end
