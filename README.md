[![Build Status](https://travis-ci.org/Kimtaro/spaces_are_ok.svg)](https://travis-ci.org/Kimtaro/spaces_are_ok) [![Code Climate](https://codeclimate.com/github/Kimtaro/spaces_are_ok/badges/gpa.svg)](https://codeclimate.com/github/Kimtaro/spaces_are_ok) [![Test Coverage](https://codeclimate.com/github/Kimtaro/spaces_are_ok/badges/coverage.svg)](https://codeclimate.com/github/Kimtaro/spaces_are_ok)

# Spaces Are Ok

Use natural language in your Ruby class and method names.

Like this

```ruby
space_class("Scorecard for a player").new("Picard").space_method("Calculate the score from a game", game)
```

or the shorter and fancier

```ruby
ç("Scorecard for a player").new("Picard").ƒ("Calculate the score from a game", game)
```

instead of the mechanical and boring

```ruby
ScorecardForPlayer.new("Picard").calculate_new_score(game)
```

or the not very informative

```ruby
Scorecard.new("Picard").score(game)
```

## Why

There is always a lot of exciting development going on in the world of programming. New languages like Rust and Go, new versions of existing ones like Ruby, Javascript, and even C. Faster runtimes, cool language features and safer memory!

But they all look the same way they've always looked. `YouEhitherHaveThis` or `you_see_some_of_this`. They might even `SHOUT_AT_YOU`.

Why do we not spend as much time making programming languages look like something humans read as we spend on compiler optimisations and replacing fine words like `function` with uninformative symbols like `=>`?

Naming things is famously one of the hard things in computer science, and our languages aren't doing a very good job of helping us use descriptive and fun language. This gem is an experiment in fixing that.

## Installation

This gem requires Ruby 2.1 or newer.

Add this line to your application's Gemfile:

    gem 'spaces_are_ok'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install spaces_are_ok

## Usage

Ruby doesn't allow method calls with the keywords `class` and `def`, so we have to use slightly different syntax when defining and using our space friendly names. But it's not too bad.

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

Since it gets rather tedious to write `space_` all the time, I have included shorthand versions, so the above can be written like this:

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

### Summary of functionality

Function | Plain Ruby | Spaces Are Ok | Spaces Are Ok shorthand

#### Defining a class

##### Plain Ruby

```ruby
class LaunchSpaceShip
  # Class definition
end
```

##### Spaces Are Ok

```ruby
space_class("Launch space ship") do
  # Class definition
end
```

##### Spaces Are Ok shorthand

```ruby
ç("Launch space ship") do
  # Class definition
end
```

#### Using a class

##### Plain Ruby

```ruby
LaunchSpaceShip.new
```

##### Spaces Are Ok

```ruby
space_class("Launch space ship").new
```

##### Spaces Are Ok shorthand

```ruby
ç("Launch space ship").new
```

#### Defining a module

#####Plain Ruby

```ruby
module SpaceShipMotor
  # Module definition
end
```

##### Spaces Are Ok

```ruby
space_module("Space ship motor") do
  # Module definition
end
```

##### Spaces Are Ok shorthand

```ruby
ɱ("Space ship motor") do
  # Module definition
end
```

#### Using a module

##### Plain Ruby

```ruby
include SpaceShipMotor
```

##### Spaces Are Ok

```ruby
include space_module("Space ship motor")
```

##### Spaces Are Ok shorthand

```ruby
include ɱ("Space ship motor")
```

#### Defining a method

##### Plain Ruby

```ruby
def travel_to_a_planet(planet)
  # Method body
end
```

##### Spaces Are Ok

```ruby
space_method_def("Travel to a planet"), def _(planet)
  # Method body
end
```

##### Spaces Are Ok shorthand

```ruby
∂ƒ("Travel to a planet"), def_(planet)
  # Method body
end
```

#### Calling a method

##### Plain Ruby

```ruby
travel_to_a_planet(planet)
```

##### Spaces Are Ok

```ruby
space_method("Travel to a planet", planet)
```

##### Spaces Are Ok shorthand

```ruby
ƒ("Travel to a planet", planet)
```

### You don't have to care about spelling

If you're the adventurous type and don't want to worry about speling everything correctly all the time, then you don't have have to. Just turn on the `dont_worry_about_spelling`-mode.

```ruby
require 'spaces_are_ok/dont_worry_about_spelling'

space_class("Greet someone") do
  def initialize(name)
    @name = name
  end

  space_method_def "Say hello", def _
    "Hello, #{@name}"
  end
end

greeter = space_class("Greeet someone").new("Kim")
greeter.space_method("Say jello") # => Hello, Kim!
```

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
