require! \browserify
require! \gulp
require! \gulp-streamify
require! \gulp-uglify
source = require \vinyl-source-stream

gulp.task \dist, ->
    browserify standalone: \jsonparse, debug: false
        .add <[./jsonparse.js]>
        .exclude \buffer-browserify
        .bundle!
        .pipe source \index.min.js
        .pipe (gulp-streamify gulp-uglify!)
        .pipe gulp.dest \./dist