require_relative '../checkout'
require_relative '../price_rule_factory'

describe Checkout do
  describe ".scan" do
    context "when there isn't any elements of the scanned item" do
      it "adds an element to purchases" do
        checkout = described_class.new([])
        checkout.scan("A")
        expect(checkout.instance_variable_get("@purchases")["A"]).to eq(1)
      end
    end

    context "when there is a element of the scanned item" do
      it "adds the element to the current quantity" do
        checkout = described_class.new([])
        checkout.instance_variable_get("@purchases")["A"] = 3
        checkout.scan("A")
        expect(checkout.instance_variable_get("@purchases")["A"]).to eq(4)
      end
    end
  end

  describe ".total" do
    context "when it has items with basic price rule" do
      it "returns the correct value" do
        checkout = described_class.new({"A" => PriceRuleFactory.create_price_rule(PriceRuleFactory::BASIC, 20)})
        checkout.scan("A")
        checkout.scan("A")
        expect(checkout.total).to eq(40)
      end
    end

    context "when it has items with quantity price rule" do
      it "returns the correct value" do
        checkout = described_class.new({"A" => PriceRuleFactory.create_price_rule(PriceRuleFactory::QUANTITY, 20, offer: {units: 2, cost: 30})})
        checkout.scan("A")
        checkout.scan("A")
        checkout.scan("A")
        expect(checkout.total).to eq(50)
      end
    end

    context "when it has items with mixed price rules" do
      it "returns the correct value" do
        checkout = described_class.new({"A" => PriceRuleFactory.create_price_rule(PriceRuleFactory::BASIC, 40),
                                        "B" => PriceRuleFactory.create_price_rule(PriceRuleFactory::QUANTITY, 20, offer: {units: 2, cost: 30})})
        checkout.scan("B")
        checkout.scan("A")
        checkout.scan("B")
        checkout.scan("B")
        expect(checkout.total).to eq(90)
      end

    end
  end
end
