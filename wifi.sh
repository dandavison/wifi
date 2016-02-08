# http://blog.mattcrampton.com/post/64144666914/managing-wifi-connections-using-the-mac-osx

# Turn wifi on/off
wifi () {
    val=$1
    [ "$val" = "on" ] || [ "$val" = "off" ] || {
        echo "usage: $0 [on|off]" 1>&2
        return
    }
    networksetup -setairportpower en0 $val
}

# List available wifi networks
wifi-list () {
    /System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport scan
}

# Join a wifi network
# networksetup -setairportnetwork en0 WIFI_SSID_I_WANT_TO_JOIN WIFI_PASSWORD

wifi-join () {
    networksetup -setairportnetwork en0 $1 $2
}


# Find your network interface name
# networksetup -listallhardwareports

ping-world () {
    ping -c 1 www.direct.gov.uk
}


wifi-poke () {
    wifi off && wifi on && until ping-world; do sleep 1; done
}
