require "test_helper"

module RailsHeroicon
  class RailsHeroiconTest < Minitest::Test
    def test_raises_if_variant_is_invalid
      assert_raises UndefinedVariant do
        icon(variant: "invalid")
      end
    end

    def test_raises_if_icon_is_invalid
      assert_raises UndefinedIcon do
        icon(name: "invalid-icon").svg_path
      end
    end

    def test_returns_icon
      assert icon.svg_path.match?(/path/)
    end

    def test_svg_version
      assert_equal "1.1", icon.options[:version]
    end

    def test_html_attributes
      assert_equal "text-red-500", icon(class: "text-red-500").options[:class]
      assert_equal "bar", icon(data: {foo: "bar"}).options.dig(:data, :foo)
    end

    def test_sets_aria_hidden_attribute
      assert "true", icon.options[:"aria-hidden"]
    end

    def test_sets_role_as_img
      icon1 = icon("aria-label": "icon")
      refute icon1.options.key?(:"aria-hidden")
      assert_equal "img", icon1.options[:role]

      icon2 = icon(aria: {label: "icon"})
      refute icon2.options.key?(:"aria-hidden")
      assert_equal "img", icon2.options[:role]
    end

    def test_sets_xmlns_attrbute
      assert_equal "http://www.w3.org/2000/svg", icon.options[:xmlns]
    end

    def test_does_not_set_the_variant_attribute
      refute icon(variant: "solid").options.key?(:variant)
    end

    def test_does_not_set_the_size_attribute
      refute icon(size: 24).options.key?(:size)
    end

    def test_outline_icon_does_not_have_stroke_attribute
      refute icon(variant: :outline).svg_path.match?(/stroke=/)
    end

    def test_solid_icon_does_not_have_fill_attribute
      refute icon(variant: :solid).svg_path.match?(/fill=/)
      refute icon(variant: :mini).svg_path.match?(/fill=/)
      refute icon(variant: :micro).svg_path.match?(/fill=/)
    end

    def test_outline_icon_stroke_and_fill
      assert_equal "currentColor", icon(variant: :outline).options[:stroke]
      assert_equal "none", icon(variant: :outline).options[:fill]
    end

    def test_solid_icon_stroke_and_fill
      assert_equal "none", icon(variant: :solid).options[:stroke]
      assert_equal "currentColor", icon(variant: :solid).options[:fill]

      assert_equal "none", icon(variant: :mini).options[:stroke]
      assert_equal "currentColor", icon(variant: :mini).options[:fill]

      assert_equal "none", icon(variant: :micro).options[:stroke]
      assert_equal "currentColor", icon(variant: :micro).options[:fill]
    end

    def test_view_box
      assert_equal "0 0 24 24", icon(variant: :outline).options[:viewBox]
      assert_equal "0 0 24 24", icon(variant: :solid).options[:viewBox]
      assert_equal "0 0 20 20", icon(variant: :mini).options[:viewBox]
      assert_equal "0 0 16 16", icon(variant: :micro).options[:viewBox]
    end

    def test_size
      outline_icon = icon(variant: :outline)
      assert_equal 24, outline_icon.options[:height]
      assert_equal 24, outline_icon.options[:width]

      solid_icon = icon(variant: :solid)
      assert_equal 24, solid_icon.options[:height]
      assert_equal 24, solid_icon.options[:width]

      mini_icon = icon(variant: :mini)
      assert_equal 20, mini_icon.options[:height]
      assert_equal 20, mini_icon.options[:width]

      micro_icon = icon(variant: :micro)
      assert_equal 16, micro_icon.options[:height]
      assert_equal 16, micro_icon.options[:width]
    end

    def test_size_can_be_changed
      assert_equal 48, icon(size: 48).options[:height]
      assert_equal 48, icon(size: 48).options[:width]
    end

    def test_outline_icon_stroke_width
      assert_equal 1.5, icon(variant: :outline).options[:"stroke-width"]
      assert_equal 2, icon(variant: :outline, "stroke-width": 2).options[:"stroke-width"]
    end

    def test_solid_icon_stroke_width
      assert_nil icon(variant: :solid).options[:"stroke-width"]
      assert_nil icon(variant: :solid, "stroke-width": 2).options[:"stroke-width"]

      assert_nil icon(variant: :mini).options[:"stroke-width"]
      assert_nil icon(variant: :mini, "stroke-width": 2).options[:"stroke-width"]

      assert_nil icon(variant: :micro).options[:"stroke-width"]
      assert_nil icon(variant: :micro, "stroke-width": 2).options[:"stroke-width"]
    end

    private

    def icon(name: "user", **)
      RailsHeroicon.new(name, **)
    end
  end
end
