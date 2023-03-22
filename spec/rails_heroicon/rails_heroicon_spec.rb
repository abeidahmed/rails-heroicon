RSpec.describe RailsHeroicon::RailsHeroicon do
  describe "#initialize" do
    it "sets the icon name" do
      icon = described_class.new("user")

      expect(icon.instance_variable_get(:@icon)).to eq("user")
    end

    it "sets the default variant type to outline" do
      icon = described_class.new("user")

      expect(icon.instance_variable_get(:@variant)).to eq("outline")
    end

    it "sets the variant type" do
      icon = described_class.new("user", variant: :solid)

      expect(icon.instance_variable_get(:@variant)).to eq("solid")
    end

    it "sets the size" do
      icon = described_class.new("user", size: 24)

      expect(icon.instance_variable_get(:@size)).to eq(24)
    end

    it "raises if variant is undefined" do
      expect do
        described_class.new("user", variant: "unknown")
      end.to raise_error(RailsHeroicon::UndefinedVariant, "Variant should be one of outline, solid, mini")
    end
  end

  describe "#svg_path" do
    it "raise error if icon is not found" do
      icon = described_class.new("fooicon")

      expect { icon.svg_path }.to raise_error(RailsHeroicon::UndefinedIcon, "Couldn't find icon for fooicon")
    end

    it "sets the icon" do
      icon = described_class.new("user")

      expect(icon.svg_path).to match(/path/)
    end

    it "sets the svg version" do
      icon = described_class.new("user")

      expect(icon.options[:version]).to eq("1.1")
    end

    it "sets the html attributes passed" do
      icon = described_class.new("user", class: "text-red-600")

      expect(icon.options[:class]).to eq("text-red-600")
    end

    it "does not have the variant attribute" do
      icon = described_class.new("user", variant: "outline")

      expect(icon.options.key?("variant")).to eq(false)
    end

    it "does not have the size attribute" do
      icon = described_class.new("user", size: 24)

      expect(icon.options.key?("size")).to eq(false)
    end

    context "when being an outline variant" do
      it "does not have the stroke attribute" do
        icon = described_class.new("user", variant: "outline")

        expect(icon.svg_path).not_to match(/stroke=/)
      end
    end

    context "when being a solid variant" do
      it "does not have the fill attribute" do
        icon = described_class.new("user", variant: "solid")

        expect(icon.svg_path).not_to match(/fill=/)
      end
    end

    context "when being a mini variant" do
      it "does not have the fill attribute" do
        icon = described_class.new("user", variant: "mini")

        expect(icon.svg_path).not_to match(/fill=/)
      end
    end
  end

  describe "fill and stroke" do
    it "sets the stroke to currentColor and fill as none if variant is outline" do
      icon = described_class.new("user", variant: "outline")

      expect(icon.options[:stroke]).to eq("currentColor")
      expect(icon.options[:fill]).to eq("none")
    end

    it "sets the stroke to none and fill as currentColor if variant is solid" do
      icon = described_class.new("user", variant: "solid")

      expect(icon.options[:stroke]).to eq("none")
      expect(icon.options[:fill]).to eq("currentColor")
    end

    it "sets the stroke to none and fill as currentColor if variant is mini" do
      icon = described_class.new("user", variant: "mini")

      expect(icon.options[:stroke]).to eq("none")
      expect(icon.options[:fill]).to eq("currentColor")
    end
  end

  describe "accessibility" do
    it "sets aria-hidden to true if aria-label is not passed" do
      icon = described_class.new("user")

      expect(icon.options[:"aria-hidden"]).to eq("true")
    end

    it "sets role to img if aria-label is passed" do
      icon = described_class.new("user", "aria-label": "icon")

      expect(icon.options.key?("aria-hidden")).to eq(false)
      expect(icon.options[:role]).to eq("img")

      another_icon = described_class.new("user", aria: {label: "icon"})

      expect(another_icon.options.key?("aria-hidden")).to eq(false)
      expect(another_icon.options[:role]).to eq("img")
    end

    it "sets xmlns attribute" do
      icon = described_class.new("user")

      expect(icon.options[:xmlns]).to eq("http://www.w3.org/2000/svg")
    end
  end

  describe "viewBox" do
    it "sets the viewBox to 24 if variant is outline" do
      icon = described_class.new("user", variant: "outline")

      expect(icon.options[:viewBox]).to eq("0 0 24 24")
    end

    it "sets the viewBox to 24 if variant is solid" do
      icon = described_class.new("user", variant: "solid")

      expect(icon.options[:viewBox]).to eq("0 0 24 24")
    end

    it "sets the viewBox to 20 if variant is mini" do
      icon = described_class.new("user", variant: "mini")

      expect(icon.options[:viewBox]).to eq("0 0 20 20")
    end
  end

  describe "sizes" do
    context "when variant is outline" do
      it "size defaults to 24 if variant is outline" do
        icon = described_class.new("user", variant: "outline")

        expect(icon.options[:height]).to eq(24)
        expect(icon.options[:width]).to eq(24)
      end

      it "size does not default to 24 if user has explicitly stated" do
        icon = described_class.new("user", variant: "outline", size: 32)

        expect(icon.options[:height]).to eq(32)
        expect(icon.options[:width]).to eq(32)
      end
    end

    context "when variant is solid" do
      it "size defaults to 24 if variant is solid" do
        icon = described_class.new("user", variant: "solid")

        expect(icon.options[:height]).to eq(24)
        expect(icon.options[:width]).to eq(24)
      end

      it "size does not default to 24 if user has explicitly stated" do
        icon = described_class.new("user", variant: "solid", size: 32)

        expect(icon.options[:height]).to eq(32)
        expect(icon.options[:width]).to eq(32)
      end
    end

    context "when variant is mini" do
      it "size defaults to 20 if variant is mini" do
        icon = described_class.new("user", variant: "mini")

        expect(icon.options[:height]).to eq(20)
        expect(icon.options[:width]).to eq(20)
      end

      it "size does not default to 20 if user has explicitly stated" do
        icon = described_class.new("user", variant: "mini", size: 32)

        expect(icon.options[:height]).to eq(32)
        expect(icon.options[:width]).to eq(32)
      end
    end
  end

  describe "stroke-width" do
    context "when variant is outline" do
      it "sets it to 1.5" do
        icon = described_class.new("user", variant: "outline")

        expect(icon.options[:"stroke-width"]).to eq(1.5)
      end

      it "can be customized" do
        icon = described_class.new("user", variant: "outline", "stroke-width": 2)

        expect(icon.options[:"stroke-width"]).to eq(2)
      end
    end

    context "when variant is solid" do
      it "does not set the stroke width" do
        icon = described_class.new("user", variant: "solid")

        expect(icon.options[:"stroke-width"]).to be_nil
      end

      it "cannot be customized" do
        icon = described_class.new("user", variant: "solid", "stroke-width": 2)

        expect(icon.options[:"stroke-width"]).to be_nil
      end
    end

    context "when variant is mini" do
      it "does not set the stroke width" do
        icon = described_class.new("user", variant: "mini")

        expect(icon.options[:"stroke-width"]).to be_nil
      end

      it "cannot be customized" do
        icon = described_class.new("user", variant: "mini", "stroke-width": 2)

        expect(icon.options[:"stroke-width"]).to be_nil
      end
    end
  end
end
