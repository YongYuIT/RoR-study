App.hello_link = App.cable.subscriptions.create "HelloLinkChannel",
  connected: ->
    # Called when the subscription is ready for use on the server
    alert 'connect ready'

  disconnected: ->
    # Called when the subscription has been terminated by the server
    alert 'connect lost'

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    alert 'client receive message from server' + data["to_client_message"]

  say_hello:(hello_mesage_from_client) ->
    @perform 'say_hello', hello_msg_to_server:hello_mesage_from_client
