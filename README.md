# Jekyll Schedule Generator Plugin

*Jekyll plugin to generate a schedule.txt for all future posts in your Jekyll site.*

[![Build Status](https://travis-ci.org/CloudCannon/jekyll-cloudcannon-schedule.svg?branch=master)](https://travis-ci.org/CloudCannon/jekyll-cloudcannon-schedule)

## Usage

1. Add `gem 'jekyll-cloudcannon-schedule'` to your site's Gemfile and run `bundle`
2. Add the following to your site's `_config.yml`:

```yml
url: "http://example.com" # the base hostname & protocol for your site
plugins:
  - jekyll-cloudcannon-schedule
```

💡 If you are using a Jekyll version less than 3.5.0, use the `gems` key instead of `plugins`.

## Override default development settings

[Follow these instructions on Jekyll's documentation](https://jekyllrb.com/docs/usage/#override-default-development-settings).

## Developing locally

* Use `script/bootstrap` to bootstrap your local development environment.
* Use `script/console` to load a local IRB console with the Gem.

## Testing

1. `script/bootstrap`
2. `script/cibuild`

## Contributing

1. Fork the project
2. Create a descriptively named feature branch
3. Add your feature
4. Submit a pull request
