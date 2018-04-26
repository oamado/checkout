require_relative '../price_rule_factory'

describe PriceRuleFactory do
  describe ".create_price_rule" do
    subject {described_class.create_price_rule(type, 50, offer: {})}
    context "when type is BASIC" do
      let(:type) {described_class::BASIC}
      it "creates a BasicPriceRule" do
        expect(subject.class).to eq(BasicPriceRule)
      end
    end

    context "when type is QUANTITY" do
      let(:type) {described_class::QUANTITY}
      it "creates a QuantityPriceRule" do
        expect(subject.class).to eq(QuantityPriceRule)
      end
    end
  end
end
