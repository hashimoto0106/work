pushd %~dp0
tshark -w ./004_hostip_filter.pcap -f "host 192.168.11.5" -f "port 80" -a duration:3
echo キャプチャ完了
pause
echo テキストファイルに変換します
tshark -r ./004_hostip_filter.pcap > ./004_hostip_filter.log
pause
