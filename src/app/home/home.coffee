angular.module 'ngbp-gulp.home', []

.controller 'home_controller', ['$rootScope', '$scope', ($rootScope, $scope) ->
	$scope.great_things = [
		'gulp'
		'angular'
		'karma'
	]
]