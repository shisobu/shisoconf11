Pusher.log = (message) ->
  window.console.log(message)

pusher = new Pusher(pusherkey);
channel = pusher.subscribe('twitter');
channel.bind('new-post', (data) ->
  $('.no-tweet').remove()
  $stream = $('<div>').addClass('stream')
  $left = $('<div>').addClass('left')
  .append(
    $('<a>')
    .attr(
      href: "http://twitter.com/#!/#{data.user.screen_name}"
      target: '_blank'
    )
    .append(
      $('<img>')
      .attr(
        src: data.user.profile_image_url
        alt: ''
        title: ''
      )
    )
  )
  $right = $('<div>').addClass('right')
  .append(
    $('<div>').addClass('name')
    .append(
      $('<a>').addClass('screen_name')
      .attr(
        href: "http://twitter.com/#!/#{data.user.screen_name}"
        target: '_blank'
      )
      .text(data.user.screen_name)
    )
    .append(
      $('<span>').addClass('name')
      .text(data.user.name)
    )
  )
  .append(
    $('<div>').addClass('body')
    .text(data.text)
  )
  .append(
    $('<div>').addClass('time')
    .append(
      $('<a>')
      .attr(
        href: "http://twitter.com/#!/#{data.user.screen_name}/status/#{data.id_str}"
        target: '_blank'
      )
      .text(data.created_at)
    )
  )
  $stream
  .append($left)
  .append($right)
  .prependTo('#tweets')
)
