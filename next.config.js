const withPurescript = (nextConfig = {}) => {
  if (!nextConfig.pageExtensions) {
    nextConfig.pageExtensions = ['jsx', 'js']
  }

  if (nextConfig.pageExtensions.indexOf('purs') === -1) {
    nextConfig.pageExtensions.unshift('purs')
  }

  return Object.assign({}, nextConfig, {
    webpack(config, options) {
      const path = require('path')
      if (!options.defaultLoaders) {
        throw new Error(
          'This plugin is not compatible with Next.js versions below 5.0.0 https://err.sh/next-plugins/upgrade'
        )
      }

      const { dir, defaultLoaders, dev, isServer } = options

      config.resolve.modules.push('bower_components')
      config.resolve.extensions.push('.purs')

      // Backwards compatibility with older versions of Next.js.
      // Next.js will automatically apply hot-self-accept-loader for all extensions in `pageExtensions`
      // Which next-purescript adds itself to
      if (!defaultLoaders.hotSelfAccept) {
        if (dev && !isServer) {
          config.module.rules.push({
            test: /\.purs$/,
            loader: 'hot-self-accept-loader',
            include: [path.join(dir, 'pages')],
            options: {
              extensions: /\.purs$/
            }
          })
        }
      }

      config.module.rules.push({
        test: /\.purs$/,
        include: [dir],
        exclude: /node_modules/,
        use: [
          defaultLoaders.babel,
          {
            loader: 'purs-loader',
            options: Object.assign({}, nextConfig.pursLoaderOptions),
          }
        ],
      })

      if (typeof nextConfig.webpack === 'function') {
        return nextConfig.webpack(config, options)
      }

      return config
    }
  })
}

module.exports = withPurescript({
  pursLoaderOptions: {
    src: ['bower_components/purescript-*/src/**/*.purs', 'pages/**/*.purs'],
    bundle: false
  }
})
