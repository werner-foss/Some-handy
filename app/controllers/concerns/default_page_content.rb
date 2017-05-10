module DefaultPageContent
  extend ActiveSupport::Concern
  included do
    before_action :set_page_defaults
  end
  def set_page_defaults
    @page_title = "Portfolio | Werner Foss"
    @seo_keywords = "Werner Foss portfolio"
  end
end