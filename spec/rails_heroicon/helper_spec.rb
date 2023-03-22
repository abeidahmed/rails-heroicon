require "nokogiri"

RSpec.describe RailsHeroicon::Helper do
  before do
    helper = Class.new do
      include RailsHeroicon::Helper
    end

    stub_const("Heroicon", helper)
  end

  describe "#heroicon" do
    context "when title is specified" do
      it "renders the title tag" do
        icon = Heroicon.new.heroicon("user", title: "My title")
        doc = Nokogiri::HTML::DocumentFragment.parse(icon)

        expect(doc.css("title").children[0].text).to eq("My title")
      end

      it "does not add the title attribute to the svg element" do
        icon = Heroicon.new.heroicon("user", title: "My title")
        doc = Nokogiri::HTML::DocumentFragment.parse(icon)

        expect(doc.css("svg")[0]["title"]).to be_blank
      end
    end

    context "when title is not specified" do
      it "does not render the title tag" do
        icon = Heroicon.new.heroicon("user")
        doc = Nokogiri::HTML::DocumentFragment.parse(icon)

        expect(doc.css("title")).to be_blank
      end
    end
  end
end
