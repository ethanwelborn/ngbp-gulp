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

.directive 'dFullscreenTextarea', ($window) ->
	return {
		restrict : 'A'
		link : (scope, element, attrs) ->
			console.log $window.innerHeight
			element.css 'height', "#{$window.innerHeight}px"
			return
	}