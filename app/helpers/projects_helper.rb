module ProjectsHelper
  def designer_url(designer)
    if designer.url.blank?
      "#{designer.name}"
    else
      "#{link_to ""}"
  end
end
