module SpacesAreOk::ClassesAndModules
  def self.get_class(original_name, superclass = Object, &class_definition)
    name = get_name(original_name, Class)

    if !Object.const_defined?(name)
      Object.const_set(name, Class.new(superclass))
    end

    klass = Object.const_get(name)

    if !class_definition.nil?
      klass.class_eval(&class_definition)
    end

    klass
  end

  def self.get_module(original_name, &module_definition)
    name = get_name(original_name, Module)

    if !Object.const_defined?(name)
      Object.const_set(name, Module.new)
    end

    nodule = Object.const_get(name)

    if !module_definition.nil?
      nodule.module_eval(&module_definition)
    end

    nodule
  end

  private

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
