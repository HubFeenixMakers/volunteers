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
    './config/initializers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}' ,
    fullname , fullname2
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
      },
      typography: ({ theme }) => ({
        inherit: {
          css: {
            '--tw-prose-body': 'inherit' ,
            '--tw-prose-headings': 'inherit',
            '--tw-prose-lead': 'inherit' ,
            '--tw-prose-links': 'inherit' ,
            '--tw-prose-bold': 'inherit' ,
            '--tw-prose-counters': 'inherit' ,
            '--tw-prose-bullets': 'inherit' ,
            '--tw-prose-hr': 'inherit' ,
            '--tw-prose-quotes': 'inherit' ,
            '--tw-prose-quote-borders': 'inherit' ,
            '--tw-prose-captions': 'inherit' ,
            '--tw-prose-code': 'inherit' ,
            '--tw-prose-pre-code': 'inherit' ,
            '--tw-prose-pre-bg': 'inherit' ,
            '--tw-prose-th-borders': 'inherit' ,
            '--tw-prose-td-borders': 'inherit' ,
            '--tw-prose-invert-body': 'inherit' ,
            '--tw-prose-invert-headings': 'inherit',
            '--tw-prose-invert-lead': 'inherit' ,
            '--tw-prose-invert-links': 'inherit',
            '--tw-prose-invert-bold': 'inherit',
            '--tw-prose-invert-counters': 'inherit' ,
            '--tw-prose-invert-bullets': 'inherit' ,
            '--tw-prose-invert-hr': 'inherit' ,
            '--tw-prose-invert-quotes': 'inherit' ,
            '--tw-prose-invert-quote-borders': 'inherit' ,
            '--tw-prose-invert-captions': 'inherit' ,
            '--tw-prose-invert-code': 'inherit',
            '--tw-prose-invert-pre-code': 'inherit' ,
            '--tw-prose-invert-pre-bg': 'inherit',
            '--tw-prose-invert-th-borders': 'inherit' ,
            '--tw-prose-invert-td-borders': 'inherit' ,

          },
        },
      }),
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
  ]
}
