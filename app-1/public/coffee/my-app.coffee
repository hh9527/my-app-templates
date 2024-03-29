app = angular.module 'MyApp', [
	'ngRoute'
	'ngTouch'
	'mobile-angular-ui'
]

app.config ['$routeProvider', '$locationProvider', (r, l) ->
	r.when '/', templateUrl: './-/home'
	null
]

app.controller 'MainCtrl', ['$rootScope', '$scope', (r, s) ->
	r.$on '$routeChangeStart', ->
		r.loading = true
	r.$on '$routeChangeSuccess', ->
		r.loading = false
	s.users = [
		{name: "Carlos  Flowers", online: true}
		{name: "Byron Taylor", online: true}
		{name: "Jana Terry", online: true}
		{name: "Darryl Stone", online: true}
		{name: "Fannie Carlson", online: true}
		{name: "Holly Nguyen", online: true}
		{name: "Bill Chavez", online: true}
		{name: "Veronica Maxwell", online: true}
		{name: "Jessica Webster", online: true}
		{name: "Jackie Barton", online: true}
		{name: "Crystal Drake", online: false}
		{name: "Milton Dean", online: false}
		{name: "Joann Johnston", online: false}
		{name: "Cora Vaughn", online: false}
		{name: "Nina Briggs", online: false}
		{name: "Casey Turner", online: false}
		{name: "Jimmie Wilson", online: false}
		{name: "Nathaniel Steele", online: false}
		{name: "Aubrey Cole", online: false}
		{name: "Donnie Summers", online: false}
		{name: "Kate  Myers", online: false}
		{name: "Priscilla Hawkins", online: false}
		{name: "Joe Barker", online: false}
		{name: "Lee Norman", online: false}
		{name: "Ebony Rice", online: false}
	]
	null
]

onDeviceReady = ->
	alert 'device:' + navigator.device

document.addEventListener "deviceready", onDeviceReady, false

