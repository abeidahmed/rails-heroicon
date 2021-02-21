module RailsHeroicon
  module RailsHeroiconHelper
    def heroicon(icon, **options)
      RailsHeroicon.new(icon, **options).to_svg
    end
  end
end
