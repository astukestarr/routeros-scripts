# name: Block SSH brute force
# description: Blacklists addresses that open 4 new SSH connections within about a minute, for 10 days. Adds 5 firewall rules at the top of the input chain (removes its own old ones first).
# author: astukestarr
# tags: security, firewall, ssh
# routeros: 7.1+
# Rules are added at the top, in reverse, so they end up in this order: drop blacklisted, stage 3 -> blacklist,
# stage 2 -> 3, stage 1 -> 2, new connection -> stage 1. Addresses on the blacklist can't reach SSH for 10 days.
/ip firewall filter remove [find comment~"^SSH brute force"]
/ip firewall filter add chain=input protocol=tcp dst-port=22 connection-state=new action=add-src-to-address-list address-list=ssh_stage1 address-list-timeout=1m comment="SSH brute force: stage 1" place-before=0
/ip firewall filter add chain=input protocol=tcp dst-port=22 connection-state=new src-address-list=ssh_stage1 action=add-src-to-address-list address-list=ssh_stage2 address-list-timeout=1m comment="SSH brute force: stage 2" place-before=0
/ip firewall filter add chain=input protocol=tcp dst-port=22 connection-state=new src-address-list=ssh_stage2 action=add-src-to-address-list address-list=ssh_stage3 address-list-timeout=1m comment="SSH brute force: stage 3" place-before=0
/ip firewall filter add chain=input protocol=tcp dst-port=22 connection-state=new src-address-list=ssh_stage3 action=add-src-to-address-list address-list=ssh_blacklist address-list-timeout=10d comment="SSH brute force: to blacklist" place-before=0
/ip firewall filter add chain=input protocol=tcp dst-port=22 src-address-list=ssh_blacklist action=drop comment="SSH brute force: drop blacklisted" place-before=0
:put "SSH brute-force protection added (address list ssh_blacklist)"
