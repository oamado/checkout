require_relative 'checkout'
require_relative 'price_rule_factory'

def scan_multiple_items(checkout, items)
  items.each do |item|
    checkout.scan(item)
    puts "scanning #{item}"
  end
end

rules = {"A" => PriceRuleFactory.create_price_rule(PriceRuleFactory::BASIC, 30),
          "B" => PriceRuleFactory.create_price_rule(PriceRuleFactory::QUANTITY, 20, offer:{units:3, cost:50})}

checkout = Checkout.new(rules)

scan_multiple_items(checkout, ["A", "B", "A", "B", "A", "A"])

puts "Total: #{checkout.total}"
