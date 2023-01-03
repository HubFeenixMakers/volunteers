require "redcarpet"

module ApplicationHelper

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

end
