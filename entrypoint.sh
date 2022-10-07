#!/bin/sh

# config xray
cat << EOF > /etc/config.json
{
  "inbounds":[
    {
      "listen": "127.0.0.1",
      "port": 4324,
      "protocol": "shadowsocks",
      "settings": {
         "method": "2022-blake3-aes-128-gcm",
         "password": "v/+g/FxKW3Tlv7tm9+Gmpw==",
         "network": "tcp,udp"
      },
      "streamSettings": {
        "network": "ws"
      }
    }
  ],
  "outbounds": [
    {
      "protocol": "freedom"
    }
  ]
}	
EOF

# run xray
/usr/bin/xray run -config /etc/config.json
