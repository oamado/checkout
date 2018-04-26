class Checkout
  def initialize(rules)
    @rules = rules
    @purchases = Hash.new
  end

  def scan(item)
    @purchases.key?(item) ? @purchases[item] += 1 : @purchases[item] = 1
  end

  def total
    total = 0
    @purchases.each { |item, quantity| total += @rules[item].calculate_price(quantity) }
    total
  end
end
