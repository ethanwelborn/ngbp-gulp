gulp = require 'gulp'
connect = require 'gulp-connect'
jade = require 'gulp-jade'
sass = require 'gulp-sass'
coffee = require 'gulp-coffee'
watch = require 'gulp-watch'
inject = require 'gulp-inject'


# Globs
coffee_glob = 'src/**/*.coffee'
jade_glob = 'src/**/*.jade'
html_glob = 'build/**/*.html'
sass_glob = 'src/**/*.scss'
src_glob = 'src/**/*'
build_glob = 'build/**/*'
js_glob = 'build/**/*.js'
css_glob = 'build/**/*.css'
vendor_js_glob = 'vendor/**/*.js'
vendor_css_glob = 'vendor/**/*.css'


# Paths
index_path = 'build/index.html'
src_dir = 'src/'
build_dir = 'build/'


gulp.task 'connect', ->
	connect.server
		root : ['build']
		livereload : true
	return


gulp.task 'reload', ['sass', 'coffee', 'jade'], ->
	gulp.src [build_glob]
	.pipe connect.reload()


gulp.task 'jade', ->
	gulp.src jade_glob
	.pipe jade()
	.pipe inject(gulp.src([js_glob, vendor_js_glob, css_glob, vendor_css_glob], { read : false }), { ignorePath : 'build', addRootSlash : false })
	.pipe gulp.dest(build_dir)


gulp.task 'sass', ->
	gulp.src sass_glob
	.pipe sass({ errLogToConsole : true})
	.pipe gulp.dest(build_dir)


gulp.task 'coffee', ->
	gulp.src coffee_glob
	.pipe coffee({ bare : true })
	.pipe gulp.dest(build_dir)


gulp.task 'watch', ->
	watch { glob : [src_glob] }, ->
		gulp.start 'reload'
	return


gulp.task 'default', ['connect', 'watch']
