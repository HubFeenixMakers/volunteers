require 'opal-parser'

module VueR
  class Mounter

    def initialize( id , app )
      @root = $document[id]
      @application = app
    end

    def mount
      mount_Element(@root)
    end

    def mount_Text elem
      text = elem.text
      puts text
      scan = text.scan(/{{\s?([^}]*)\s?}}/)
      return unless scan.length > 0
      puts scan
      raise "only one curly per text implemented not:#{scan.length}" if scan.length > 1
      match = text.match(/{{\s?([^}]*)\s?}}/)
      str_before = text[0 ... match.begin(0)]
      str_after = text[ match.end(0) .. -1]
      ruby = match[0][2 ... -2]

      proc = Proc.new do
        elem.text = str_before + @application.eval(ruby).to_s + str_after
      end
      proc.call

    end

    def mount_Element(elem)
      elem.attributes.each do |name , value|
        puts "Name: #{name}"
        puts "Value: #{value}"
        puts "DYN" if name.start_with?("r_")
        puts "EVENT" if name.start_with?("e_")
      end
      elem.children.each do |elem|
        base_name = elem.class.to_s.split("::").last
        send "mount_#{base_name}" , elem
      end
    end
  end
end
