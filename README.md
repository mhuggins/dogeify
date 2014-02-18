# Dogeify

Convert English to [Doge](http://en.wikipedia.org/wiki/Doge_(meme))!

Please note that this gem is using an extremely simple language natural
processor, so parsing is not perfect, but it works.

## Installation

Add this line to your application's Gemfile:

    gem 'dogeify'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install dogeify

## Usage

There are several ways of using Dogeify.  The first way is to go through the
`Dogeify` class itself.

    require 'dogeify'

    dogifier = Dogify.new
    dogifier.process('My grandmom gave me a sweater for Christmas.')
    # => "so grandmom. such sweater. very christmas. wow."

The second way is to modify the String or Array classes by including either
core extension.

    require 'dogeify/core_ext/array'   # extends only Array
    require 'dogeify/core_ext/string'  # extends only String
    require 'dogeify/core_ext'         # extends both Array/String

    'My grandmom gave me a sweater for Christmas.'.dogify
    # => "so grandmom. such sweater. very christmas. wow."

    ['I like turtles.', 'It is during our darkest moments that we must focus to see the light.'].dogify
    # => ["so turtles. wow.", "so darkest. such moments. very light. wow."]

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
