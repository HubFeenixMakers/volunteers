class FormHandler

  def handle_form(section , data )
    puts "Section on page : #{section.page.name}"
    data.each do |name , value|
      puts "#{name}: #{value}"
    end
  end

end
