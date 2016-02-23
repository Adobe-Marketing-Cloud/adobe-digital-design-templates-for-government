var gulp = require('gulp');
var coffee = require('gulp-coffee');
var rename = require('gulp-rename');

cfg = {
  coffee: {
    src: 'src/main/content/jcr_root/**/*.coffee'
  }
};

compileCoffee = function(coffeeStream , compiler) {
  return coffeeStream.pipe(compiler({
    bare: true
  })).pipe(rename({
    extname: '.js'
  })).pipe(gulp.dest('target/classes/jcr_root'));
};

gulp.task("coffee", function(){
  return compileCoffee(gulp.src(cfg.coffee.src), coffee);
});

gulp.task("default", function() {
  return gulp.start('coffee');
});
