class DashboardController < ApplicationController

  before_action :authorize

  def index
    current_user
  end
end
