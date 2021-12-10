module.exports = {
  plugins: [
    require('tailwindcss')({
      autoprefixer: {
        flexbox: 'no-2009'
      },
      stage: 3
    })
  ]
}
