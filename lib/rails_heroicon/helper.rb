require "action_view"

module RailsHeroicon
  module RailsHeroiconHelper
    def heroicon(symbol, **options)
      icon = RailsHeroicon.new(symbol, **options)
      content_tag(:svg, icon.svg_path.html_safe, icon.options)
    end
  end
end
