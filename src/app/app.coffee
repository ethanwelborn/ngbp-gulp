'use strict'

angular.module 'ngbp-gulp', [
	'ui.router'
	'ngbp-gulp.home'
]

.config ($stateProvider, $urlRouterProvider) ->
	$urlRouterProvider.otherwise '/'

	$stateProvider
	.state 'home',
		url : '/home'
		templateUrl : 'app/home/index.html'
	return

.run ['$state', ($state) ->
	return
]

.controller 'app_controller', ($scope) ->
	return
