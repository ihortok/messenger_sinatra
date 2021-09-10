const path = require('path');
const miniCss = require('mini-css-extract-plugin');

module.exports = {
   entry: './app/assets/javascript/index.js',
   output: {
      filename: 'main.js',
      path: path.resolve(__dirname, 'public/js')
   },
   module: {
      rules: [{
         test:/\.(s*)css$/,
         use: [
            miniCss.loader,
            'css-loader',
            'sass-loader',
         ]
      }]
   },
   plugins: [
      new miniCss({
         filename: 'style.css',
      }),
   ]
};
