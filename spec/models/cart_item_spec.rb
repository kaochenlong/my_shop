require 'rails_helper'

RSpec.describe CartItem, type: :model do
  describe "CartItem 功能" do
    it "每個 Item 都可以計算它自己的金額(小計)" do
      p1 = FactoryGirl.create(:product, :ruby_book)  # 100 元
      p2 = FactoryGirl.create(:product, :php_book)   # 1000 元
      cart = Cart.new

      5.times { cart.add_item(p1.id) }
      3.times { cart.add_item(p2.id) }

      expect(cart.items.first.total_price).to be 500
      expect(cart.items.last.total_price).to be 3000
    end
  end
end
