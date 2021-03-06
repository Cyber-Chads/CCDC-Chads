Write-Host "[*] Deleting all firewall rules..."
netsh advfirewall firewall delete rule name="all"

Write-Host "[*] Enabling firewall..."
netsh advfirewall set currentprofile state on

Write-Host "[*] Turning on all profiles..."
netsh advfirewall set allprofiles state on

Write-Host "[*] Setting default policy to block all"
netsh advfirewall set allprofiles firewallpolicy "blockinbound,blockoutbound"

Write-Host "[*] Adding TCP inbound rule: 25, 53, 80, 110, 389, 443, 587, 636, 995, 9997"
netsh advfirewall firewall add rule name="Allow Inbound TCP" protocol=TCP dir=in localport="25,53,80,110,389,443,587,636,995,9997" action=allow

Write-Host "[*] Adding UDP inbound rule: 53, 80, 123, 443"
netsh advfirewall firewall add rule name="Allow Inbound UDP" protocol=UDP dir=in localport="53,80,123,443" action=allow

Write-Host "[*] Adding TCP outbound rule: 53, 80, 443, 8080, 9997"
netsh advfirewall firewall add rule name="Allow Outbound TCP" protocol=TCP dir=out localport="53,80,443,8080,9997" action=allow

Write-Host "[*] Adding UDP outbound rule: 25, 53, 80, 123, 389, 443"
netsh advfirewall firewall add rule name="Allow Outbound UDP" protocol=UDP dir=out localport="25,53,80,123,389,443" action=allow

Write-Host "[*] Adding ICMP inbound/outbound rules..."
netsh advfirewall firewall add rule name="ICMP in" protocol="icmpv4:8,any" dir=in action=allow
netsh advfirewall firewall add rule name="ICMP out" protocol="icmpv4:8,any" dir=out action=allow

Write-Host "[*] Configuring banner information..."
Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System" -Name "legalnoticecaption" -Value "LEGAL DISCLAIMER:"
Set-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System" -Name "legalnoticetext" -Value "This computer system is the property of TEAM9 LLC. By using this system, all users acknowledge notice of, and agree to comply with, the Acceptable User of Information Technology Resources Polity (AUP). By using this system, you consent to these terms and conditions. Use is also consent to monitoring, logging, and use of logging to prosecute abuse. If you do not wish to comply with these terms and conditions, you must LOG OFF IMMEDIATELY."

Write-Host "[*] Done! Go get 'em tiger!!!"