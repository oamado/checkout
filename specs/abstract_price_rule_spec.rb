require_relative '../abstract_price_rule'

describe AbstractPriceRule do
  describe ".calculate_price" do
    context "when it hasn't an implementation" do
      it "throws an NotImplementedError" do
        expect{described_class.new.calculate_price(0)}.to raise_error(NotImplementedError, "AbstractPriceRule does not implement calculate_price(quantity)")
      end
    end
  end
end
