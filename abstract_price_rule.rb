class AbstractPriceRule
  
  def calculate_price(quantity)
    raise NotImplementedError, "#{self.class.name} does not implement calculate_price(quantity)"
  end
end
