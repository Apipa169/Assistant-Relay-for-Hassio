CONFIG_PATH=/data/options.json
PORT=$(jq --raw-output ".port | length" $CONFIG_PATH)
AUDIORESPONSE="/data/audio-responses"
CONFIG="/data/config.json"
if [ ! -d "$AUDIORESPONSE" ]; then
        echo Creating a folder for audio-responses. This needs to be done once. 
        mkdir /data/audio-responses
fi
if [ -f $CONFIG ]; then
        echo Set port number in Assistant Relay settings
        echo $(cat /data/config.json | jq --arg port "$PORT" '.port = $port') > /data/config.json
else
        echo Creating config file voor Assistant Relay
        
fi
cd /assistant_relay
echo Assistant Relay is starting...
npm run start