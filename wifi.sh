# http://blog.mattcrampton.com/post/64144666914/managing-wifi-connections-using-the-mac-osx


# Turn off wifi on your macbook from the Mac OSX terminal command line:
# networksetup -setairportpower en0 off
# Turn on wifi on your macbook from the Mac OSX terminal command line:
# networksetup -setairportpower en0 on

wifi () {
    networksetup -setairportpower en0 $1
}

# List available wifi networks from the Mac OSX terminal command line:
# /System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport scan

wifi-list () {
    /System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport scan
}

# Join a wifi network from the Mac OSX terminal command line:
# networksetup -setairportnetwork en0 WIFI_SSID_I_WANT_TO_JOIN WIFI_PASSWORD

wifi-join () {
    networksetup -setairportnetwork en0 $1 $2
}


# Find your network interface name
# networksetup -listallhardwareports
