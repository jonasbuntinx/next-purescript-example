const withBundleAnalyzer = require("@next/bundle-analyzer")({
  enabled: process.env.ANALYZE === "true"
});

const withPreact = require('next-plugin-preact');

module.exports = withBundleAnalyzer(withPreact({
  webpack(config, { isServer }) {
    // https://github.com/purescript-contrib/purescript-affjax/issues/63
    if (isServer) {
      config.module.rules.push(
        {
          test: /output\/Affjax\/foreign\.js$/,
          loader: 'string-replace-loader',
          options: {
            search: 'module.require',
            replace: '__webpack_require__'
          }
        }
      )
    }

    return config
  }
}))
