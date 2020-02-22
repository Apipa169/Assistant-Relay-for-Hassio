CONFIG_PATH=/data/options.json
PORT=$(jq --raw-output ".port | length" $CONFIG_PATH)
AUDIORESPONSE="/data/audio-responses"
CONFIG="/data/config.json"


if [ ! -d "$AUDIORESPONSE" ]; then
        echo Creating an audio-responses folder... This needs to be done once. 
        mkdir /data/audio-responses
fi

if [ -f $CONFIG ]; then
        echo "File $CONFIG exists."
else
        echo Creating configfile.... 
        jq -n --arg port "$PORT" '{port:${appname}}` > /data/config.json   
fi


cd /assistant_relay
echo Assistant Relay is now starting...

npm run start