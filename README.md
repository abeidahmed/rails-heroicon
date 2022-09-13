# Rails Heroicon ![ci](https://github.com/abeidahmed/rails-heroicon/actions/workflows/ci.yml/badge.svg)

Ruby on Rails views helper for the awesome heroicons by Steve Schoger. To see
all the icons visit [heroicons](https://heroicons.com/).

292 icons included as of today.

> This gem has no official affiliation with [Tailwind Labs](https://github.com/tailwindlabs),
> yet.

## Installation

Add this line to your application's Gemfile:

```ruby
gem "rails_heroicon"
```

And then execute:

```bash
bundle install
```

Or install it yourself as:

```bash
gem install rails_heroicon
```

## Usage

After installing the gem, call `<%= heroicon "user" %>` on your `erb` template.
The first argument is the icon name. All the icons are listed [here](https://heroicons.com/).

This will generate the following html:

```html
<svg
  aria-hidden="true"
  width="24"
  height="24"
  viewBox="0 0 24 24"
  fill="none"
  stroke="currentColor"
  stroke-width="1.5"
  version="1.1"
>
  <path
    d="M16 7C16 9.20914 14.2091 11 12 11C9.79086 11 8 9.20914 8 7C8 4.79086 9.79086 3 12 3C14.2091 3 16 4.79086 16 7Z"
    stroke-width="2"
    stroke-linecap="round"
    stroke-linejoin="round"
  />
  <path
    d="M12 14C8.13401 14 5 17.134 5 21H19C19 17.134 15.866 14 12 14Z"
    stroke-width="2"
    stroke-linecap="round"
    stroke-linejoin="round"
  />
</svg>
```

> Note: Indentation is for readibility purpose.

### Variant

`rails_heroicon` provides 3 variants, `outline`, `solid`, and `mini`, `outline` being
the default.

To change the variant `<%= heroicon "user", variant: "solid" %>`.

### HTML attributes

Any `html` and `eruby` attribute is supported, for eg:

```erb
<%= heroicon "user", class: "text-gray-500", aria: { label: "user-icon" } %>
```

### Handling the size of the icon

Normally, if you're just using vanilla heroicons with [Tailwind CSS](https://tailwindcss.com/),
you'd add `w-5 h-5` as classes on the svg element. With `rails_heroicon`, you just
need to set the `size` attribute on the helper method.

```erb
<%= heroicon "user", size: 20 %>
```

If the `variant` is set as `outline` or `solid`, `size` automatically defaults to `24`,
and if the `variant` is set as `mini`, `size` automatically defaults to `20`.
However, this can be over-written with the `size` attribute.

### Accessibility

`rails_heroicon` automatically sets `aria-hidden="true"` if `aria-label` is not
set, and if `aria-label` is set, then `role="img"` is set.

### Tooltip

You can provide tooltips on hover if you pass in a `title` option. Anything
passed into the `title` option will be rendered inside of a
`<title>` tag within the rendered SVG, which modern browsers will lean on to
display a tooltip on hover.

## Development

- Clone the repo
- Run `bundle install`, or run `./bin/setup`
- Run `bundle exec rake` to run the tests to see if it passing

## Contributing

Bug reports and pull requests are welcome. This project is intended to be a
safe, welcoming space for collaboration, and contributors are expected to adhere
to the [code of conduct](https://github.com/abeidahmed/rails-heroicon/blob/main/CODE_OF_CONDUCT.md).

Please read the [CONTRIBUTING.md](https://github.com/abeidahmed/rails-heroicon/blob/main/CONTRIBUTING.md)
on how to make pull requests.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Rails Heroicon project's codebases, issue trackers,
chat rooms and mailing lists is expected to follow the
[code of conduct](https://github.com/abeidahmed/rails-heroicon/blob/main/CODE_OF_CONDUCT.md).

## Similar projects

- [rails_feather](https://github.com/abeidahmed/rails_feather) - Ruby on Rails
  views helper method for rendering beautiful feather icons.
