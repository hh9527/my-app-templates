index = (req, res) ->
	users =
		id: 1, name: 'Name1'
		id: 2, name: 'Name2'
	res.render 'users',
		users: users

get = (req, res) ->
	do (id = req.pararms.id) ->
		user =
			id: id
			name: 'Name' + id
		res.render 'user',
			user: user

exports.init = (app) ->
	app.route '/users'
		.get index
	app.route '/users/:id'
		.get get
