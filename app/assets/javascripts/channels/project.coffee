App.project = App.cable.subscriptions.create "ProjectChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    $('.projects_list').prepend(data['content'])
    identifier = 'li.project-'+data['slug']
    $(identifier).fadeOut 300, ->
      $(identifier).fadeIn 300
      return
