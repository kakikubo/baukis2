require "spec_helper"

describe String do
  describe "#<<" do
    it "appends a character" do
      s = "ABC"
      s << "D"
      expect(s.size).to eq(4)
    end
    xexample "appends a nil" do
      s = "ABC"
      s << nil
      expect(s.size).to eq(4)
    end
  end
end