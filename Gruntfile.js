module.exports = function (grunt) {
    var pkg = grunt.file.readJSON('package.json');
    grunt.initConfig({
      zshlint: {
         options: { force: false },
        files: ['/root/.zshrc','/root/.zsh/completion/git-prompt.sh']
      }
    });
    grunt.loadNpmTasks('grunt-zshlint');
    grunt.registerTask('default', ['zshlint']);
};
