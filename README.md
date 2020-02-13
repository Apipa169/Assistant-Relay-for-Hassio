![Supports amd64 Architecture][amd64-shield]
![Supports armv7 Architecture][armv7-shield]
![Supports aarch64 Architecture][aarch64-shield]
![Supports armhf Architecture][armhf-shield]
![Supports i386 Architecture][i386-shield]
![Maintained][maintained-shield]

[![Buy me a coffee][buymeacoffee-shield]][buymeacoffee]

# Assistant Relay for Hassio
This add-on brings Assistant Relay to Hass.io.

Assistant Relay is a Node.js server that exposes the Google Assistant as a REST API. Send Assistant Relay any query you would send the Google Assistant, and get a response back.

It also supports the Google Home Broadcast command so you can send audio notifications to your Google Home devices, without interrupting music.


## Getting started

To use this add-on you need to have Hass.io running. If you are not using Hass.io you should use the [docker image](https://github.com/Apipa169/Assistant-Relay-Docker) or [install Assistant Rely directly](https://greghesp.github.io/assistant-relay/docs/getting-started/installation) on your system.

### Installation

1. Go to Supervisor in the sidebar and click on Add-on Store
2. Add https://github.com/Apipa169/Assistant-Relay-for-Hassio under "repositories"
2. The add-on Assistant Relay should now show up below. Clcik on it and click on "Install". This may take a while, depending on your internet and system speed.

### Configuration

1. You do not need to configure anything at the add-on page. Click "Start" to run the add-on
2. Check the log below to see if it's running.
3. Click on "Open web UI" or go to http://[IP]:[PORT] in your browser.
4. Follow the instructions in the browser.
5. You can now use Assistant Relay.

*The IP must be the IP address of your system, not the one mentioned in the log as this is the address of the container. The port is 3000 by default*

##### Changing the port number
If you want to change the port of Assistant Relay, please do this in the add-on settings and leave the Assistant Relay setting on port 3000. 


## Examples
User needs always to be the user you used in the setup of AR. Multiple users is suported by AR.

#### Home Assistant REST
Example command to broadcast via a rest command.
```yaml
# Example configuration.yaml
rest_command:
  assistant_broadcast:
    url: http://192.168.10.2:3000/assistant
    method: POST
    content_type: 'application/json'
    payload: '{"command":"{{ command }}", "user":"username", "broadcast":true}'
    
  assistant_converse:
    url: http://192.168.10.2:3000/assistant
    method: POST
    content_type: 'application/json'
    payload: '{"command":"{{ command }}", "user":"username", "converse":true}'

  assistant_relay:
    url: http://192.168.10.2:3000/assistant
    method: POST
    content_type: 'application/json'
    payload: '{"command":"{{ command }}", "user":"username"}'
```
```yaml
# Example test lovelace card
type: entities
entities:
  - action_name: Broadcast
    name: test broadcast
    service: rest_command.assistant_broadcast
    type: call-service
    service_data:
      command: hello, this is a test broadcast
```
```yaml
# Automation action example (just fill in "command: hello" if you are using the editor)
  action:
  - data:
      command: hello
    service: rest_command.assistant_broadcast
```

#### Node Red Example
Simple flow for Node Red. Don't forget to change the IP address, port and user!
```json
[{"id":"cb8e2985.0fd68","type":"comment","z":"e0fa9d52.876058","name":"Broadcast via Google Home","info":"","x":180,"y":180,"wires":[]},{"id":"37f701c2.826d96","type":"delay","z":"e0fa9d52.876058","name":"","pauseType":"rate","timeout":"5","timeoutUnits":"seconds","rate":"1","nbRateUnits":"10","rateUnits":"second","randomFirst":"1","randomLast":"5","randomUnits":"seconds","drop":true,"x":320,"y":220,"wires":[["d087aae2.ab98e"]]},{"id":"eba065b9.0d066","type":"http request","z":"e0fa9d52.876058","name":"post","method":"POST","ret":"obj","paytoqs":false,"url":"http://192.168.1.2:3000/assistant","tls":"","persist":false,"proxy":"","authType":"","x":730,"y":220,"wires":[[]]},{"id":"d087aae2.ab98e","type":"function","z":"e0fa9d52.876058","name":"set payload and headers","func":"msg.message = msg.payload;\nmsg.payload = {\n    \"name\": \"username\",\n    \"command\": msg.message,\n    \"broadcast\": true\n};\nmsg.headers = {};\nmsg.headers['Content-Type'] = 'application/json';\nreturn msg;","outputs":1,"noerr":0,"x":530,"y":220,"wires":[["eba065b9.0d066"]]},{"id":"e63ec3ee.7abb68","type":"inject","z":"e0fa9d52.876058","name":"","topic":"","payload":"Hello everyone!","payloadType":"str","repeat":"","crontab":"","once":false,"onceDelay":0.1,"x":140,"y":220,"wires":[["37f701c2.826d96"]]}]
```

## Assistant Relay in Docker without Hass.io
If you are not running Hass.io you can run Assistant Relay in docker using this image: https://github.com/Apipa169/Assistant-Relay-Docker

## More documentation
More documentation is available at https://greghesp.github.io/assistant-relay/ 


## Credit
This add-on is using (the awesome) [Assistant Relay](https://github.com/greghesp/assistant-relay) made by Greghesp. 


[buymeacoffee-shield]: https://www.buymeacoffee.com/assets/img/guidelines/download-assets-sm-2.svg
[buymeacoffee]: https://www.buymeacoffee.com/apipa
[aarch64-shield]: https://img.shields.io/badge/aarch64-no-red.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[armhf-shield]: https://img.shields.io/badge/armhf-no-red.svg
[armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg
[i386-shield]: https://img.shields.io/badge/i386-no-red.svg
[maintained-shield]: https://img.shields.io/badge/maintained-yes-green.svg
