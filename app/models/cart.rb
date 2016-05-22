class Cart
  attr_reader :items

  def initialize
    @items = []
  end

  def serialize
    result = items.map { |item|
      { "product_id" => item.product_id, "quantity" => item.quantity }
    }

    return {
      "cart" => {
        "items" => result
      }
    }
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
    total = items.reduce(0) { |sum, item| sum + item.total_price }

    if 聖誕節?
      total = total * 0.9
    end

    total
  end

  private
  def 聖誕節?
    Time.now.month == 12 and Time.now.day == 25
  end
end
