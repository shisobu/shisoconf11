Pusher.log = (message) ->
  window.console.log(message)

pusher = new Pusher(pusherkey);
channel = pusher.subscribe('twitter');
channel.bind('new-post', (data) ->
  $('<p/>')
    .text(data.text)
    .prependTo('#content')
)
