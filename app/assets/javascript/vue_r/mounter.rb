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
      puts "Text: #{elem.text}"
      puts "DYN text" if elem.text.include? "{{"
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
