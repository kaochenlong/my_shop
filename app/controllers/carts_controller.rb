class CartsController < ApplicationController
  before_action :initialize_cart

  def add
    # 1. 找到商品
    product = Product.find_by(id: params[:id])
    if product
      # 2. 加到購物車
      @cart.add_item(product.id)
      session[Settings.Cart.name] = @cart.serialize

      # 3. 轉回商品頁!
      redirect_to products_path, notice: '成功加入購物車'
    else
      redirect_to products_path, notice: '找不到商品'
    end
  end

end
