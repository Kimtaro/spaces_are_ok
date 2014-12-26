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
  def test_instance_method_invocation_on_classes
    assert_equal "Hi, Kim!", space_class("Greet the world").new("Kim").hi
  end

  def test_misspelled_class
    assert_equal space_class("Greet the world"), space_class("Kreet the vorld")
  end

  def test_subclass
    assert_equal "HI, KIM!", space_class("Shout greeting").new("Kim").hi
  end

  def test_module
    assert_equal "Hello!", space_class("I do nothing on my own").new.greet
  end

  def test_misspelled_module
    assert_equal space_module("A greeter"), space_module("B greeter")
  end

  def test_method
    assert_equal "Good afternoon, Kim", space_class("Greet the world").new("Kim").space_method("Say good afternoon")
    assert_equal "Good bye, Kim", space_class("Greet the world").new("Kim").space_method("Say good bye")
  end

  def test_misspelled_method
    assert_equal "Good afternoon, Kim", space_class("Greet the world").new("Kim").space_method("Say good afternooon")
    assert_equal "Good bye, Kim", space_class("Greet the world").new("Kim").space_method("Say good buy")
  end
end
