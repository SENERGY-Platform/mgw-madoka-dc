FROM python:3-alpine

LABEL org.opencontainers.image.source https://github.com/SENERGY-Platform/mgw-madoka-dc

RUN apk add bluez git && pip install git+https://github.com/SENERGY-Platform/pymadoka.git

ENV MQTT_HOST message-broker
ENV MQTT_PORT 1881
ENV MQTT_USER ""
ENV MQTT_PW ""
ENV MQTT_SSL False
ENV MQTT_PREFIX madoka
ENV MQTT_INTERVAL 15
ENV MADOKA_MAC "00:00:00:00:00:00"
ENV BT_ADAPTER hci0

ADD mqtt.yml .
ADD madoka.sh .

CMD ["sh", "./madoka.sh"]
