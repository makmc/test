#!/bin/sh

# config xray
cat << EOF > /etc/config.json
{
  "inbounds":[
    {
      "listen": "0.0.0.0",
      "port": $PORT,
      "protocol": "shadowsocks",
      "settings": {
         "method": "2022-blake3-aes-128-gcm",
         "password": "v/+g/FxKW3Tlv7tm9+Gmpw==",
         "network": "tcp,udp"
      },
      "sniffing": {
        "enabled": true,
	"destOverride": [
	    "http",
	    "tls"
	]
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
