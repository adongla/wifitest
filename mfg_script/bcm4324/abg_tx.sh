#!/system/bin/sh

delay=100000
mode=$1
channel=$2
rate=$3
ant=$(($4+1))
power=$5

function logi {
	log -t "WifiTestCmd-abg_tx" -p i $1
}

logi "wl ver"
wl ver
logi "wl down"
wl down
logi "wl mpc 0"
wl mpc 0
logi "wl country ALL"
wl country ALL
logi "wl up"
wl up
usleep $delay
logi "wl phy_oclscdenable 0"
wl phy_oclscdenable 0
logi "wl interference 0"
wl interference 0
logi "wl scansuppress 1"
wl scansuppress 1
usleep $delay
logi "wl isup"
wl isup
logi "wl down"
wl down

if [ $channel -lt 15 ]; then
	logi "wl band b"
	wl band b
else
	logi "wl band a"
	wl band a
fi

logi "wl mimo_preamble 0"
wl mimo_preamble 0
logi "wl mimo_bw_cap 0"
wl mimo_bw_cap 0
logi "wl mimo_txbw -1"
wl mimo_txbw -1
logi "wl chanspec $channel"
wl chanspec $channel
logi "wl up"
wl up
usleep $delay
logi "wl phy_watchdog 0"
wl phy_watchdog 0
logi "wl sgi_tx 0"
wl sgi_tx 0
logi "wl nrate -r $rate"
wl nrate -r $rate
logi "wl down"
wl down
logi "wl up"
wl up
usleep $delay
logi "wl txchain $ant"
wl txchain $ant
logi "wl rxchain $ant"
wl rxchain $ant
logi "wl txpwr1 -o -d $power"
wl txpwr1 -o -d $power
logi "wl phy_forcecal 1"
wl phy_forcecal 1
logi "wl pkteng_start 10:20:30:40:50:60 tx 100 1500 0"
wl pkteng_start 10:20:30:40:50:60 tx 100 1500 0
