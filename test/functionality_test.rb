$: << File.expand_path('../lib', __FILE__)
require 'minitest/autorun'
require 'spaces_are_ok'

space_class("Greet the world") do
  def initialize(name)
    @name = name
  end

  def hi
    greet("Hi")
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

class SpacesAreOkTest < Minitest::Test
  def test_instance_method_invocation_on_classes
    assert_equal "Hi, Kim!", space_class("Greet the world").new("Kim").hi
  end

  def test_misspelled_class
    assert_equal "Hi, Kim!", space_class("Kreet the vorld").new("Kim").hi
  end

  def test_subclass
    assert_equal "HI, KIM!", space_class("Shout greeting").new("Kim").hi
  end
end
