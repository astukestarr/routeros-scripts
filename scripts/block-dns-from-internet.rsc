# name: Block DNS requests from the internet
# description: Stops the router answering DNS from the internet (open resolvers get abused for attacks) while it keeps serving your LAN. Needs the WAN interface list from the default configuration.
# author: astukestarr
# tags: security, firewall, dns
# routeros: 7.1+
:if ([:len [/interface list find name=WAN]] = 0) do={ :error "There's no interface list called WAN - add your internet interface(s) to one first" }
/ip firewall filter remove [find comment="Block DNS from the internet"]
/ip firewall filter add chain=input in-interface-list=WAN protocol=udp dst-port=53 action=drop comment="Block DNS from the internet" place-before=0
/ip firewall filter add chain=input in-interface-list=WAN protocol=tcp dst-port=53 action=drop comment="Block DNS from the internet" place-before=0
:put "DNS from the internet (WAN list) is now dropped"
