require "redcarpet"

module ApplicationHelper
  include Merged::ViewHelper
  
  def renderer
    options = {hard_wrap: true , autolink: true, no_intra_emphasis: true ,
        safe_links_only: true, no_styles: true ,
        link_attributes: { target: '_blank' }}
    html = Redcarpet::Render::HTML.new(options)
    Redcarpet::Markdown.new(html, options)
  end

  def markdown(text)
    return "" if text.blank?
    text = text.text unless text.is_a?(String)
    return "" if text.blank?
    self.renderer.render(text).html_safe
  end

  def main_app
    Rails.application.routes.url_helpers
  end

  def button_classes
    "mr-3 inline-block rounded-lg px-3 py-2 text-md font-medium border border-gray-500"
  end

end
