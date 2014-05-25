index = (req, res) ->
	res.render 'app/index',
		title: 'Coffee'

exports.init = (app) ->
	app.route '/'
		.get index
	app.route '/-/home'
		.get (req, res) ->
			res.render 'app/partial/home'
