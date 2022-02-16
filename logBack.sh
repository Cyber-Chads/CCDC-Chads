#!/bin/bash
python -m SimpleHTTPServer 8000 > httplog.txt &

while(true)
do
sudo tar -cf log.tar /var/log
sleep 600
done
