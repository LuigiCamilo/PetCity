class OrdersController < ApplicationController
  def create
    # console.log(order_params)
    @order = Order.new(order_params)
    product = Product.find(params[:product_id])
    @order.product = product
    if @order.quantity > product.stock
      # implementar mensaje de error "no hay suficientes en stock"
      redirect_to product_path(product)
    else
      # @order.product = product
      @order.price = product.price * @order.quantity
      @order.user = current_user
      if @order.save
        # implementar redireccionar a complete de productos
        product.stock -= @order.quantity
        product.save
        redirect_to complete_products_path(product)
      else
        render :new, status: :unprocessable_entity
      end
    end
  end

  private

  def order_params
    params.require(:order).permit(:quantity, :product_id)
  end
end

# t.integer "quantity"
# t.float "price"
# t.bigint "user_id", null: false
# t.bigint "product_id", null: false
