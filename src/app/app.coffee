'use strict'

angular.module 'ngbp-gulp', [
	'ui.router'
	'ngbp-gulp.home'
]

.config ($stateProvider, $urlRouterProvider) ->
	$urlRouterProvider.otherwise '/home'

	$stateProvider
	.state 'home',
		url : '/home'
		templateUrl : 'home/index.html'
	return

.controller 'app_controller', ($scope) ->
	return
