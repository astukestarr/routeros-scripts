# name: Turn off telnet and FTP
# description: Disables the telnet and FTP services, which send passwords in clear text. Leaves SSH, Winbox and www alone (TikManager manages routers over www).
# author: astukestarr
# tags: security, basics, services
# routeros: 7.1+
/ip service disable [find where name="telnet" or name="ftp"]
:foreach s in=[/ip service find where name="telnet" or name="ftp"] do={
  :put ([/ip service get $s name] . " disabled")
}
