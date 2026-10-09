# name: Router summary (read-only)
# description: Prints identity, RouterOS version, uptime, CPU, free memory and IP addresses. Changes nothing - a safe first script to try.
# author: astukestarr
# tags: report, basics
# routeros: 7.1+
:put ("Identity: " . [/system identity get name])
:put ("RouterOS: " . [/system resource get version])
:put ("Board: " . [/system resource get board-name])
:put ("Uptime: " . [/system resource get uptime])
:put ("CPU load: " . [/system resource get cpu-load] . "%")
:put ("Free memory: " . ([/system resource get free-memory] / 1048576) . " MB of " . ([/system resource get total-memory] / 1048576) . " MB")
:foreach a in=[/ip address find where disabled=no] do={
  :put ("Address: " . [/ip address get $a address] . " on " . [/ip address get $a interface])
}
