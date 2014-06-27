module.exports = function(grunt) {
 
    grunt.initConfig({
        pkg: grunt.file.readJSON('package.json'),
       
 
        karma: {
            unit: {
                configFile: 'test/js/karma.conf.js'
            }
        },

        bower: {
          dev: {
            dest: 'public/vendor/',
            js_dest: 'public/vendor/js',
            css_dest: 'public/vendor/styles',
            options: {
              expand: true
            }
          }
        }
    });
 
    grunt.loadNpmTasks('grunt-bower');
    grunt.loadNpmTasks('grunt-karma');
    grunt.registerTask('default', ['bower','karma']);
};