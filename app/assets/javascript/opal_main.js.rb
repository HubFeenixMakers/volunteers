require "opal"
require "native"
require 'promise'
require 'browser/setup/mini'

class Kanta
  def initialize(hash)
    hash.each do |k,v|
      wrap_attr(k,v)
    end
    @effect = nil
    @subscribers = {}
  end

  def track( target , key )
    return unless @effect
    subs = get_subscribers_for(key)
    subs << @effect
  end

  def trigger(key)
    effects = get_subscribers_for(key)
    effects.each {|effect| effect() }
  end

  def get_subscribers_for(key)
    unless @subscribers.has_key?(key)
      @subscribers[key] = []
    end
    @subscribers[key]
  end

  def mount(on_class)
    puts $document[on_class].inner_html
  end

  def wrap_attr(k,v)
    instance_variable_set "@#{k}" , v
    define_getter(k)
    define_setter(k)
  end

  def define_getter(k)
    self.class.define_method k.to_sym do
      track(key)
      instance_variable_get "@#{k}".to_sym
    end
  end
  def define_setter(k)
    self.class.define_method "#{k}=".to_sym  do |new_v|
      instance_variable_set "@#{k}" , new_v
      trigger(key)
    end
  end
end
