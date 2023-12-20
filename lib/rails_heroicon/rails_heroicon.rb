require_relative "errors"

module RailsHeroicon
  class RailsHeroicon
    VARIANTS = %w[outline solid mini micro].freeze

    attr_reader :options

    def initialize(icon, variant: "outline", size: nil, **options)
      raise UndefinedVariant unless VARIANTS.include?(variant.to_s)

      @icon = icon.to_s
      @variant = variant.to_s
      @options = options.dup
      @size = default_or_defined_size(size)
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

      properties[:xmlns] = "http://www.w3.org/2000/svg"
      properties[:viewBox] = view_box
      properties[:height] = @size
      properties[:width] = @size
      properties[:version] = "1.1"
      properties[:fill] = outline? ? "none" : "currentColor"
      properties[:stroke] = outline? ? "currentColor" : "none"
      properties[:"stroke-width"] = stroke_width

      if options[:"aria-label"].nil? && options["aria-label"].nil? && options.dig(:aria, :label).nil?
        properties[:"aria-hidden"] = "true"
      else
        properties[:role] = "img"
      end

      properties
    end

    # If the user has explicitly stated the size attribute, then use that. If size attribute is not passed
    # then default to 24 if variant is outline or solid, else default to 20 if variant is mini, else default to 16 if
    # variant is micro.
    def default_or_defined_size(size)
      return size if size
      return 16 if micro?
      return 20 if mini?

      24
    end

    def stroke_width
      return unless outline?
      @options[:"stroke-width"] || 1.5
    end

    def view_box
      return "0 0 20 20" if mini?
      return "0 0 16 16" if micro?
      "0 0 24 24"
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

    def micro?
      @variant == "micro"
    end
  end
end
