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

        expect(icon).to match(/<title>My title<\/title>/)
      end
    end

    context "when title is not specified" do
      it "does not render the title tag" do
        icon = Heroicon.new.heroicon("user")

        expect(icon).not_to match(/<title>/)
      end
    end
  end
end
