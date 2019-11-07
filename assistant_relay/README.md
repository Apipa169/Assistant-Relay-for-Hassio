# Assistant Relay for Hassio
This add-on brings Assistant Relay (by greghesp) to Hass.io.

> Assistant Relay is a Node.js server that exposes the Google Assistant as a REST API.

> Send Assistant Relay any query you would send the Google Assistant SDK, and get a response back.

> It also supports the Google Home Broadcast command so you can send audio notifications to your Google Home devices, without interrupting music.


### Usage

1. Add https://github.com/Apipa169/Assistant-Relay-for-Hassio in the add-on store.
2. Install the add-on
3. Start the add-on and open the add-on in your browser: http://[IP]:[PORT]
4. Follow the instructions in the browser.
5. You can now use Assistant Relay.


#### Example
Example command to broadcast.
```yaml
# Example configuration.yaml entry
rest_command:
  my_broadcast:
    url: http://<ip_address>:<port>/assistant
    method: POST
    headers:
      content-type: 'application/json; charset=utf-8'
    payload: '{"command":"hello world", "user":"greg", "broadcast":"true"}'
```

*User needs to be the user you used in the setup.*

How to use Home Assistant's RESTful command check: https://www.home-assistant.io/integrations/rest_command/


### More info
Check the repository of Assistant Relay for more: https://github.com/greghesp/assistant-relay