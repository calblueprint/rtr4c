module ProjectsHelper
  def designer_url(designer)
    if designer.url.blank?
      "#{designer.name}, "
    else
      "#{link_to designer.name, designer.url}, "
    end
  end
end
