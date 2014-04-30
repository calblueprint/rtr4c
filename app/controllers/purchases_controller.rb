class PurchasesController < ApplicationController

  before_action :authorize
  
  def index
    @purchases = Purchase.all
    @products = Product.all
    respond_to do |format|
      format.html
      format.xls
    end
  end
end
