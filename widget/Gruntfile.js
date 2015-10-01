module.exports = function(grunt) {

  require('load-grunt-tasks')(grunt); // npm install --save-dev load-grunt-tasks

  

  // Project configuration.
  grunt.initConfig({ 

    concurrent: {
        target1: ['uglify'],
        target2: ['cssmin']
    },
    pkg: grunt.file.readJSON('package.json'),
    uglify: {
      options: {
        banner: '/*! <%= pkg.name %> <%= grunt.template.today("yyyy-mm-dd") %> */\n'
      },
      build: {
        src: 'nat_widget.js',
        dest: 'build/nat_widget.js'
      }
    },
    cssmin: {
      css: {
        src: 'style.css',
        dest:'build/style.css'
      },
      options: {
        banner: '/*! <%= pkg.name %> <%= grunt.template.today("yyyy-mm-dd") %> */\n'
      },
    },
    copy: {
      main: {
        files: 
        [
          {expand: true, src: ['*.otf'], dest: 'build/', filter: 'isFile'},
          {expand: true, src: ['data.php'], dest: 'build/', filter: 'isFile'}
        ]        
      },
    }

  });

grunt.loadNpmTasks('grunt-contrib-copy');
grunt.loadNpmTasks('grunt-contrib-uglify');
grunt.loadNpmTasks('grunt-contrib-cssmin');

grunt.registerTask('default', ['uglify','cssmin','copy']);

  // Default task(s).
//grunt.registerTask('default', ['concurrent:target1','concurrent:target2']);

};