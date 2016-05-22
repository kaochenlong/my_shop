class OrdersController < ApplicationController
  before_action :initialize_cart

  def create
    # 1. 把 Cart => Order
    @order = Order.new(order_params)
    @cart.items.each do |item|
      @order.order_items.build(product_id: item.product_id, quantity: item.quantity)
    end

    if @order.save
      # 2. 刷卡
      # 2.5 清空 Cart
      session[Settings.Cart.name] = nil
      # 3. 回商品列表
      redirect_to products_path, notice: "感謝大爺!"
    else

    end
  end

  private
  def order_params
    params.require(:order).permit(:name, :email, :address, :tel)
  end
end
