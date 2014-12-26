require "spaces_are_ok"
require "rubyfish"

module SpacesAreOk
  def self.find_a_matching_name(prospects, name)
    names = prospects.find_all do |prospect|
      RubyFish::Levenshtein.distance(name, prospect) <= 3
    end

    names.sort_by(&:size).first
  end
end
