Template.dashboard.helpers
	today: ->
		moment().format("MMM Do")

	listForToday: ->
		lists = Checklist.find().fetch()

		_.filter lists, (item) ->
			moment().isSame(item.createdAt, 'day')

	lists: ->
		lists = Checklist.find().fetch() # get lists

		# categorize them into days
		lists = _.groupBy lists, (item) ->
			moment().diff(item.createdAt, 'day')

		# to array
		_.toArray lists

		_.map lists, (item) ->
			date = item[0].createdAt
			return "Today" if moment().isSame(date, 'day')
			return "Yesterday" if moment().diff(date, 'day') == 1
			return "#{moment().diff(date, 'day')} days ago"
Template.dashboard.events
	'click .js-item': (e, t) ->
		if this.done
			Checklist.update this._id, "$set": "done": false
		else 
			Checklist.update this._id, "$set": "done": true