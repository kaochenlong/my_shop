require 'rails_helper'

RSpec.describe Cart, type: :model do
  describe "購物車基本功能" do
    it "可以新增商品到購物車裡，然後購物車裡就有東西了" do
      cart = Cart.new
      cart.add_item(1)
      expect(cart.empty?).to be false

      cart2 = Cart.new
      expect(cart2.empty?).to be true
    end

    it "如果加了相同種類的商品，CartItem 並不會增加，但數量會改變。" do

    end
  #* 商品可以放到購物車裡，也可以再拿出來
  #* 可以計算整個購物車的總消費金額
  end

  describe "購物車進階功能" do
    #* 可以將購物車內容轉換成 Hash
    #* 也可以把 Hash 還原成購物車的內容
  end
end
