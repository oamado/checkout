require_relative 'checkout'
require_relative 'price_rule_factory'

rules = {"A" => PriceRuleFactory.create_price_rule(PriceRuleFactory::BASIC, 30),
          "B" => PriceRuleFactory.create_price_rule(PriceRuleFactory::QUANTITY, 20, offer:{units:3, cost:50})}

checkout = Checkout.new(rules)

checkout.scan("A")
puts "scanning A"

checkout.scan("B")
puts "scanning B"

checkout.scan("A")
puts "scanning A"

checkout.scan("B")
puts "scanning B"

checkout.scan("A")
puts "scanning A"

checkout.scan("A")
puts "scanning A"

puts "Total: #{checkout.total}"
