module ProjectsHelper
  def designer_url(designer)
    if designer.url.blank?
      "#{designer.name} "
    else
      "<a href=http://#{designer.url}>#{designer.name} </a>".html_safe + " "
    end
  end
end
