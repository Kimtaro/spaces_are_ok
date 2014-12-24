module SpacesAreOk::Methods
  def self.get_method(original_name, the_binding)
    name = original_name.gsub(%r< [^a-z0-9_] >ix, '_').downcase
    name = "a_#{name}" if name.match(%r<^ [^a-z] >x)

    if !method_defined?(name)
      close_enough = closest_method_name(name, the_binding)
      if !close_enough.nil?
        name = close_enough
      end
    end

    name
  end

  private

  def self.closest_method_name(name, the_binding)
    ms = the_binding.eval("methods") + the_binding.eval("private_methods")
    ms.find_all { |m| RubyFish::Levenshtein.distance(name, m) <= 3 }.sort_by(&:size).first
  end
end
