class Customer < ActiveRecord::Base
  has_many :orders

  validates :name, presence: true
  validates :email, presence: true

  KINDS = [
    :standard,
    :vip,
  ]

  def lifetime_value
    orders.map(&:total_price).reduce(0, :+)
  end
end
