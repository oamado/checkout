require_relative '../quantity_price_rule'

describe QuantityPriceRule do
  describe ".calculate_price" do
    let(:rule) {described_class.new(30, offer: {units: 3, cost: 70})}
    context "when receive a quantity without promo" do
      it "calcualtes the correct value" do
        expect(rule.calculate_price(2)).to eq(60)
      end
    end

    context "when receive a quantity with a multiple value for the promo" do
      it "calcualtes the correct value" do
        expect(rule.calculate_price(6)).to eq(140)
      end
    end

    context "when receive a quantity with a non multiple value for the promo" do
      it "calcualtes the correct value" do
        expect(rule.calculate_price(4)).to eq(100)
      end
    end
  end
end
