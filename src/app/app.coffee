'use strict'

angular.module 'ngbp-gulp', [
	'ui.router'
	'ngbp-gulp.home'
]

.config ($stateProvider, $urlRouterProvider) ->
	$urlRouterProvider.otherwise '/home'
	return

.controller 'app_controller', ($scope) ->
	$scope.things_we_love = [
		'coffee'
		'sass'
		'jade'
	]
	return