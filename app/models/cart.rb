class Cart
  attr_reader :items

  def initialize
    @items = []
  end

  def add_item(product_id)
    # 找到那個東西
    item = @items.find { |t| t.product_id == product_id }

    if item
      # 如果有的話，數量 + 1
      item.increment
    else
      # 沒有的話，丟進去
      @items << CartItem.new(product_id)
    end
  end

  def empty?
    @items.empty?
  end

  def total_price
    items.reduce(0) { |sum, item| sum + item.total_price }
  end
end
