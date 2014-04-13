class NewsController < ApplicationController
  def index
    @news = sorted_news
  end

  def sorted_news
    press = PressUpdate.all
    blog = Blogpost.all
    news = (press + blog).sort_by(&:created_at).reverse
    news.paginate(:page => params[:page], :per_page => 10)
  end
end
