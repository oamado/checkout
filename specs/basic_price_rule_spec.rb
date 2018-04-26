require_relative '../basic_price_rule'

describe BasicPriceRule do
  describe ".calculate_price" do
    context "when receive a quantity" do
      it "calcualtes the correct value" do
        rule = described_class.new(30)
        expect(rule.calculate_price(5)).to eq(150)
      end
    end
  end
end
