App.special_link = App.cable.subscriptions.create "SpecialLinkChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    alert 'client receive message from server' + data["to_client_message"]

  s_say_hello: (hello_mesage_from_client) ->
    @perform 's_say_hello', hello_msg_to_server:hello_mesage_from_client
