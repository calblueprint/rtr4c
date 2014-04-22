class PressUpdate < ActiveRecord::Base
	validates :title, presence: true
	validates :link, presence: true


  def get_embed_link
    self.videolink.split('=').last if self.videolink
  end
end
