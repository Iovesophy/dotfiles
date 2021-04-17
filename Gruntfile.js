module.exports = function (grunt) {
  grunt.initConfig({
    zshlint: {
      options: {
        force: false
      },
      src: ['{{filename}}', '/root/.zshrc', '/root/.zsh/completion/git-prompt.sh']
    }
  });
  grunt.loadNpmTasks('grunt-zshlint');
  grunt.registerTask('default', ['zshlint']);
  grunt.registerTask('file', 'filename', function (fileName) {
    var config = grunt.config();
    config.zshlint.src[0] = config.zshlint.src[0].replace(/{{filename}}/g, fileName);
    grunt.initConfig(config);
    grunt.task.run('zshlint');
  });
};
