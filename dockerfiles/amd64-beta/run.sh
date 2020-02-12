ARDIR="/data/audio-responses"
if [ ! -d "$ARDIR" ]; then
        echo Creating an audio-responses folder... This needs to be done once. 
        mkdir /data/audio-responses
fi
cd /assistant_relay

echo Assistant Relay is now starting...

npm run start