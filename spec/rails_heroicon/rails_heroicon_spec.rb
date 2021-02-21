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

    it "raises if variant is undefined" do
      expect do
        RailsHeroicon::RailsHeroicon.new("user", variant: "unknown")
      end.to raise_error(RailsHeroicon::UndefinedVariant, "Variant should be one of outline, solid")
    end
  end

  describe "#to_svg" do
    it "raise error if icon is not found" do
      icon = RailsHeroicon::RailsHeroicon.new("fooicon")

      expect { icon.to_svg }.to raise_error(RailsHeroicon::UndefinedIcon, "Couldn't find icon for fooicon")
    end

    it "sets the icon" do
      icon = RailsHeroicon::RailsHeroicon.new("user")

      expect(icon.to_svg).to match(/svg/)
    end

    it "sets the svg version" do
      icon = RailsHeroicon::RailsHeroicon.new("user")

      expect(icon.to_svg).to match(/version="1.1"/)
    end

    it "sets the html attributes passed" do
      icon = RailsHeroicon::RailsHeroicon.new("user", class: "text-red-600")

      expect(icon.to_svg).to match(/class="text-red-600"/)
    end

    it "does not have the variant attribute" do
      icon = RailsHeroicon::RailsHeroicon.new("user", variant: "outline")

      expect(icon.to_svg).not_to match(/variant="outline"/)
    end

    it "does not have the size attribute" do
      icon = RailsHeroicon::RailsHeroicon.new("user", size: 24)

      expect(icon.to_svg).not_to match(/size="24"/)
    end
  end

  describe "accessibility" do
    it "sets aria-hidden to true if aria-label is not passed" do
      icon = RailsHeroicon::RailsHeroicon.new("user")

      expect(icon.to_svg).to match(/aria-hidden="true"/)
    end

    it "sets role to img if aria-label is passed" do
      icon = RailsHeroicon::RailsHeroicon.new("user", "aria-label": "icon")

      expect(icon.to_svg).not_to match(/aria-hidden="true"/)
      expect(icon.to_svg).to match(/role="img"/)
    end
  end

  describe "sizes" do
    it "size defaults to 24 if variant is outline" do
      icon = RailsHeroicon::RailsHeroicon.new("user", variant: "outline")

      expect(icon.to_svg).to match(/viewBox="0 0 24 24"/)
      expect(icon.to_svg).to match(/height="24"/)
      expect(icon.to_svg).to match(/width="24"/)
    end

    it "size does not default to 24 if user has explicitly stated" do
      icon = RailsHeroicon::RailsHeroicon.new("user", variant: "outline", size: 20)

      expect(icon.to_svg).to match(/viewBox="0 0 20 20"/)
      expect(icon.to_svg).to match(/height="20"/)
      expect(icon.to_svg).to match(/width="20"/)
    end

    it "size defaults to 20 if variant is solid" do
      icon = RailsHeroicon::RailsHeroicon.new("user", variant: "solid")

      expect(icon.to_svg).to match(/viewBox="0 0 20 20"/)
      expect(icon.to_svg).to match(/height="20"/)
      expect(icon.to_svg).to match(/width="20"/)
    end

    it "size does not default to 20 if user has explicitly stated" do
      icon = RailsHeroicon::RailsHeroicon.new("user", variant: "solid", size: 24)

      expect(icon.to_svg).to match(/viewBox="0 0 24 24"/)
      expect(icon.to_svg).to match(/height="24"/)
      expect(icon.to_svg).to match(/width="24"/)
    end
  end
end
