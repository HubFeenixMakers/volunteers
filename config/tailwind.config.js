const defaultTheme = require('tailwindcss/defaultTheme')

const execSync = require('child_process').execSync;
const output = execSync('bundle   show merged', { encoding: 'utf-8' });
const fullname = output.trim() + '/app/**/*.{haml,html,rb}' ;
console.log(fullname);

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}' ,
    fullname
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
      },
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
  ]
}
