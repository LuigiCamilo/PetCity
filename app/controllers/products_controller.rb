class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_product, only: [:show, :edit, :update, :destroy, :complete]

  def index
    @products = Product.where('stock > ?', 0)
    if params[:query].present?
      @products = Product.search(params[:query])
    end
  end

  def show
    @order = Order.new
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user
    if @product.save
      redirect_to product_path(@product)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    redirect_to product_path(@product) unless @product.user == current_user
  end

  def update
    if @product.update(product_params)
      redirect_to product_path(@product)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @product.stock = 0
    redirect_to products_path, status: :see_other
  end

  def confirm
  end

  def complete
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:title, :description, :price, :stock, :brand, :pet, :category, :photo)
  end
end
