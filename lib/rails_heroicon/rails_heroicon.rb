require "nokogiri"

module RailsHeroicon
  class RailsHeroicon
    def initialize(icon, options = {})
      @icon = icon.to_s
      @options = options
      @size = options[:size]
      @variant = options[:variant].to_s.empty? ? "outline" : options[:variant].to_s
    end

    def to_svg
      "<svg #{html_attributes}>#{svg_path}</svg>"
    end

    private

    def svg_path
      file = File.read("#{SOLID_ICON_PATH}/#{@icon}.svg")
      doc = Nokogiri::HTML::DocumentFragment.parse(file)
      doc.at_css("svg").inner_html
    end

    def html_attributes
      attrs = ""
      @options.each { |attr, value| attrs += "#{attr}=\"#{value}\" " }
      attrs.strip
    end
  end
end
