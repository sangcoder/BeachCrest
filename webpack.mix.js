const mix = require('laravel-mix')

/*
 |--------------------------------------------------------------------------
 | Mix Asset Management
 |--------------------------------------------------------------------------
 |
 | Mix provides a clean, fluent API for defining some Webpack build steps
 | for your Laravel application. By default, we are compiling the Sass
 | file for the application as well as bundling up all the JS files.
 |
 */
mix.webpackConfig(webpack => {
  return {
    plugins: [
      new webpack.ProvidePlugin({
        $: 'jquery',
        jQuery: 'jquery',
        'window.jQuery': 'jquery'
      })
    ],
    resolve: {
      modules: [
        'node_modules',
        path.resolve(__dirname, 'vendor/laravel/spark/resources/assets/js')
      ]
    },
    module: {
      rules: [{
        test: /\.css$/,
        loaders: ['style-loader', 'css-loader']
      }
      ]
    }
  }
})

// mix.js('resources/js/app.js', 'public/js').sourceMaps().version()
//   .sass('resources/sass/app.scss', 'public/css').sourceMaps()

mix.js('resources/js/main.js', 'public/backend/js').sourceMaps().version()
  .sass('resources/sass/admin/style.scss', 'public/backend/css')

mix.browserSync('localhost:8000')
mix.disableNotifications()
