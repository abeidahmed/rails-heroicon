RSpec.describe RailsHeroicon::DataAttributes do
  include described_class

  describe "#data_attributes" do
    it "concates all the attributes into a hash that are already present" do
      attributes = { controller: "details", action: "action" }

      new_attributes = data_attributes(
        attributes: attributes,
        controller: "confirmable",
      )

      expect(new_attributes).to eq({ controller: "details confirmable", action: "action" })
    end

    it "concates all the attributes that are not present" do
      attributes = { controller: "details", action: "action" }

      new_attributes = data_attributes(
        attributes: attributes,
        make_it: "hello",
        dynamic: "yes",
      )

      expect(new_attributes).to eq({ controller: "details", action: "action", make_it: "hello", dynamic: "yes" })
    end

    it "concates attributes if initial attributes is nil" do
      new_attributes = data_attributes(
        attributes: nil,
        make_it: "hello",
        dynamic: "yes",
      )

      expect(new_attributes).to eq({ make_it: "hello", dynamic: "yes" })
    end
  end
end
