# Contributing

Hi! We're glad you'd like to contribute to the project. Your help is essential in making this project substantial.

If you are looking to make substantial changes, please [open an issue](https://github.com/abeidahmed/rails-heroicon/issues/new)
first to discuss with us.

Please note that this project adheres to the [code of conduct](https://github.com/abeidahmed/rails-heroicon/blob/main/CODE_OF_CONDUCT.md).
By participating in this project, you agree to abide by its rules.

## Submitting a pull request

- Fork and clone the repo
- Run `bundle install` to install all the dependencies
- Make sure the tests are passing `bundle exec rake`
- Create a new branch: `git checkout -b awesome-feature`
- Add your changes, tests, and make sure the tests are passing
- Add an entry to the top of `CHANGELOG.md`
- Push to your fork and submit a pull request

## Adding new heroicons

- Copy all icons from the [`optimized`](https://github.com/tailwindlabs/heroicons/tree/master/optimized) directory in this order:
    - [`16/solid`](https://github.com/tailwindlabs/heroicons/tree/master/optimized/16/solid) -> `icons/micro`
    - [`20/solid`](https://github.com/tailwindlabs/heroicons/tree/master/optimized/20/solid) -> `icons/mini`
    - [`24/solid`](https://github.com/tailwindlabs/heroicons/tree/master/optimized/24/solid) -> `icons/solid`
    - [`24/outline`](https://github.com/tailwindlabs/heroicons/tree/master/optimized/24/solid) -> `icons/outline`
- After adding the icon(s), run `./bin/compress` (you may need to run `sudo chmod 755 ./bin/compress`)
- Update the `CHANGELOG.md`
- Submit a pull request adhering to the above mentioned guidelines
- That's it. You have made a significant contribution
