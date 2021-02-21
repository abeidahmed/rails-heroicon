RSpec.describe RailsHeroicon::RailsHeroicon do
  describe "#initialize" do
    it "sets the icon name" do
      icon = RailsHeroicon::RailsHeroicon.new("user")

      expect(icon.instance_variable_get(:@icon)).to eq("user")
    end

    it "sets the default variant type to outline" do
      icon = RailsHeroicon::RailsHeroicon.new("user")

      expect(icon.instance_variable_get(:@variant)).to eq("outline")
    end

    it "sets the variant type" do
      icon = RailsHeroicon::RailsHeroicon.new("user", variant: :solid)

      expect(icon.instance_variable_get(:@variant)).to eq("solid")
    end

    it "sets the size" do
      icon = RailsHeroicon::RailsHeroicon.new("user", size: 24)

      expect(icon.instance_variable_get(:@size)).to eq(24)
    end
  end

  describe "#to_svg" do
    it "asserts the icon" do
      icon = RailsHeroicon::RailsHeroicon.new("user")

      expect(icon.to_svg).to match(/svg/)
    end

    it "asserts the html attributes passed" do
      icon = RailsHeroicon::RailsHeroicon.new("user", class: "text-red-600")

      expect(icon.to_svg).to match(/class="text-red-600"/)
    end
  end
end
