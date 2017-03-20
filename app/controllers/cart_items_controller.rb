class CartItemsController < ApplicationController
  before_action :authenticate_user!

  def destroy
    @cart_item = current_cart.cart_items.find_by(product_id:params[:id])
    @cart_item.destroy
    redirect_to carts_path, alert: "你已将#{@cart_item.product.title}移出购物车！"
  end

  def update
    @cart_item = current_cart.cart_items.find_by(product_id:params[:id])
    if @cart_item.product.quantity >= cart_item_params[:quantity].to_i
      @cart_item.update(cart_item_params)
      flash[:notice] = "更新数量成功！"
    else
      flash[:alert] = "数量不足以加入购物车"
    end
    redirect_to :back
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:quantity)

  end
end
