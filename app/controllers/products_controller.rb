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


  def show
    @product = Product.find(params[:id])
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @product }
    end
  end

  def new
    @product = Product.new
  end

  def create
    @post = Product.new(product_params)
    if @post.save
      # specifying the status: 201 which means that the resource was created.
      render json: @post, status: 201
    end 
  end
  # redirect_to products_path



  private

  def product_params
    params.require(:product).permit(:name, :description, :inventory, :price)
  end
end
