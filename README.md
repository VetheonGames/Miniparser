# Miniparser

Miniparser is a Ruby gem that takes code as input (HTML, JavaScript, or CSS), determines the code language, validates it, and then minifies it. It returns whether the code is valid or not, and if valid, provides the minified code.

If you'd like to support PixelRidge Softworks OpenSource Development, check out our [Patreon](https://patreon.com/PixelRidgeSoftworksOSP)
If you need more direct help, join our [Discord](https://discord.pixelridgesoftworks.com)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'Miniparser'
```

And then execute:

```bash
$ bundle install
```

Or install it yourself as:

```bash
$ gem install Miniparser
```

## Usage

Miniparser provides two main methods to process either a file or a string containing HTML, JavaScript, or CSS code.

### Processing a File

You can process a file by calling the `type_file` method and passing the file path as an argument:

```ruby
result = Miniparser::Processor.type_file('path/to/yourfile.html')
```

### Processing a String

You can process a string containing code by calling the `type_string` method:

```ruby
result = Miniparser::Processor.type_string('<html><head></head><body></body></html>')
```

Both methods return a hash containing the validation status, any errors, and the minified code if the input was valid:

```ruby
{
  valid: true or false,
  errors: "Error message if any",
  minified_code: "Minified code if valid"
}
```

## Contributing

Bug reports and pull requests are welcome. Please adhere to the code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).


