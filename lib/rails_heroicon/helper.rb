require "action_view"

module RailsHeroicon
  module Helper
    # To add a heroicon, call <tt><%= heroicon "icon_name" %></tt> on your erb template.
    # Head over to https://heroicons.com/ to view all the icons.
    #
    # == Options
    # The helper method accepts mutiple arguments such as:
    #
    # === Variant
    # There are two types of variants: 'outline' and 'solid', the default being the 'outline'.
    # To specify the solid variant, call <tt><%= heroicon "icon_name", variant: :solid %></tt>
    #
    # === Accessibility
    # The helper method automatically sets <tt>aria-hidden=true</tt> if <tt>aria-label</tt> is not set, and
    # if <tt>aria-label</tt> is set, then <tt>role=img</tt> is set automatically.
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
    # If the variant is set as <tt>outline</tt>, size automatically defaults to 24, and if the variant is set as
    # <tt>solid</tt>, size automatically defaults to 20. However, this can be over-written with the <tt>size</tt>
    # attribute.
    def heroicon(symbol, **options)
      icon = RailsHeroicon.new(symbol, **options)
      content_tag(:svg, icon.svg_path.html_safe, icon.options)
    end
  end
end
