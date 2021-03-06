# Dev Tools

It's boring to add common development gems to our projects' Gemfile so we decided to
create this gem to include all of our favourite development tools
ready to use, the tools in this repo are:

* [**Pry**][pry] for a powerful shell alternative to IRB.
* [**Pry Rails**][pry-rails] for additional commands (`show-routes`,
  `show-models`, `show-middleware`) in the Rails console.
* [**Pry ByeBug**][pry-byebug] to turn the console into a simple debugger.
* [**Awesome Print**][awesome_print] for stylish pretty print.
* [**Pry Doc**][pry-doc] to browse Ruby source, including C, directly from the
  console.
* [**Letter Opener**][letter_opener] for preview email in the browser.
* [**Invoker**][invoker] for managing processes in development environment.
* [**Rubocop**][rubocop] for static code analyzer.
* [**Dotenv**][dotenv] for managing environment variables.

It also [configures Letter Opener][letter_opener_conf] in development environment.

## Usage

Add to your project Gemfile:

```ruby
group :development, :test do
  gem 'dev_tools', github: 'nebulab/dev_tools'
end
```

And then execute:

```
  $ bundle
```

## Contributing

1. Fork it ( https://github.com/nebulab/dev_tools/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

[pry]:                http://pry.github.com
[awesome_print]:      https://github.com/michaeldv/awesome_print
[pry-rails]:          https://github.com/rweng/pry-rails
[pry-doc]:            https://github.com/pry/pry-doc
[pry-byebug]:         https://github.com/deivid-rodriguez/pry-byebug
[letter_opener]:      https://github.com/ryanb/letter_opener
[rubocop]:            https://github.com/bbatsov/rubocop
[letter_opener_conf]: https://github.com/nebulab/dev_tools/blob/master/lib/dev_tools/railtie.rb#L20
[invoker]:            https://github.com/code-mancers/invoker
[dotenv]:             https://github.com/bkeepers/dotenv
