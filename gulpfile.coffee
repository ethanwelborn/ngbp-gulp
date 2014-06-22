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
watch = require 'gulp-watch'
plumber = require 'gulp-plumber'
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


gulp.task 'move:jade', ->
	gulp.src globs.jade
	.pipe jade({ pretty : true })
	.pipe plumber()
	.pipe inject(gulp.src(globs.app, { read : false }), { ignorePath : ['build'], addRootSlash : false })
	.pipe gulp.dest(build_dir)


gulp.task 'move:sass', ->
	gulp.src globs.sass
	.pipe plumber()
	.pipe sass({ errLogToConsole : true, sourceComments : 'map', sourceMap : 'sass'})
	.pipe gulp.dest(build_dir)


gulp.task 'move:coffee', ->
	gulp.src globs.coffee
	.pipe plumber()
	.pipe coffee({ bare : true })
	.pipe gulp.dest(build_dir)


gulp.task 'move:vendor', ->
	gulp.src globs.vendor
	.pipe plumber()
	.pipe gulp.dest(build_vendor_dir)


gulp.task 'watch', ->

	watch {glob : globs.jade}, (files) ->
		return files.pipe plumber()
			.pipe jade({pretty : true })
			.pipe inject(gulp.src(globs.app, { read : false }), { ignorePath : ['build'], addRootSlash : false })
			.pipe gulp.dest(build_dir)
			.pipe connect.reload()


	watch {glob : globs.sass}, (files) ->
		return files.pipe plumber()
			.pipe sass({ errLogToConsole : true, sourceComments : 'map', sourceMap : 'sass'})
			.pipe gulp.dest(build_dir)
			.pipe connect.reload()


	watch {glob : globs.coffee}, (files) ->
		return files.pipe plumber()
			.pipe coffee({ bare : true })
			.pipe gulp.dest(build_dir)
			.pipe connect.reload()


	watch {glob : globs.vendor}, (files) ->
		return files.pipe plumber()
			.pipe gulp.dest(build_vendor_dir)
			.pipe connect.reload()


	watch {glob : globs.karma}, (files) ->
		return files.pipe plumber()
			.pipe karma
				configFile : 'karma.conf.js'
				action : 'watch'
			.on 'error', (err) ->
				throw err
				return


gulp.task 'move:files', ['move:vendor', 'move:sass', 'move:coffee'], ->
	gulp.start 'move:jade'


gulp.task 'default', ['move:files', 'connect', 'watch']

