require "rails"
require "merged"

desc "Explaining what the task does"
task :consistency  => :environment do
   {Section: [:image, :page] , Card: [:section , :image]}.each do |name , keys|
    Merged.check_class(name, keys)
  end
  Merged.check_images
end

module Merged

  def self.check_class(name , ids)
    clazz = self.const_get name.to_s
    clazz.all.each do |elem|
      ids.each do |id|
        check_id(elem , id )
      end
    end
  end

  def self.check_id(elem , id)
    attr = elem.attributes["#{id}_id".to_sym]
    return if attr.blank?
    begin
      key = self.const_get(id.to_s.capitalize).find( attr.to_i)
    rescue
      puts "#{elem.class.name.split('::').last}:#{elem.id} missing #{id}:#{attr}"
    end
  end

  def self.check_images
    Image.all.each do |image|
      next if File.exist?(image.full_filename)
      puts "missing image #{image.full_filename}"
    end
  end
end
