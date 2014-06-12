gulp = require 'gulp'
connect = require 'gulp-connect'

gulp.task 'connect', ->
	connect.server
		root : 'src'
		livereload : true

gulp.task 'html', ->
	gulp.src './src/**/*.html'
	.pipe connect.reload()

gulp.task 'watch', ->
	gulp.watch ['./src/**/*.html'], ['html']


gulp.task 'default', ['connect', 'watch']