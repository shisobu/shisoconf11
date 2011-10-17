Pusher.log = (message) ->
  window.console.log(message)

# tipsy
$ ->
  $('.members img').tipsy(gravity: 's')
  $('#logo a').tipsy(gravity: 'e')
  $('h2').click ->
    target = $(@).offset().top
    $('html, body').animate(scrollTop: target, 100)

# pusher
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
    $('<div>').addClass('body').attr('id', 'tweetText')
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
      .text(Date(data.created_at))
    )
  )
  $stream
  .append($left)
  .append($right)
  .prependTo('#tweets')

  twttr.anywhere (twitter) ->
    twitter.linkifyUsers()
    twitter("#tweetText").linkifyUsers()

)
