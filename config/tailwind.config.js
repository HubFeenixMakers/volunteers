const defaultTheme = require('tailwindcss/defaultTheme')

const execSync = require('child_process').execSync;
const output = execSync('bundle show merged', { encoding: 'utf-8' });
const fullname = output.trim() + '/app/**/*.{haml,html,rb}' ;

const output2 = execSync('bundle show simple_form_tailwind_css', { encoding: 'utf-8' });
const fullname2 = output2.trim() + '/lib/**/*.rb' ;

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}' ,
    fullname , fullname2
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
