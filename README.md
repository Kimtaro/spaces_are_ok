[![Build Status](https://travis-ci.org/Kimtaro/spaces_are_ok.svg)](https://travis-ci.org/Kimtaro/spaces_are_ok) [![Code Climate](https://codeclimate.com/github/Kimtaro/spaces_are_ok/badges/gpa.svg)](https://codeclimate.com/github/Kimtaro/spaces_are_ok) [![Test Coverage](https://codeclimate.com/github/Kimtaro/spaces_are_ok/badges/coverage.svg)](https://codeclimate.com/github/Kimtaro/spaces_are_ok)

# Spaces Are Ok

Use natural language in your Ruby class and method names.

```ruby
space_class("Scorecard for a player").new("Picard").space_method("Calculate the score from a game", game)
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

Add this line to your application's Gemfile:

    gem 'spaces_are_ok'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install spaces_are_ok

## Usage

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

## But should I use it?

Probably not.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
