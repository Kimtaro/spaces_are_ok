module SpacesAreOk::ClassesAndModules
  def self.get_class(original_name, superclass = Object, &class_definition)
    creator = -> { Class.new(superclass) }
    define_or_get_module_or_class(
      original_name,
      Class,
      :class_eval,
      creator,
      &class_definition
    )
  end

  def self.get_module(original_name, &module_definition)
    creator = -> { Module.new }
    define_or_get_module_or_class(
      original_name,
      Module,
      :module_eval,
      creator,
      &module_definition
    )
  end

  private

  def self.define_or_get_module_or_class(original_name, type, evaluator, creator, &body)
    name = get_name(original_name, type)

    if !Object.const_defined?(name)
      Object.const_set(name, creator.call)
    end

    module_or_class = Object.const_get(name)

    if !body.nil?
      module_or_class.send(evaluator, &body)
    end

    module_or_class
  end

  def self.get_name(original_name, type)
    name = valid_class_or_module_name_from(original_name)
    close_enough = closest_existing_name_for(name, type)
    name = close_enough unless close_enough.nil?
    name
  end

  def self.closest_existing_name_for(name, type)
    names = Module.constants.select do |c|
      next if c.to_s == 'Config' # Get rid of RbConfig/Config warning
      Module.const_get(c).is_a?(type)
    end

    names = names.find_all do |c|
      RubyFish::Levenshtein.distance(name, c) <= 3
    end

    names.sort_by(&:size).first
  end

  def self.valid_class_or_module_name_from(original_name)
    name = original_name.gsub(%r< [^a-z0-9_] >ix, '').downcase
    name = "a_#{name}" if name.match(%r<^ [^a-z] >x)
    name.capitalize
  end
end
