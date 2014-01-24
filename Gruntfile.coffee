module.exports = (grunt)->

  grunt.initConfig
    pkg: grunt.file.readJSON('package.json'),
    nugetpack:
      dist:
        src: 'ShareCoffee.Search.nuspec',
        dest: 'nuget/'
        verbose: true
        options:
          version: '0.0.1'
    coffee:
      options:
        sourceMap:true
      compile:
        files: 'dist/ShareCoffee.Search.js' : ['license/*.coffee', 'src/**/*.coffee']
    simplemocha:
      options:
        compilers: 'coffee:coffee-script'
        reporter: 'spec'
      all:
        src: ['test/**/*.coffee']
    uglify:
      options:
        banner: '/* ShareCoffee.Search (c) 2013 Thorsten Hans | dotnet-rocks.com | https://github.com/ThorstenHans/ShareCoffee.Search/ | under MIT License | */'
      dist:
        files:
          'dist/ShareCoffee.Search.min.js': 'dist/ShareCoffee.Search.js'
    clean:
      dist: ['dist/**/*.src.coffee']
    docco:
      coffee:
        src: 'src/*.coffee'
        options:
          output: 'docs/'
          layout: 'linear'
          css: 'docs/assets/sharecoffee.css'

  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-simple-mocha'
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-nuget'
  grunt.loadNpmTasks 'grunt-docco'

  grunt.registerTask 'default', ['simplemocha', 'docco:coffee', 'coffee','uglify', 'nugetpack']
  grunt.registerTask 'build', ['simplemocha', 'docco:coffee', 'coffee', 'uglify']
  grunt.registerTask 'test', ['simplemocha']
  grunt.registerTask 'docs', ['docco:coffee']
