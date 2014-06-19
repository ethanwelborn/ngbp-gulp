gulp = require 'gulp'
gutil = require 'gulp-util'
connect = require 'gulp-connect'
jade = require 'gulp-jade'
sass = require 'gulp-sass'
coffee = require 'gulp-coffee'
inject = require 'gulp-inject'
clean = require 'gulp-clean'
karma = require 'gulp-karma'
changed = require 'gulp-changed'
globs = require './globs'


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
	gulp.src globs.jade
	.pipe jade({ pretty : true })
	.on('error', gutil.log)
	.pipe inject(gulp.src(globs.app, { read : false }), { ignorePath : ['build'], addRootSlash : false })
	.on('error', gutil.log)
	.pipe gulp.dest(build_dir)
	.pipe changed(build_dir, { extension : '.html'})
	.pipe connect.reload()


gulp.task 'sass', ->
	gulp.src globs.app_sass
	.pipe sass({ errLogToConsole : true, sourceComments : 'map', sourceMap : 'sass'})
	.on('error', gutil.log)
	.pipe gulp.dest(build_dir)
	.pipe changed(build_dir, { extension : '.css'})
	.pipe connect.reload()


gulp.task 'coffee', ->
	gulp.src globs.coffee
	.pipe coffee({ bare : true })
	.on('error', gutil.log)
	.pipe gulp.dest(build_dir)
	.pipe changed(build_dir, { extension : '.js'})
	.pipe connect.reload()


gulp.task 'vendor', ->
	gulp.src globs.vendor
	.pipe gulp.dest(build_vendor_dir)
	.pipe connect.reload()


gulp.task 'karma', ->
	gulp.src globs.karma
	.pipe karma
		configFile : 'karma.conf.js'
		action : 'watch'
	.on 'error', (err) ->
		throw err
		return


gulp.task 'watch', ->
	gulp.watch [globs.jade], ['jade']
	gulp.watch [globs.sass], ['sass']
	gulp.watch [globs.coffee], ['coffee']
	gulp.watch [globs.vendor], ['vendor']
	gulp.watch [globs.karma], ['karma']
	return


gulp.task 'build', ['vendor', 'sass', 'coffee'], ->
	gulp.start 'jade'


gulp.task 'default', ['build', 'connect', 'watch']

