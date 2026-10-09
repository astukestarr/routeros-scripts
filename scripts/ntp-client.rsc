# name: NTP client (Cloudflare and pool.ntp.org)
# description: Turns on the NTP client so logs, certificates and schedules use the right time. Replaces any NTP servers already set.
# author: astukestarr
# tags: basics, time, ntp
# routeros: 7.1+
/system ntp client set enabled=yes
/system ntp client servers remove [find]
/system ntp client servers add address=time.cloudflare.com
/system ntp client servers add address=pool.ntp.org
:put "NTP client enabled: time.cloudflare.com, pool.ntp.org"
