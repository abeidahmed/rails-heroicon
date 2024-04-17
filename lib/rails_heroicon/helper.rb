require "action_view"

module RailsHeroicon
  module Helper
    include ActionView::Helpers::TagHelper

    # To add a heroicon, call <tt><%= heroicon "icon_name" %></tt> on your erb template.
    # Head over to https://heroicons.com to view all the icons.
    #
    # == Options
    # The helper method accepts mutiple arguments such as:
    #
    # === Variant
    # There are 4 types of variants: 'outline', 'solid', 'mini', and 'micro', the default being the 'outline'.
    # To specify the solid variant, call <tt><%= heroicon "icon_name", variant: "solid" %></tt>
    #
    # === HTML attributes
    # Any <tt>html</tt> attribute is supported, for eg:
    #
    # <tt><%= heroicon "icon_name", class: "text-gray-500", data: { controller: "icon" } %></tt>
    #
    # === Handling the icon size
    # Normally, if you're just using vanilla heroicons with tailwindcss, you'd set <tt>w-5 h-5</tt> as class attributes
    # on the svg. With this helper, you just need to set the <tt>size</tt> attribute on the icon.
    #
    # <tt><%= heroicon "icon_name", size: 20 %></tt>
    #
    # This will set the <tt>height</tt> and <tt>width</tt> attribute on the svg.
    #
    # If the variant is set as <tt>outline</tt> or <tt>solid</tt>, <tt>size</tt> defaults to 24, if the variant is set
    # as <tt>mini</tt>, <tt>size</tt> defaults to 20, and if the variant is set as <tt>micro<tt>, <tt>size</tt>
    # defaults to 16.
    # However, this can be over-written with the <tt>size</tt> attribute.
    #
    # == Accessibility
    # The helper method automatically sets <tt>aria-hidden=true</tt> if <tt>aria-label</tt> is not set, and
    # if <tt>aria-label</tt> is set, then <tt>role=img</tt> is set automatically.
    def heroicon(symbol, title: nil, **options)
      cache_key = [symbol, title, options]

      ::RailsHeroicon.cache.fetch(cache_key) do
        icon = RailsHeroicon.new(symbol, **options)
        title_tag = content_tag(:title, title) if title
        content_tag(:svg, title_tag.to_s.html_safe + icon.svg_path.html_safe, icon.options)
      end
    end
  end
end
