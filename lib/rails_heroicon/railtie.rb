require_relative "helper"

module RailsHeroicon
  class << self
    attr_accessor :cache
  end

  class Railtie < ::Rails::Railtie
    initializer "rails_heroicon.helper" do
      ActionView::Base.send :include, Helper
    end

    config.rails_heroicon_cache_store = :memory_store

    initializer "rails_heroicon.cache" do
      ::RailsHeroicon.cache = ActiveSupport::Cache.lookup_store(*config.rails_heroicon_cache_store)
    end
  end
end
