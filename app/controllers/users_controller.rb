class UsersController < ApplicationController

  def show
    @user = current_user
    @products = Product.where(user_id: @user)
    @compras = Order.where(user_id: @user)
    @ventas = Order.select { |order| order.product.user = @user }
  end
end
