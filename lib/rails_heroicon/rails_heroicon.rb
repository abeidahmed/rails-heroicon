require "nokogiri"

module RailsHeroicon
  class RailsHeroicon
    def initialize(icon, variant: "outline", size: 24, **options)
      @icon = icon.to_s
      @variant = variant.to_s
      @options = options
      @size = size

      @options.merge!(a11y)
      @options.merge!({
        viewBox: view_box,
        height: @size,
        width: @size
      })
    end

    def to_svg
      "<svg #{html_attributes}>#{svg_path}</svg>"
    end

    private

    def svg_path
      file = if @variant == "solid"
               File.read("#{SOLID_ICON_PATH}/#{@icon}.svg")
             else
               File.read("#{OUTLINE_ICON_PATH}/#{@icon}.svg")
             end

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
  end
end
