'use strict'

angular.module 'ngbp-gulp', [
	'ui.router'
	'ngbp-gulp.home'
]

.controller 'app_controller', app_controller ($scope) ->
	$scope.things_we_love = [
		'coffee'
		'sass'
		'jade'
	]
	return