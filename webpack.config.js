var GasPlugin = require('gas-webpack-plugin');

module.exports = {
  devtool: 'inline-source-map',
  entry: './src/libraries.js',
  output: {
    path: __dirname,
    filename: './var/build/libraries.js'
  },
  plugins: [
    new GasPlugin()
  ],
  node: {
    fs: 'empty',
    child_process: 'empty'
  }
};
