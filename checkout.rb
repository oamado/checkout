class Checkout
  def initialize(rules)
    @rules = rules
    @purchases = Hash.new
  end

  def scan(item)
    if @purchases.key?(item)
      @purchases[item] += 1
    else
      @purchases[item] = 1
    end
  end

  def total
    total = 0
    @purchases.each do |item, quantity|
      total += @rules[item].calculate_price(quantity)
    end
    total
  end
end
