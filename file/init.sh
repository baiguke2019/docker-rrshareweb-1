#!/bin/sh

echo "Extract file & Create Folder "

tar -xzf rrshareweb.tar.gz
rm -rf rrshareweb.tar.gz

echo "[DONE]"

echo "Setting conf"

if [[ -e /config/rrshare.db ]]
then
  rm -f /rrshareweb/conf/rrshare.db
  ln -s /config/rrshare.db /rrshareweb/conf/rrshare.db
else
  mv /rrshareweb/conf/rrshare.db /config/rrshare.db
  ln -s /config/rrshare.db /rrshareweb/conf/rrshare.db
fi


if [[ -e /config/rrshare.json ]]
then
  rm -f /rrshareweb/conf/rrshare.json
  ln -s /config/rrshare.json /rrshareweb/conf/rrshare.json
else
  mv /rrshareweb/conf/rrshare.json /config/rrshare.json
  ln -s /config/rrshare.json /rrshareweb/conf/rrshare.json
fi

echo "[DONE]"

echo "Starting server"

exec /rrshareweb/rrshareweb > /dev/stdout 2 > /dev/stderr

echo "[DONE]"

if 
