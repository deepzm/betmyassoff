module.exports = function(grunt) {
 
    grunt.initConfig({
        pkg: grunt.file.readJSON('package.json'),
       
 
        karma: {
            unit: {
                configFile: 'test/js/karma.conf.js'
            }
        },

        bower: {
            install : {
                options: {
                    targetDir: './public/vendor',
                    layout: 'byType',
                    cleanTargetDir: false,
                }
            }
        }
    });
 
    grunt.loadNpmTasks('grunt-bower-task');
    grunt.loadNpmTasks('grunt-karma');
    grunt.registerTask('default', ['bower']);
};