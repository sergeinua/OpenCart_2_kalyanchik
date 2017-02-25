module.exports = function (grunt) {
    var cssdir = 'catalog/view/theme/default/stylesheet/';
    //var jsdir = 'js/';
    var appName = 'hkh';
    var imgdir = 'catalog/view/theme/default/image/';
    var imgdirdist = 'catalog/view/theme/default/image/dist/';

    grunt.initConfig({
        clean: {
            start:  [ cssdir + "dist/"+appName+".gen.css",],
            cssmap: [ cssdir + "dist/"+appName+".css.map" ],
            css:    [ cssdir + "dist/"+appName+".css", cssdir + "dist/filterpro.css", cssdir + "dist/jquery.loadmask.css" ],
            cssmin: [ cssdir + "dist/"+appName+".min.css", cssdir + "dist/filterpro.min.css", cssdir + "dist/jquery.min.css" ]
        },
        
        less: {
            development: {

                options: {
                    paths: [cssdir + "dist/"],
                    compress: true,
                    cleancss: false,
                    sourceMap: true,
                    outputSourceFiles: true,
                    sourceMapFilename: 'catalog/view/theme/default/stylesheet/dist/hkh.css.map',
                    sourceMapURL: '/catalog/view/theme/default/stylesheet/dist/hkh.css.map'

                 },
                files: {
                    "catalog/view/theme/default/stylesheet/dist/hkh.css": "catalog/view/theme/default/stylesheet/source/hkh.less"
                }
            }
        },

        watch: {
            css: {
                files: [cssdir+'source/less/*.less', cssdir+'source/less/mixins/*.less', cssdir+'source/'+appName+'.less'],
                tasks: ['clean:start', 'less:development', 'clean:cssmap', 'cssmin', 'clean:css', 'concat:css', 'clean:cssmin', 'ftp-deploy:production']
            }
        },

		"ftp-deploy": {
            production:{
                auth: {
                    host: '185.25.119.140',
                    port: 21,
                    authKey: 'key'
                },
                src: 'catalog/view/theme/default/stylesheet/dist/',
                dest: 'catalog/view/theme/default/stylesheet/dist/'
            }
        },

        cssmin: {
            options: {
                keepSpecialComments: 0
            },

            target: {
                files: [{
                    expand: true,
                    cwd: 'catalog/view/theme/default/stylesheet/dist/',
                    src: ['*.css', '!*.min.css'],
                    dest: 'catalog/view/theme/default/stylesheet/dist/',
                    ext: '.min.css'
                }]
            }
        },

        uglify:{
            min: {
                my_target: { 
                    files: {
                        'catalog/view/javascript/common.min.js': 'catalog/view/javascript/common.js'
                    }
                }
            }
        },

        imagemin: {
            png: {
                options: {
                    optimizationLevel: 7
                },
                files: [
                    {
                        expand: true,
                        cwd: imgdir,
                        src: ['**/*.{png,jpg,gif}'],
                        dest: imgdirdist
                    }
                ]
            }
        },

        concat: {
            css: {
                files: {
                    'catalog/view/theme/default/stylesheet/dist/hkh.gen.css': ['catalog/view/theme/default/stylesheet/dist/hkh.min.css', 'catalog/view/theme/default/stylesheet/dist/faculty/filterpro.css', 'catalog/view/theme/default/stylesheet/dist/faculty/jquery.loadmask.css']
                }
            }
        }

    });

    grunt.loadNpmTasks('grunt-contrib-clean');
    grunt.loadNpmTasks('grunt-contrib-watch');
    grunt.loadNpmTasks('grunt-contrib-less');
    grunt.loadNpmTasks('grunt-ftp-deploy');
    grunt.loadNpmTasks('grunt-contrib-concat');
    grunt.loadNpmTasks('grunt-contrib-cssmin');
    grunt.loadNpmTasks('grunt-contrib-imagemin');
    grunt.loadNpmTasks('grunt-contrib-uglify');

    grunt.registerTask('default', ['clean:start', 'less:development', 'clean:cssmap', 'cssmin', 'clean:css', 'concat:css', 'clean:cssmin', 'ftp-deploy:production']);
    grunt.registerTask('image', ['imagemin:png'])
    grunt.registerTask('js', ['uglify:min'])
};