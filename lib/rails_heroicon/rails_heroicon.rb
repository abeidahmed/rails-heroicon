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
      "<svg #{html_attributes}>#{find_svg}</svg>"
    end

    private

    def find_svg
      file = File.read("#{SOLID_ICON_PATH}/#{@icon}.svg")
      doc = Nokogiri::HTML::DocumentFragment.parse(file)
      svg = doc.at_css("path")
      svg.to_html
    end

    def html_attributes
      attrs = ""
      @options.each { |attr, value| attrs += "#{attr}=\"#{value}\" " }
      attrs.strip
    end
  end
end
