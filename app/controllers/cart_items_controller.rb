class CartItemsController < ApplicationController
  before_action :authenticate_user!

  def destroy
    @cart_item = current_cart.cart_items.find_by(product_id:params[:id])
    @cart_item.destroy
    redirect_to carts_path, alert: "你已将#{@cart_item.product.title}移出购物车！"
  end
end
