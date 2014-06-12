gulp = require 'gulp'
connect = require 'gulp-connect'
jade = require 'gulp-jade'


gulp.task 'connect', ->
	connect.server
		root : 'src'
		livereload : true


gulp.task 'html', ->
	gulp.src './src/**/*.html'
	.pipe connect.reload()


gulp.task 'jade', ->
	gulp.src './src/**/*.jade'
	.pipe jade()
	.pipe gulp.dest('./src')


gulp.task 'watch', ->
	gulp.watch ['./src/**/*.html'], ['html']


gulp.task 'default', ['connect', 'watch']