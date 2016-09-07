var gulp = require('gulp');
var server = require('gulp-express');

var basePath='src'

/*--------监听文件变化 并刷新-------*/
gulp.task('server', function () {
    // Restart the server when file changes
    server.stop()
    server.run(['bin/www']);
    gulp.watch([basePath+'/routes/*.js'], server.notify);
    gulp.watch([basePath+'/views/*.html'], server.notify);
    gulp.watch([basePath+'/public/**/*.*'], server.notify);
    gulp.watch([
    	basePath+'/app.js', 
    	basePath+'/routes/*.js',
    	basePath+'/views/*.html',
    	basePath+'/public/**/*.*'
    ], server.run);
});

gulp.task('default',['server']); //定义默认任务



