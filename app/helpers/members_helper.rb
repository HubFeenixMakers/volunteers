module MembersHelper

  def image_for(someone , classes = "")
    if someone.picture.blank?
      image = asset_url("no_image.png")
    else
      image = someone.picture.url
    end
    if someone.respond_to? :name
      alt = someone.name
    else
      alt = ""
    end
    image_tag(image , alt: alt , class: classes )
  end

  def stayed(member)
    return "Not arrived" if member.arrived.blank?
    text = member.arrived.to_s
    return text + " not left" if member.left.blank?
    text + " " + distance_of_time_in_words( member.left , member.arrived)
  end
end
