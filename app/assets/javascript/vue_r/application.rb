module VueR
  class Application

    def initialize(hash)
      hash.each do |k,v|
        wrap_attr(k,v)
      end
      wrap_methods
      @effect = nil
      @subscribers = {}
    end

    def wrap_attr(k,v)
      instance_variable_set "@#{k}" , v
      define_getter(k)
      define_setter(k)
    end

    def define_getter(k)
      self.class.define_method k.to_sym do
        track(k)
        instance_variable_get "@#{k}".to_sym
      end
    end

    def define_setter(k)
      self.class.define_method "#{k}=".to_sym  do |new_v|
        instance_variable_set "@#{k}" , new_v
        trigger(k)
      end
    end

    def track( key )
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

    def wrap_methods
      methods = self.class.methods(false).collect{|name| self.class.method(name)}
      methods.select!{|method| method.arity > 0 }
      methods.each{|method| wrap_method(method.name)}
    end

    def wrap_method(method_name)
      clazz = self.class
      clazz.alias "#{method_name}_original".to_sym , method_name
      clazz.remove_method method_name
      clazz.define_method method_name do
        @effect = self.class.method(method_name)
        self.class.method("#{method_name}_original".to_sym).call
        @effect = nil
      end
      clazz.method(method_name).call
    end
  end
end
