class PriceRuleFactory
  BASIC      = :basic
  QUANTITY  = :quantity
  def create_price_rule(base_price, type, offer: {})
    case type
    when BASIC
      BasicPriceRule.new(base_price)
    when QUANTITY
      QuantityPriceRule.new(base_price, offer)
    end
  end
end
