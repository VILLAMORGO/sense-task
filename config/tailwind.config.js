const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*'
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
      },
      padding: {
        '120': '27rem',
        '130': '32rem',
      },
      height: {
        '90': '22rem',
        '120': '30rem',
        '140': '40rem',
        '30px': '30px',
      },
      width: {
        '90': '22rem',
        '120': '30rem',
        '140': '40rem',

        '30px': '30px',
      },
      minHeight: {
        '1/3': '10rem',
      },
      keyframes: {
        wiggle: {
          '0%, 100%': { transform: 'rotate(-4deg)' },
          '50%': { transform: 'rotate(4deg)' },
        },
      },
      animation: {
        wiggle: 'wiggle 1s ease-in-out infinite',
      },

    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
  ]
}
