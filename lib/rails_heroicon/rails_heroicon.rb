require "nokogiri"
require_relative "errors"

module RailsHeroicon
  class RailsHeroicon
    VARIANTS = %w[outline solid].freeze

    def initialize(icon, variant: "outline", size: nil, data: nil, **options)
      raise UndefinedVariant unless VARIANTS.include?(variant.to_s)

      @icon = icon.to_s
      @variant = variant.to_s
      @options = options
      @size = icon_size_with(size)
      @data = data

      @options.merge!(a11y)
      @options.merge!({
        viewBox: view_box,
        height: @size,
        width: @size,
        version: "1.1"
      })
    end

    def to_svg
      "<svg #{html_attributes}>#{svg_path}</svg>"
    end

    private

    def svg_path
      file_path = if @variant == "solid"
                    "#{SOLID_ICON_PATH}/#{@icon}.svg"
                  else
                    "#{OUTLINE_ICON_PATH}/#{@icon}.svg"
                  end

      raise UndefinedIcon, @icon unless File.exist?(file_path)

      file = File.read(file_path)
      doc = Nokogiri::HTML::DocumentFragment.parse(file)
      doc.at_css("svg").inner_html
    end

    def html_attributes
      attrs = ""
      @options.each { |attr, value| attrs += "#{attr}=\"#{value}\" " }
      attrs.strip
    end

    def a11y
      accessible = {}

      if @options[:"aria-label"].nil? && @options["aria-label"].nil?
        accessible[:"aria-hidden"] = "true"
      else
        accessible[:role] = "img"
      end

      accessible
    end

    def view_box
      "0 0 #{@size} #{@size}"
    end

    def icon_size_with(size)
      if size
        size
      elsif @variant == "outline" && size.nil?
        24
      elsif @variant == "solid" && size.nil?
        20
      end
    end
  end
end
