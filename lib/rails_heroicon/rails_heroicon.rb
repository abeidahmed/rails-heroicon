require_relative "errors"

module RailsHeroicon
  class RailsHeroicon
    VARIANTS = %w[outline solid].freeze

    attr_reader :options

    def initialize(icon, variant: "outline", size: nil, **options)
      raise UndefinedVariant unless VARIANTS.include?(variant.to_s)

      @icon = icon.to_s
      @variant = variant.to_s
      @options = options
      @size = icon_size_with(size)

      @options.merge!(a11y)
      @options.merge!({
        viewBox: outline? ? "0 0 24 24" : "0 0 20 20",
        height: @size,
        width: @size,
        version: "1.1",
        fill: outline? ? "none" : "currentColor",
        stroke: solid? ? "none" : "currentColor"
      })
    end

    # Finds the svg icon with respect to variant.
    def svg_path
      icon = ICONS.dig(@variant, @icon)
      raise UndefinedIcon, @icon unless icon

      icon
    end

    private

    def a11y
      accessible = {}

      if @options[:"aria-label"].nil? && @options["aria-label"].nil? && @options.dig(:aria, :label).nil?
        accessible[:"aria-hidden"] = "true"
      else
        accessible[:role] = "img"
      end

      accessible
    end

    # If the user has explicitly stated the size attribute, then use that. If size attribute is not passed
    # then default to 24 if variant is outline, else default to 20 if variant is solid.
    def icon_size_with(size)
      if outline? && size.nil?
        24
      elsif solid? && size.nil?
        20
      else
        size
      end
    end

    def outline?
      @variant == "outline"
    end

    def solid?
      @variant == "solid"
    end
  end
end
