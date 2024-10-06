require_relative "helper"

module RailsHeroicon
  class Railtie < ::Rails::Railtie
    initializer "rails_heroicon.helper" do
      ActionView::Base.send :include, Helper
    end

    config.rails_heroicon_cache_store = :memory_store

    initializer "rails_heroicon.cache" do
      store = config.rails_heroicon_cache_store
      ::RailsHeroicon.cache = ActiveSupport::Cache.lookup_store(*store)
    end
  end
end
