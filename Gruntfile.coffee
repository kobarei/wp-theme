"use strict"

module.exports = (grunt) ->
  grunt.loadNpmTasks "grunt-contrib-watch"
  grunt.loadNpmTasks "grunt-contrib-coffee"
  grunt.loadNpmTasks "grunt-contrib-sass"
  grunt.loadNpmTasks "grunt-contrib-clean"
  grunt.loadNpmTasks "grunt-contrib-uglify"
  grunt.loadNpmTasks "grunt-contrib-concat"
  grunt.loadNpmTasks "grunt-contrib-cssmin"

  grunt.initConfig
    coffee:
      compile:
        files:
          "assets/javascripts/main.js": ["library/coffee/{,*/}*.{coffee,litcoffee,coffee.md}"]

    sass:
      dist:
        files:
          "style.css": ["library/styles/{,*/}*.{scss,sass}"]

    watch:
        coffee:
          files: ["library/coffee/{,*/}*.{coffee,litcoffee,coffee.md}"]
          tasks: ['coffee']
        sass:
          files: ["library/styles/{,*/}*.{scss,sass}"]
          tasks: ['sass']

    clean:
      dist:
        files:
          src: [
            "assets"
            "style.css"
          ]

    concat:
      dist:
        files: [
          {
            dest: "assets/javascripts/vendor.js"
            src: [
              "bower_components/jquery/dist/jquery.js"
              # add bower components here after bower install
              # "bower_components/bootstrap/dist/js/bootstrap.js"
            ]
          }
          {
            dest: "assets/styles/vendor.css"
            src: [
              # add bower components here after bower install
              # "bower_components/bootstrap/dist/css/bootstrap.css"
            ]
          }
        ]

    uglify:
      dist:
        files: [
          {
            dest: "assets/javascripts/vendor.js"
            src: "assets/javascripts/vendor.js"
          }
          {
            dest: "assets/javascripts/main.js"
            src: "assets/javascripts/main.js"
          }
        ]

    cssmin:
      dist:
        files: [
          {
            dest: "assets/styles/vendor.css"
            src: "assets/styles/vendor.css"
          }
          {
            dest: "style.css"
            src: "style.css"
          }
        ]

  grunt.registerTask "compile", [
    "clean",
    "coffee",
    "sass",
    "concat",
    "uglify",
    "cssmin"
  ]
