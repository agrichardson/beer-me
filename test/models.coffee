should = require('chai').should()
app = require('./../server')
db = app.get('db')

Location = db.models.location

describe 'location', ->
	describe 'creation', ->
		
		before (done) ->
			Location.forge({
				title:'bla'
				type:'bla'
				description:'bla'
				lat: 0
				lng: 0
			}).save().then -> 
				done()
		
		it 'should be a valid location', ->
			Location.where({title:'bla'}).fetch().then (loc) ->
				loc.should.have.property('attributes')

		it 'should destroy', ->
			Location.where({title:'bla'}).fetchAll().then (locations) ->
				locations.reset()
				locations.size().should.equal(0)
