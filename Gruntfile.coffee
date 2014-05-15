module.exports = (grunt)->
  grunt.initConfig
    pkg : grunt.file.readJSON('package.json')

    concat:
      options:
        separator: '\n\n'
        stripBanners: true
        banner: '# <%= pkg.name %> - v<%= pkg.version %> - ' + '<%= grunt.template.today("yyyy-mm-dd") %>\n\n'
      dist:
        src: ['src/main.coffee', 'src/directives/*.coffee','src/services/*.coffee']
        dest: 'build/<%= pkg.name %>.coffee'

    uglify:
      options:
        banner: '/*! <%= pkg.name %> - v<%= pkg.version %> - ' + '<%= grunt.template.today("yyyy-mm-dd") %> */\n\n'
      build:
        src: 'build/<%= pkg.name %>.js'
        dest: 'build/<%= pkg.name %>.min.js'

    coffee:
      compileJoined:
        options:
          join: true
        files:
          'build/<%= pkg.name %>.js': ['src/main.coffee', 'src/directives/*.coffee','src/services/*.coffee']

  grunt.loadNpmTasks('grunt-contrib-uglify');
  grunt.loadNpmTasks('grunt-contrib-coffee');
  grunt.loadNpmTasks('grunt-contrib-concat');

  grunt.registerTask('default', ['uglify']);
