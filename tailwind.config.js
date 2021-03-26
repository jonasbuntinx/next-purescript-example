const colors = require('tailwindcss/colors')

module.exports = {
  purge: [
    './output/**/*.js',
    './pages/**/*.js'
  ],
  theme: {
    colors: {
      gray: colors.blueGray,
      teal: colors.teal,
    }
  },
  variants: {},
  plugins: [],
}
