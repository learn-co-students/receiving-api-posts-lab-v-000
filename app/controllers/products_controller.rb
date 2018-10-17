class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def inventory
    product = Product.find(params[:id])
    render plain: product.inventory > 0 ? true : false
  end

  def description
    product = Product.find(params[:id])
    render plain: product.description
  end

  def new
    @product = Product.new
  end
  # In products#create, render a JSON representation of the product after successfully creating it.
  def create
    @product = Product.create(product_params)
    render json: @product, status: 201
  end
  # specify json to tell requestor that the response is properly formatted JSON string,
  # so we can operate on it using JS
  # status 201 indicates that the product resource was created
  def show
    @product = Product.find(params[:id])
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @product }
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :inventory, :price)
  end
end
