class ProductsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :inventory, :description]

  def index
    @products = Product.all
  end

  def inventory
    render plain: @product.inventory > 0 ? true : false
  end

  def description
    render plain: @product.description
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.create(product_params)
    # use the ActiveModel::Serializer to get a JSON representation of the post just created
    # and use it to display the new post without redirecting or refreshing the page
    render json: @product, status: 201
  end

  def show
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @product }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @product = Product.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def product_params
    params.require(:product).permit(:name, :description, :inventory, :price)
  end
end
