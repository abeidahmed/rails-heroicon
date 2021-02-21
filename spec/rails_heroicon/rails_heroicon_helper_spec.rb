RSpec.describe RailsHeroicon::RailsHeroiconHelper do
  include described_class

  describe "#heroicon" do
    it "loads the icon" do
      expect(heroicon("user", variant: "outline")).to be_truthy
    end
  end
end
