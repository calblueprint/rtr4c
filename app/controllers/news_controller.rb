class NewsController < ApplicationController
  def index
    @news = sorted_news
  end

  def sorted_news
    press = PressUpdate.all
    # blog = Blog.all
    # news = (press + blog).sort_by(&:created_at)
    press.reorder("created_at DESC").page(params[:page]).per_page(10)
  end
end
