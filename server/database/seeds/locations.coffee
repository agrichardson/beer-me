###
    t.string("title").notNull()
    t.string("type").notNull()
    t.text("description")
    t.float("lat").notNull()
    t.float("lng").notNull()
###

exports.seed = (knex, Promise) ->
    ( 
        #These variables are used to generate random locations within the general area of NY
        lat_rand = (Math.random() - .5)*.1
      	lon_rand = (Math.random() - .5)*.1
        knex('locations').insert(
      	{
      		title: 'test point ' + num
      		type: 'store'
      		description: 'An example point used for testing purposes'
      		lat:40.75 + lat_rand
      		lng: -73.95 + lng_rand
      		created_at: knex.raw('now()')
      		updated_at: knex.raw('now()')
      	}
      )
     for num in [1..1000]
    )
