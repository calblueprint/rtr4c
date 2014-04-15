class PurchasesController < ApplicationController
  def index
    @purchases = Purchase.all
    @products = Product.all
    respond_to do |format|
      format.html
      format.xls
    end
  end
end
