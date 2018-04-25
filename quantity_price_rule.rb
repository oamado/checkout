class QuantityPriceRule < AbstractPriceRule
  def initialize(base_price, offer: {})
    @base_price = base_price
    @offer      = offer
  end

  def calculate_price(quantity)
    price = (quantity / offer[:units])*offer[:cost]
    price += (quantity % offer[:units])*@base_price
  end
end
