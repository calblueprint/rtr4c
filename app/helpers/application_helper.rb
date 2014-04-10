module ApplicationHelper
  # returns url of first image associated with the model instance
  def first_image(instance)
    if instance.images.size > 0
      instance.images[0].photo.url
    end
  end
end
