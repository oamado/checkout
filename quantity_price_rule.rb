require_relative 'abstract_price_rule'

class QuantityPriceRule < AbstractPriceRule
  def initialize(base_price, offer:)
    @base_price = base_price
    @offer      = offer
  end

  def calculate_price(quantity)
    price = (quantity / @offer[:units])*@offer[:cost] # promo items
    price += (quantity % @offer[:units])*@base_price  # no promo items
  end
end
