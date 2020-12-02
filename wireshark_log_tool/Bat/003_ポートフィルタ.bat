pushd %~dp0
tshark -w ./003_port_filter.pcap -f "port 80" -a duration:3
pause
tshark -r ./003_port_filter.pcap > ./003_port_filter.log
pause
