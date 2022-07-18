#!/bin/sh

sed -i 's/MQTT_HOST/'$MQTT_HOST'/' mqtt.yml
sed -i 's/MQTT_PORT/'$MQTT_PORT'/' mqtt.yml
sed -i 's/MQTT_USER/'$MQTT_USER'/' mqtt.yml
sed -i 's/MQTT_PW/'$MQTT_PW'/' mqtt.yml
sed -i 's/MQTT_SSL/'$MQTT_SSL'/' mqtt.yml
sed -i 's|MQTT_PREFIX|'$MQTT_PREFIX'|' mqtt.yml
sed -i 's/MQTT_INTERVAL/'$MQTT_INTERVAL'/' mqtt.yml

cat mqtt.yml
echo "MADOKA_MAC: $MADOKA_MAC"
echo "BT_ADAPTER: $BT_ADAPTER"

pymadoka-mqtt -a $MADOKA_MAC -c mqtt.yml -d $BT_ADAPTER --debug --verbose
