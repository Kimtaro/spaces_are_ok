require "codeclimate-test-reporter"
CodeClimate::TestReporter.start

$: << File.expand_path('../lib', __FILE__)
require 'maxitest/autorun'
require 'spaces_are_ok'

space_class("Greet the world") do
  def initialize(name)
    @name = name
  end

  def hi
    greet("Hi")
  end

  space_method_def "say good bye", def _
    "Good bye, #{@name}"
  end

  space_method_def "say good afternoon", def _
    "Good afternoon, #{@name}"
  end

  private

  def greet(greeting)
    "#{greeting}, #{@name}!"
  end
end

space_class("Shout greeting", space_class("Greet the world")) do
  private

  def greet(greeting)
    super(greeting).upcase
  end
end

space_module("A greeter") do
  def greet
    "Hello!"
  end
end

space_class("I do nothing on my own") do
  include space_module("A greeter")
end

class SpacesAreOkTest < Minitest::Test
  def setup
    require 'spaces_are_ok'
  end

  def test_make_a_valid_name
    assert_equal "36__228__ncc45_170145_d47_12472_12515_12531_65309_12522_12517_12483_12463_12539_12500_12459_12540_12489_", SpacesAreOk::make_a_valid_name('$_ä_ncc-1701-d/ジャン＝リュック・ピカード', '_')
  end

  def test_instance_method_invocation_on_classes
    assert_equal "Hi, Kim!", space_class("Greet the world").new("Kim").hi
  end

  def test_subclass
    assert_equal "HI, KIM!", space_class("Shout greeting").new("Kim").hi
  end

  def test_module
    assert_equal "Hello!", space_class("I do nothing on my own").new.greet
  end

  def test_method
    assert_equal "Good afternoon, Kim", space_class("Greet the world").new("Kim").space_method("Say good afternoon")
    assert_equal "Good bye, Kim", space_class("Greet the world").new("Kim").space_method("Say good bye")
  end
end

class SpacesAreOkAndDontWorryAboutSpellingTest < Minitest::Test
  def setup
    require 'spaces_are_ok/dont_worry_about_spelling'
  end

  def test_misspelled_class
    assert_equal space_class("Greet the world"), space_class("Kreet the vorld")
  end

  def test_misspelled_module
    assert_equal space_module("A greeter"), space_module("B greeter")
  end

  def test_misspelled_method
    assert_equal "Good afternoon, Kim", space_class("Greet the world").new("Kim").space_method("Say good afternooon")
    assert_equal "Good bye, Kim", space_class("Greet the world").new("Kim").space_method("Say good buy")
  end
end

ç("Test fancy class names", Minitest::Test) do
  def self.a
    "a"
  end

  def test_using_the_class_name
    assert_equal "a", ç("Test fancy class names").a
  end
end

ç("Test fancy module names", Minitest::Test) do
  ɱ("Module for a") do
    def a
      "a"
    end
  end

  extend ɱ("Module for a")

  def test_using_the_class_name
    assert_equal "a", ç("Test fancy module names").a
  end
end

ç("Test fancy method names", Minitest::Test) do
  class << self
    ∂ƒ "return a", def _
      "a"
    end
  end

  def test_using_the_method_name
    assert_equal "a", ç("Test fancy method names").ƒ("return a")
  end
end
