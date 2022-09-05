require_relative "errors"

module RailsHeroicon
  class RailsHeroicon
    VARIANTS = %w[outline solid mini].freeze

    attr_reader :options

    def initialize(icon, variant: "outline", size: nil, **options)
      raise UndefinedVariant unless VARIANTS.include?(variant.to_s)

      @icon = icon.to_s
      @variant = variant.to_s
      @options = options.dup
      @size = icon_size_with(size)
      @options.merge!(svg_properties)
    end

    # Finds the svg icon with respect to variant.
    def svg_path
      icon = ICONS.dig(@variant, @icon)
      raise UndefinedIcon, @icon unless icon

      icon
    end

    private

    def svg_properties
      properties = {}

      properties[:viewBox] = mini? ? "0 0 20 20" : "0 0 24 24"
      properties[:height] = @size
      properties[:width] = @size
      properties[:version] = "1.1"
      properties[:fill] = outline? ? "none" : "currentColor"
      properties[:stroke] = outline? ? "currentColor" : "none"
      properties[:"stroke-width"] = "1.5" if outline?

      if options[:"aria-label"].nil? && options["aria-label"].nil? && options.dig(:aria, :label).nil?
        properties[:"aria-hidden"] = "true"
      else
        properties[:role] = "img"
      end

      properties
    end

    # If the user has explicitly stated the size attribute, then use that. If size attribute is not passed
    # then default to 24 if variant is outline or solid, else default to 20 if variant is mini.
    def icon_size_with(size)
      return size if size
      return 20 if mini?

      24
    end

    def outline?
      @variant == "outline"
    end

    def solid?
      @variant == "solid"
    end

    def mini?
      @variant == "mini"
    end
  end
end
