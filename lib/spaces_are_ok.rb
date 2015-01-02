require "spaces_are_ok/version"
require "spaces_are_ok/classes_and_modules"
require "spaces_are_ok/methods"
require "spaces_are_ok/modify_the_kernel"

module SpacesAreOk
  def self.make_a_valid_name(possibly_invalid_name, separator)
    name = possibly_invalid_name.gsub(%r< [^a-z0-9_] >ix) do |m|
      "#{m.ord}_"
    end
    name.downcase
  end

  def self.find_a_matching_name(prospects, name)
    prospects.detect { |prospect| prospect == name }
  end
end
