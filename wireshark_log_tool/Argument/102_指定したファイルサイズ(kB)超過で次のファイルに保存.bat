@echo off
echo 指定したファイルサイズ(kB)超過で次のファイルに保存
z:
cd Z:\Project\Tools\101_Wireshark\Argument
tshark -i 3 -s 12 -b filesize:100 -w ./binary.pcap -a duration:10
echo ネットワークログ取得完了
pause
