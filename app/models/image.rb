class Image < ActiveRecord::Base
  belongs_to :imageable, polymorphic: true
  has_attached_file :photo, default_url: "/missing.png", styles: {
    medium: '300x300'
  }
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/

  def photo_from_url(url)
    self.photo = URI.parse(url)
  end
end
