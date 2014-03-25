"use strict"

module.exports = (grunt) ->
  grunt.loadNpmTasks "grunt-contrib-watch"
  grunt.loadNpmTasks "grunt-contrib-coffee"
  grunt.loadNpmTasks "grunt-contrib-sass"
  grunt.loadNpmTasks "grunt-contrib-clean"
  grunt.loadNpmTasks "grunt-contrib-uglify"
  grunt.loadNpmTasks "grunt-contrib-copy"
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

    copy:
      dist:
        files: [
          {
            dest: "assets/javascripts/vendor.js"
            src: [
              "bower_components/bootstrap/dist/js/bootstrap.js"
              "bower_components/jquery/dist/jquery.js"
              # add bower components here after install
            ]
          }
          {
            dest: "assets/styles/vendor.css"
            src: [
              "bower_components/bootstrap/dist/css/bootstrap.css"
              # add bower components here after install
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
    "copy:dist",
    "uglify",
    "cssmin"
  ]
