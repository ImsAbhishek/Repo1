#!/bin/bash

client_id="sCVahng3ZuyQZdGYBf"
secret="PAtqjb7U6G2swLevTzKLc9smaxJRsc7s"
access_token=`curl -X POST https://bitbucket.org/site/oauth2/access_token   -d grant_type=client_credentials   -u  $client_id:$secret | jq  '.access_token'`

curl -X POST -is -u  $client_id:$secret \
   -H "Authorization: Bearer $access_token" \
  -H 'Content-Type: application/json' \
 https://api.bitbucket.org/2.0/repositories/MyGlamm/test2/pipelines/ \
 -d '{
  "target": {
    "ref_type": "branch",
    "type": "pipeline_ref_target",
    "ref_name": "master"
  },

  "variables": [
      {
        "key": "file",
        "value": "testFile"
      }
    ]
}'
