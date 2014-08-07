'use strict'

angular.module 'ngbp-gulp', [
	'ui.router'
	'ngbp-gulp.home'
]

.config ($stateProvider, $urlRouterProvider) ->
	$urlRouterProvider.otherwise '/workspace'

	$stateProvider
	.state 'home',
		url : '/home'
		templateUrl : 'app/home/index.html'

	.state 'workspace',
		url : '/workspace'
		templateUrl : 'app/workspace/index.html'
	return

.run ['$state', ($state) ->
	return
]

.controller 'app_controller', ($scope) ->
	return
