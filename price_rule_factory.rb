require_relative 'basic_price_rule'
require_relative 'quantity_price_rule'

class PriceRuleFactory
  BASIC      = :basic
  QUANTITY  = :quantity
  def self.create_price_rule(type, base_price, offer: {})
    case type
    when BASIC
      BasicPriceRule.new(base_price)
    when QUANTITY
      QuantityPriceRule.new(base_price, offer: offer)
    end
  end
end
