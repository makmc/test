#!/bin/sh

# config xray
cat << EOF > /etc/config.json
{
  "inbounds":[
    {
      "port": 5000,
      "protocol": "shadowsocks",
      "settings": {
         "method": "2022-blake3-aes-128-gcm",
         "password": "v/+g/FxKW3Tlv7tm9+Gmpw==",
         "network": "tcp,udp"
      },
      "streamSettings": {
        "network": "tcp"
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
