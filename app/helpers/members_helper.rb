module MembersHelper

  def picture_for(someone , classes = "")
    image = someones_path(someone)
    if someone.respond_to? :name
      alt = someone.name
    else
      alt = ""
    end
    image_tag(image , alt: alt , class: classes )
  end

  def someones_path( someone )
    if someone.picture.blank?
      asset_url("no_image.png")
    else
      someone.picture.url
    end
  end
  def stayed(member)
    return "Not arrived" if member.arrived.blank?
    text = member.arrived.to_s
    return text + " not left" if member.left.blank?
    text + " " + distance_of_time_in_words( member.left , member.arrived)
  end
end
