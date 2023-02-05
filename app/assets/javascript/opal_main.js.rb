require "opal"
require "native"
require 'promise'
require 'browser/setup/mini'

class Kanta
  def initialize(hash)
    hash.each do |k,v|
      instance_variable_set "@#{k}" , v
      self.class.define_method k.to_sym do
        instance_variable_get "@#{k}".to_sym
      end
      self.class.define_method "#{k}=".to_sym  do |new_v|
        instance_variable_set "@#{k}" , new_v
      end
    end

    def mount(on_class)
      puts $document[on_class].inner_html
    end
  end
end
