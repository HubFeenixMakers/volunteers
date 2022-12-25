module ApplicationHelper

  def markdown(text)
    Merged::MergedHelper.markdown(text)
  end
  def main_app
    Rails.application.routes.url_helpers
  end
end
