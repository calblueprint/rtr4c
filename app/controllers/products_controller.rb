class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :authorize
  # before_action :authorize, except: [:index,:show]

  # GET /products
  # GET /products.json
  def index
    @products = Product.all
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @product = set_product
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
    @product = set_product
  end

  # POST /products
  # POST /products.json
  def create
      size = SizeVariant.new
      if params.has_key?(:small)
        size.sizes << params[:small]
      end
      if params.has_key?(:medium)
        size.sizes << params[:medium]
      end
      if params.has_key?(:large)
        size.sizes << params[:large]
      end

      @product = Product.new(product_params)
      if @product.save
        if size.sizes.any?
          size.product = @product
          @product.size_variants << size
          size.save
        end
        redirect_to @product, notice: 'Product was successfully created.'
      else
        render action: 'new'
      end
    end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    @product = set_product
    if @product.update(product_params)
      redirect_to @product, notice: 'Product was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product = set_product
    @product.destroy
    redirect_to products_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :description, :price, images_attributes: [:id, :name, :photo, :_destroy])
    end
end
