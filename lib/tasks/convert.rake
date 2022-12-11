module Merged
  class Converter

    def self.convert_pages
      pages = Page.all
      data = pages.collect do |name , page|
          {name: page.name ,
            updated_at: page.updated_at ,
            }
      end
      File.write( "merged/pages.yml" , data.to_yaml)
    end
    def self.convert_sections
      sections = Section.all
      data = sections.collect do |name ,section |
        s = section.content
        s["updated_at"] = section.page.updated_at
        s["page_id"] = section.page.id
        s["index"] = section.index + 1
        s
      end
      File.write( "merged/sections.yml" , data.to_yaml)
    end
    def self.convert_cards
      cards = Card.all
      data = cards.collect do |name ,card |
        s = card.content
        s["updated_at"] = card.section.page.updated_at
        s["section_id"] = card.section.id
        s["index"] = card.index + 1
        s
      end
      File.write( "merged/cards.yml" , data.to_yaml)
    end
    def self.convert_all
      Card.all.values.each_with_index {| card , index| card.content["id"] = index + 1}
      Section.all.values.each_with_index {| section , index| section.content["id"] = index + 1}
      convert_pages
      convert_cards
      convert_sections
    end
  end
end


namespace :convert do
  task :all => :environment do
    Merged::Page.load_pages
    puts Merged::Converter.convert_all
  end
  task :pages => :environment do
    Merged::Page.load_pages
    puts Merged::Converter.convert_pages
  end
  task :sections => :environment do
    Merged::Page.load_pages
    puts Merged::Converter.convert_sections
  end
  task :cards => :environment do
    Merged::Page.load_pages
    puts Merged::Converter.convert_cards
  end
end
