gulp = require 'gulp'
connect = require 'gulp-connect'
jade = require 'gulp-jade'
sass = require 'gulp-sass'
coffee = require 'gulp-coffee'
watch = require 'gulp-watch'


# Globs
coffee_glob = './src/**/*.coffee'
jade_glob = './src/**/*.jade'
html_glob = './build/**/*.html'
sass_glob = './src/**/*.scss'
build_glob = './build/**/*'
src_glob = './src/**/*'


# Paths
src_dir = './src/'
build_dir = './build/'


gulp.task 'connect', ->
	connect.server
		root : ['build']
		livereload : true


gulp.task 'reload', ->
	gulp.src [build_glob]
	.pipe connect.reload()


gulp.task 'jade', ->
	gulp.src jade_glob
	.pipe jade()
	.pipe connect.reload()
	.pipe gulp.dest(build_dir)


gulp.task 'sass', ->
	gulp.src sass_glob
	.pipe sass()
	.pipe gulp.dest(build_dir)


gulp.task 'coffee', ->
	gulp.src coffee_glob
	.pipe coffee()
	.pipe gulp.dest(build_dir)


gulp.task 'watch', ->
	gulp.watch [jade_glob], ['jade']
	gulp.watch [sass_glob], ['sass']
	gulp.watch [coffee_glob], ['coffee']
	gulp.watch [build_glob], ['reload']


gulp.task 'default', ['connect', 'watch']
