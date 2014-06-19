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
		templateUrl : 'app/home/index.html'
	return

.run ['$state', ($state) ->
	$state.transitionTo 'home'
	return
]

.controller 'app_controller', ($scope) ->
	return
