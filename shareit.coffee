@ShareIt = {
  settings: {
    buttons: 'large',
    useFB: true,
    useTwitter: true,
    useGoogle: true
  }
  configure: (hash) ->
    @settings = $.extend(@settings, hash)
  useLargeButtons: () ->
    ShareIt.settings.buttons == 'large' or
    ShareIt.settings.buttons == 'responsive'
  useSmallButtons: () ->
    ShareIt.settings.buttons == 'small' or
    ShareIt.settings.buttons == 'responsive'
  useResponsive: () ->
    ShareIt.settings.buttons == 'responsive'
}

Meteor.startup ->

  # Twitter
  window.twttr = do (d = document, s = 'script', id = 'twitter-wjs') ->
    t = undefined
    js = undefined
    fjs = d.getElementsByTagName(s)[0]
    return  if d.getElementById(id)
    js = d.createElement(s)
    js.id = id
    js.src = "https://platform.twitter.com/widgets.js"
    fjs.parentNode.insertBefore js, fjs
    window.twttr or (t =
      _e: []
      ready: (f) ->
        t._e.push f
    )

  # Facebook
  js = undefined
  id = "facebook-jssdk"
  ref = document.getElementsByTagName("script")[0]
  return  if document.getElementById(id)
  js = document.createElement("script")
  js.id = id
  js.async = true
  js.src = "//connect.facebook.net/en_US/all.js"
  ref.parentNode.insertBefore js, ref
