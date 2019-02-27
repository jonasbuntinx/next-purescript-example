const withPurescript = require('next-purescript')

module.exports = withPurescript({
  pursLoaderOptions: {
    bundle: true
  }
})
