# Pusher.log = (message) ->
#   window.console.log(message)

# check tweets from atendee or not
$growl = (username) ->
  shisobu = ['Ajido', 'kei_q', 'kurone_c', 'marutanm', 'matsumoo', 'nokuno', 'qluto', 'seiryo', 'summerwind', 'superbrothers', 'synboo', 'TakuyaOkamoto', 'toilet_lunch', 'YamaGutsu', 'youzaka']
  guests = ['sonatax', 't_fridge', 'makimoto', 'mirakui', 'tohae', 'okadapan', 'mkataigi', 'Yeshi', 'moro_tyo']
  atendee = shisobu.concat guests
  if ($.inArray(username, atendee) > 0)
    return $.atendee
  else
    return $.gritter

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
  $growl(data.user.screen_name).add
    title: data.user.name
    text: data.text
    image: data.user.profile_image_url
    after_close: ->
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
        .text(data.text).autolink()
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
      $('.no-tweet').remove()
      $stream
      .append($left)
      .append($right)
      .appendTo('#tweets')

  twttr.anywhere (twitter) ->
    twitter.linkifyUsers()
    twitter("#tweetText").linkifyUsers()

)
