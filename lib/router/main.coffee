Router.map ->
  @route "home",
    path: "/"
    layoutTemplate: "homeLayout"
    onBeforeAction: ->
      if not Meteor.user()
        @redirect '/sign-in'
      else
        @redirect '/home'

  @route "dashboard",
    path: "/home"
    waitOn: ->
      [
        subs.subscribe 'checklistByUser', Meteor.userId()
      ]