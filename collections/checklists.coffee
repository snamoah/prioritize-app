@Checklist = new Meteor.Collection 'checklists'

Schemas.checklists = new SimpleSchema
	item:
		type: String

	createdAt:
		type: Date
		autoValue: ->
			if @isInsert
				new Date()
		autoform:
			omit: true

	owner:
		type: String
		regEx: SimpleSchema.RegEx.Id
		autoValue: ->
			if @isInsert
				Meteor.userId()
		autoform:
			omit: true
	done:
		type: Boolean
		autoValue: ->
			if @isInsert
				false
		autoform:
			omit: true

Checklist.attachSchema Schemas.checklists
