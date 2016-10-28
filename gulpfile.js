var gulp = require('gulp');
var server = require('gulp-express');
var sass = require('gulp-sass');

var basePath='src';

/*sass编译*/
gulp.task('sass', function () {
  return gulp.src(basePath+'/public/scss/*.scss')
    .pipe(sass().on('error', sass.logError))
    .pipe(gulp.dest(basePath+'/public/css'));
});

/*--------监听文件变化 并刷新-------*/
gulp.task('server', function () {
    // Restart the server when file changes
    server.stop()
    server.run(['bin/www']);
    gulp.watch([basePath+'/controller/*.*'], server.notify);
    gulp.watch([basePath+'/pages/**/*.*'], server.notify);
    gulp.watch([basePath+'/views/*.html'], server.notify);
    gulp.watch([basePath+'/public/**/*.*'], server.notify);
    gulp.watch([
    	basePath+'/app.js', 
    	basePath+'/pages/**/*.*',
    	basePath+'/views/*.html',
    	basePath+'/public/**/*.*',
        basePath+'/controller/*.*'
    ], server.run);
    gulp.watch(basePath+'/public/scss/*.scss', ['sass']);
});

gulp.task('default',['server','sass']); //定义默认任务



