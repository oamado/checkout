require_relative 'abstract_price_rule'

class BasicPriceRule < AbstractPriceRule

  def initialize(base_price)
    @base_price = base_price
  end

  def calculate_price(quantity)
    @base_price * quantity
  end
end
