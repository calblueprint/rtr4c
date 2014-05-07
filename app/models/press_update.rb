class PressUpdate < ActiveRecord::Base
	validates :title, presence: true
	validates :link, presence: true


  def get_embed_link
    self.videolink.split('=').last if self.videolink
  end

  def is_youtube
    true if self.videolink.include? "youtube.com"
  end

  def is_embed
    true if self.videolink.include? "embed"
  end
end
