# Dogeify

[![Build Status](https://secure.travis-ci.org/mhuggins/dogeify.png)](http://travis-ci.org/mhuggins/dogeify)
[![Code Climate](https://codeclimate.com/github/mhuggins/dogeify.png)](https://codeclimate.com/github/mhuggins/dogeify)

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

    dogeifier = Dogeify.new
    dogeifier.process('My grandmom gave me a sweater for Christmas.')
    # => "so grandmom. such sweater. very christmas. wow."

The second way is to modify the String or Array classes by including either
core extension.

    require 'dogeify/core_ext/array'   # extends only Array
    require 'dogeify/core_ext/string'  # extends only String
    require 'dogeify/core_ext'         # extends both Array/String

    'My grandmom gave me a sweater for Christmas.'.dogeify
    # => "so grandmom. such sweater. very christmas. wow."

    ['I like turtles.', 'It is during our darkest moments that we must focus to see the light.'].dogeify
    # => ["so turtles. wow.", "so darkest. such moments. very light. wow."]

Lastly, the `Dogeify` class along with all core extensions can be loaded via
a single require.

    require 'dogeify/all'

### Options

For each of the above method calls, an optional `options` hash can be passed in
to specify additional processing preferences.  Currently, only the `ignore`
option exists, accepting a string/regex value (or array of string/regex values)
that should not be converted to doge.

    dogifier.process('My grandmom gave me a sweater for Christmas.', ignore: 'grandmom')
    # => "so sweater. such christmas. wow."

    'My grandmom gave me a sweater for Christmas'.dogeify(ignore: [/christmas/i, 'sweater'])
    # => "so grandmom. wow."

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
