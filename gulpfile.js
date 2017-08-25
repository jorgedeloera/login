const gulp = require('gulp')
const browserSync = require('browser-sync').create()
const webpack = require('webpack')
const gulpWebpack = require('webpack-stream')
const webpackConfig = require('./webpack.config.js')
const baseDir = './'

gulp.task('server', ['webpack'], function(){
    browserSync.init({
        server: baseDir,
        notify: false
    })

    gulp.watch(webpackConfig.entry, ['webpack'])
})

gulp.task('webpack', function(){
    gulp.src(webpackConfig.entry)
    .pipe(gulpWebpack(webpackConfig, webpack))
    .pipe(gulp.dest(webpackConfig.output.path))
    .pipe(browserSync.stream())
})

gulp.task('copy.app', function(){
    gulp.src(`${baseDir}/app.coffee`)
    .pipe(gulp.dest(`${baseDir}/project.framer`))
})

gulp.task('copy.img', function(){
    gulp.src(`${baseDir}images/**`)
    .pipe(gulp.dest(`${baseDir}/project.framer/images`))
})

gulp.task('copy.modules', function(){
    gulp.src(`${baseDir}modules/**`)
    .pipe(gulp.dest(`${baseDir}/project.framer/modules`))
})

gulp.task('export', ['copy.app', 'copy.img', 'copy.modules'])

gulp.task('default', ['server'])