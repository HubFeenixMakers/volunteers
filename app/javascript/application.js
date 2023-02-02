// Configure your import map in config/importmap.rb.
// Read more: https://github.com/rails/importmap-rails

// Currently haml filter does not support modules.
// import and make global as workaround
//
// haml module syntax is really clunky, filing issue and hoping
//
import GLightbox from 'glightbox';
globalThis.GLightbox = GLightbox;
