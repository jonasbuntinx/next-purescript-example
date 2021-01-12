const colors = require('tailwindcss/colors')

module.exports = {
  purge: [
    './src/**/*.purs'
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
