require "test_helper"
require "rails_heroicon/helper"

module RailsHeroicon
  class HelperTest < Minitest::Test
    include ::RailsHeroicon::Helper

    def test_attributes
      icon = heroicon("user", class: "text-red-600", data: {foo: "bar"})
      doc = Nokogiri::HTML::DocumentFragment.parse(icon)
      attr = doc.css("svg").first

      assert_equal "text-red-600", attr[:class]
      assert_equal "bar", attr[:"data-foo"]
    end

    def test_renders_title
      icon = heroicon("user", title: "My title")
      doc = Nokogiri::HTML::DocumentFragment.parse(icon)

      assert_equal "My title", doc.css("title").children.first.text # `<title></title>` tag should be present
      assert doc.css("svg").first["title"].blank? # `title` attribute should not be present
    end

    def test_does_not_render_title
      icon = heroicon("user")
      doc = Nokogiri::HTML::DocumentFragment.parse(icon)

      assert doc.css("title").blank?
    end
  end
end
