module MembersHelper

  def image_for(someone , classes = "")
    if someone.picture.blank?
      image = asset_url("no_image")
    else
      image = element.picture.url
    end
    image_tag(image , alt: someone.name , class: classes )
  end

end
