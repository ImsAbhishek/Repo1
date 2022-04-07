#!/bin/bash

client_id="LT9FdW5xn4zjDQkzvy"
secret="2yVYxw4vJjnwDUXCuwuLaRpuVz6wcFec"
access_token=`curl -X POST https://bitbucket.org/site/oauth2/access_token   -d grant_type=client_credentials   -u  $client_id:$secret | jq  '.access_token'`

curl -X POST -is -u  $client_id:$secret \
   -H "Authorization: Bearer $access_token" \
  -H 'Content-Type: application/json' \
 https://api.bitbucket.org/2.0/repositories/myglamm/test2/pipelines/ \
 -d '{
  "target": {
    "ref_type": "branch",
    "type": "pipeline_ref_target",
    "ref_name": "master"
  }
}'
