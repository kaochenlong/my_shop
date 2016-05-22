class Order < ActiveRecord::Base
  has_many :order_items

  include AASM

  aasm do # default column: aasm_state
    state :pending, initial: true
    state :paid, :deliver, :received, :claimed

    event :pay do
      transitions :from => :pending, :to => :paid
    end
    event :deliver do
      transitions :from => :paid, :to => :deliver
    end
    event :send_package do
      transitions :from => :deliver, :to => :received
    end
    event :claim do
      transitions :from => :received, :to => :claimed
    end
  end
end
