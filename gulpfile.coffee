gulp = require 'gulp'
connect = require 'gulp-connect'
jade = require 'gulp-jade'
sass = require 'gulp-sass'
coffee = require 'gulp-coffee'
watch = require 'gulp-watch'
inject = require 'gulp-inject'
plumber = require 'gulp-plumber'
changed = require 'gulp-changed'
clean = require 'gulp-clean'


# Globs
coffee_glob = 'src/**/*.coffee'
jade_glob = 'src/**/*.jade'
html_glob = 'build/**/*.html'
sass_glob = 'src/**/*.scss'
src_glob = 'src/**/*'
build_glob = 'build/**/*'
js_glob = 'build/**/*.js'
css_glob = 'build/**/*.css'
vendor_js_glob = 'build/vendor/**/*.js'
vendor_css_glob = 'build/vendor/**/*.css'
vendor_glob = 'vendor/**/*'


# Paths
index_path = 'build/index.html'
src_dir = 'src/'
build_dir = 'build/'
build_vendor_dir = 'build/vendor/'


gulp.task 'connect', ->
	connect.server
		root : ['build']
		livereload : true
	return


gulp.task 'jade', ->
	gulp.src jade_glob
	.pipe jade({ pretty : true })
	.pipe inject(gulp.src([vendor_js_glob, js_glob, vendor_css_glob, css_glob], { read : false }), { ignorePath : ['build'], addRootSlash : false })
	.pipe gulp.dest(build_dir)
	.pipe connect.reload()


gulp.task 'sass', ->
	gulp.src sass_glob
	.pipe sass({ errLogToConsole : true})
	.pipe gulp.dest(build_dir)
	.pipe connect.reload()


gulp.task 'coffee', ->
	gulp.src coffee_glob
	.pipe coffee({ bare : true })
	.pipe gulp.dest(build_dir)
	.pipe connect.reload()


gulp.task 'vendor', ->
	gulp.src vendor_glob
	.pipe changed(build_dir)
	.pipe gulp.dest build_vendor_dir
	.pipe connect.reload()


gulp.task 'watch', ->
	gulp.watch [jade_glob], ['jade']
	gulp.watch [sass_glob], ['sass']
	gulp.watch [coffee_glob], ['coffee']
	gulp.watch [vendor_glob], ['vendor']

	gulp.watch [sass_glob, coffee_glob], ['jade']


gulp.task 'build', ['vendor', 'sass', 'coffee'], ->
	gulp.start 'jade'


gulp.task 'default', ['build', 'connect', 'watch']

