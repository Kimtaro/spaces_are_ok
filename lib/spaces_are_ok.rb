require "spaces_are_ok/version"
require "spaces_are_ok/classes_and_modules"
require "spaces_are_ok/methods"
require "spaces_are_ok/modify_the_kernel"

module SpacesAreOk
  def self.find_a_matching_name(prospects, name)
    prospects.detect { |prospect| prospect == name }
  end
end
