[![Build Status](https://travis-ci.org/Kimtaro/spaces_are_ok.svg)](https://travis-ci.org/Kimtaro/spaces_are_ok) [![Code Climate](https://codeclimate.com/github/Kimtaro/spaces_are_ok/badges/gpa.svg)](https://codeclimate.com/github/Kimtaro/spaces_are_ok) [![Test Coverage](https://codeclimate.com/github/Kimtaro/spaces_are_ok/badges/coverage.svg)](https://codeclimate.com/github/Kimtaro/spaces_are_ok)

# Spaces Are Ok

Use natural language in your Ruby class and method names.

```ruby
space_class("Scorecard for a player").new("Picard").space_method("Calculate the score from a game", game)
```

or the fancier

```ruby
ç("Scorecard for a player").new("Picard").ƒ("Calculate the score from a game", game)
```

instead of

```ruby
ScorecardForPlayer.new("Picard").calculate_new_score(game)
```

or

```ruby
Scorecard.new("Picard").score(game)
```

## Why

There's been a lot of exciting development in the world of programming languages lately. Rust and Go, new versions of Ruby, Javascript, Java, and even C. Faster runtime, cooler language features and safer memory!

But they all look pretty much the same way they've always looked. `YouEhitherHaveThis` or `you_see_some_of_this`. They might even `SHOUT_AT_YOU`.

Why is it that we're not spending as much time on the human side of programming languages as we are on compiler optimisations and replacing fine words like `function` with `=>`? (Don't worry, this is a rhetorical question. Maybe.)

Naming things is famously one of the hard things in computer science, and our languages aren't doing a very good job of helping us use descriptive and fun language. This gem is an experiment in changing that.

## Installation

This gem requires Ruby 2.1 or newer.

Add this line to your application's Gemfile:

    gem 'spaces_are_ok'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install spaces_are_ok

## Usage

Unfortunately we can't use this with the regular keywords `class` and `def`, so we have to use slightly different syntax when defining and using our space friendly names. But it's not too bad.

```ruby
require 'spaces_are_ok'

space_class("Greet someone") do
  def initialize(name)
    @name = name
  end

  space_method_def "Say hello", def _
    "Hello, #{@name}"
  end
end

greeter = space_class("Greet someone").new("Kim")
greeter.space_method("Say hello") # => Hello, Kim!
```

Since it gets rather tedious to write `space_` all the time, I have included shorthand versions, so the above could be written like this:

```ruby
require 'spaces_are_ok'

ç("Greet someone") do
  def initialize(name)
    @name = name
  end

  ∂ƒ "Say hello", def _
    "Hello, #{@name}"
  end
end

greeter = ç("Greet someone").new("Kim")
greeter.ƒ("Say hello") # => Hello, Kim!
```

### Classes, Modules, Methods

TODO: List all the things this gem provides.

## But should I use it?

Probably not.

## Ideas for improvement

- I haven't been able to figure out a way of doing this for variable names. I would prefer `space_variable("Number of vowels")` over `vwl_ctr`. Wouldn't you?
- Patch Ruby so we could have this as a feature in the language. It could look something like this:

```ruby
class “Weather forecast”
  def ‘will it rain tomorrow?’
    puts "Time will tell"
  end
end

“Weather forecast”.new.‘will it rain tomorrow?’ # => Time will tell
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
