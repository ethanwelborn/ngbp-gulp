globs = {}

globs.coffee = 'src/**/*.coffee'
globs.jade = 'src/**/*.jade'
globs.sass = 'src/**/*.scss'
globs.src = 'src/**/*'
globs.build = 'build/**/*'
globs.html = 'build/**/*.html'
globs.app_js = 'build/app/**/*.js'
globs.app_sass = 'src/style/app.scss'
globs.app_css = 'build/style/app.css'
globs.vendor_js = 'build/vendor/**/*.js'
globs.vendor_css = 'build/vendor/**/*.css'
globs.vendor = 'vendor/**/*'
globs.karma = [
  'build/vendor/angular/angular.js'
  'build/vendor/angular-mocks/angular-mocks.js'
  'vendor/angular-ui-router/release/angular-ui-router.js'
  globs.app_js
]
globs.app = [
  'vendor/angular/angular.js'
  'vendor/angular-ui-router/release/angular-ui-router.js'
  globs.app_js
  "!build/app/**/*_spec.js"
  globs.app_css
]

module.exports = globs
