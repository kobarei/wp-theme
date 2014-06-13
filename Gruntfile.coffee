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
          "public/javascripts/main.js": ["assets/coffee/{,*/}*.{coffee,litcoffee,coffee.md}"]

    sass:
      dist:
        files:[
          {
            dest: "style.css"
            src: ".tmp/style.scss"
          }
        ]

    watch:
      coffee:
        files: ["assets/coffee/{,*/}*.{coffee,litcoffee,coffee.md}"]
        tasks: ['concat:bower', 'coffee', 'uglify']
      sass:
        files: ["assets/styles/{,*/}*.{scss,sass}"]
        tasks: ['concat:sass', 'sass', 'cssmin']

    clean:
      dist:
        files:
          src: [
            "public/styles"
            "public/javascripts"
            ".tmp"
            "style.css"
          ]

    concat:
      bower:
        files: [
          {
            dest: "public/javascripts/vendor.js"
            src: [
              "bower_components/jquery/dist/jquery.js"
              # add bower components here after bower install
              # "bower_components/bootstrap/dist/js/bootstrap.js"
            ]
          }
          {
            dest: "public/styles/vendor.css"
            src: [
              # add bower components here after bower install
              # "bower_components/bootstrap/dist/css/bootstrap.css"
            ]
          }
        ]
      sass:
        files: [
          {
            dest: ".tmp/style.scss"
            src: [
              # add scss here
              "library/styles/main.scss"
              # "library/styles/front_page.scss"
            ]
          }
        ]

    uglify:
      dist:
        files: [
          {
            dest: "public/javascripts/vendor.js"
            src: "public/javascripts/vendor.js"
          }
          {
            dest: "public/javascripts/main.js"
            src: "public/javascripts/main.js"
          }
        ]

    cssmin:
      dist:
        files: [
          {
            dest: "public/styles/vendor.css"
            src: "public/styles/vendor.css"
          }
          {
            dest: "style.css"
            src: "style.css"
          }
        ]

  grunt.registerTask "compile", [
    "clean"
    "coffee"
    "concat"
    "sass"
    "uglify"
    "cssmin"
  ]
