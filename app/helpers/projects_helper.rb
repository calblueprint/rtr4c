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
  		# image_tag("/missing.png")
  	elsif instance.images[0].nil?
  		# link_to(image_tag("/missing.png"), project_path(instance.id))
  	else
      @after_pictures  = instance.images.where("phototype = ?", "A")
  		link_to(image_tag(@after_pictures[0].photo.url), project_path(instance.id))
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
