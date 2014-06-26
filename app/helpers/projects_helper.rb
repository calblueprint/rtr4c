module ProjectsHelper
  def designer_url(designer)
    if designer.url.blank?
      "#{designer.name} "
    else
      "<a href=http://#{designer.url}>#{designer.name} </a>".html_safe + " "
    end
  end

  def safe_image(instance)
  	if instance.nil?
  		image_tag("/missing.png")
  	else
  		link_to(image_tag(instance.images[0].photo.url), project_path(instance.id))
  	end
  end

  def safe_text(instance)
  	if instance.nil?
  	  ""
  	else
  	  "<p>#{instance.title } <br> #{ instance.location }</p>".html_safe
  	end	
  end
end
