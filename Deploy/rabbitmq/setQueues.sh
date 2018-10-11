#!/bin/bash
IP=$(ip route get 1 | sed -n 's/^.*src \([0-9.]*\) .*$/\1/p')
PASS=$( kubectl get secret --namespace default mq-rabbitmq -o jsonpath="{.data.rabbitmq-password}" | base64 --decode )

queues=(3 3_L 3_H 5 5_L 5_H 10 10_L 10_H 11 11_L 11_H 12 12_L 12_H)

for ((i=0; i<${#queues[@]}; i++)); do 
  curl  -u snake_eyes:"$PASS" -X PUT -H "Content-Type: application/json" -d '{"vhost": "/", "name": "${queues[$i]}", "durable": "true", "auto_delete": "false", "arguments": {}}' http://$IP:31075/api/queues/%2f/${queues[$i]}
  echo "rabbitmq queue 3 created!"
done

echo "You can open rabbitmq manager($IP:31075) to check."
