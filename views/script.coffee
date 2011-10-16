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
      href: 'http://twitter.com/#!/marutanm'
      target: '_blank'
    )
    .append(
      $('<img>')
      .attr(
        src: 'http://a0.twimg.com/profile_images/1578464491/mee_uzumaki_normal.gif'
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
        href: ''
        target: '_blank'
      )
      .text('screen_name_here')
    )
    .append(
      $('<span>').addClass('name')
      .text('full_name')
    )
  )
  .append(
    $('<div>').addClass('body')
    .text('hogehoge')
  )
  .append(
    $('<div>').addClass('time')
    .append(
      $('<a>')
      .attr(
        href: 'http://twitter.com/#!/synboo/status/125260583196037122'
        target: '_blank'
      )
      .text('2011-10-23 10:00:00')
    )
  )
  $stream
  .append($left)
  .append($right)
  .prependTo('#tweets')
  return nil
)
