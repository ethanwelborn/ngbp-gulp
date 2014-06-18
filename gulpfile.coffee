gulp = require 'gulp'
connect = require 'gulp-connect'
jade = require 'gulp-jade'
sass = require 'gulp-sass'
coffee = require 'gulp-coffee'
inject = require 'gulp-inject'
clean = require 'gulp-clean'
karma = require 'gulp-karma'
changed = require 'gulp-changed'


# Globs
coffee_glob = 'src/**/*.coffee'
jade_glob = 'src/**/*.jade'
sass_glob = 'src/**/*.scss'
src_glob = 'src/**/*'
build_glob = 'build/**/*'
html_glob = 'build/**/*.html'
application_js_glob = 'build/app/**/*.js'
application_css_glob = 'build/app/**/*.css'
js_glob = 'build/**/*.js'
css_glob = 'build/**/*.css'
vendor_js_glob = 'build/vendor/**/*.js'
vendor_css_glob = 'build/vendor/**/*.css'
vendor_glob = 'vendor/**/*'
karma_glob = [
	'vendor/angular/angular.js'
	'vendor/angular-mocks/angular-mocks.js'
	'vendor/angular-ui-router/release/angular-ui-router.js'
	application_js_glob
]
build_glob = [
	'vendor/angular/angular.js'
	'vendor/angular-ui-router/release/angular-ui-router.js'
	application_js_glob
	vendor_css_glob
	css_glob
	'!**/*_spec.js'
]

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
	.pipe changed(build_dir, { extension : '.html'})
	.pipe jade({ pretty : true })
	.pipe inject(gulp.src([build_glob], { read : false }), { ignorePath : ['build'], addRootSlash : false })
	.pipe gulp.dest(build_dir)
	.pipe connect.reload()


gulp.task 'sass', ->
	gulp.src sass_glob
	.pipe changed(build_dir, { extension : '.css'})
	.pipe sass({ errLogToConsole : true})
	.pipe gulp.dest(build_dir)
	.pipe connect.reload()


gulp.task 'coffee', ->
	gulp.src coffee_glob
	.pipe changed(build_dir, { extension : '.js'})
	.pipe coffee({ bare : true })
	.pipe gulp.dest(build_dir)
	.pipe connect.reload()


gulp.task 'vendor', ->
	gulp.src vendor_glob
	.pipe gulp.dest(build_vendor_dir)
	.pipe connect.reload()


gulp.task 'karma', ->
	gulp.src karma_glob
	.pipe karma
		configFile : 'karma.conf.js'
		action : 'watch'
	.on 'error', (err) ->
		throw err
		return


gulp.task 'watch', ->
	gulp.watch [jade_glob], ['jade']
	gulp.watch [sass_glob], ['sass']
	gulp.watch [coffee_glob], ['coffee']
	gulp.watch [vendor_glob], ['vendor']
	gulp.watch [karma_glob], ['karma']
	gulp.watch [sass_glob, coffee_glob], ['jade']
	return


gulp.task 'build', ['vendor', 'sass', 'coffee'], ->
	gulp.start 'jade'


gulp.task 'default', ['build', 'connect', 'watch']

