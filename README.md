# Pointp.in

[Pointp.in](https://pointp.in) API wrapper in Ruby.

## Installation

`gem install pointpin`

or in your `Gemfile`

```ruby
gem 'pointpin'
```

## Usage

Make sure you require the library.

```ruby
require 'pointpin'
```

You will need to set your API key before you can make requests to the [Pointp.in](https://pointp.in) API.

```ruby
Pointpin.api_key = 'this-is-your-api-key'
```

You can then make requests to the `Pointpin.locate(ip_address)` method.

Get location data for an IP address:

```ruby
location = Pointpin.locate('55.111.555.555')
```

Please refer to the [pointp.in docs](https://pointp.in/docs/get-started) for more information on the full response properties.

The gem uses [Faraday](https://github.com/lostisland/faraday) for HTTP requests. It uses `Net::HTTP` by default, but changing the adapter is pretty straightforward.

## Copyright

Copyright (c) 2014 Brian Flanagan. See LICENSE.txt for further details.