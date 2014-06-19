angular.module 'ngbp-gulp.workspace', []

.controller 'workspace_controller', ['$rootScope', '$scope', ($rootScope, $scope) ->
	$scope.great_things = [
		'gulp'
		'angular'
		'karma'
		'coffee'
		'sass'
		'jade'
	]
]

.directive, 'd-fullscreen-textarea', ->
	return