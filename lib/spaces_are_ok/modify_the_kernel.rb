module Kernel
  # Classes
  def space_class(*args, &class_definition)
    SpacesAreOk::ClassesAndModules.get_class(*args, &class_definition)
  end

  def ç(*args, &class_definition)
    space_class(*args, &class_definition)
  end

  # Modules
  def space_module(*args, &module_definition)
    SpacesAreOk::ClassesAndModules.get_module(*args, &module_definition)
  end

  def ɱ(*args, &class_definition)
    space_module(*args, &class_definition)
  end

  # Method definition
  def space_method_def(original_name, actual_method_name)
    new_name = SpacesAreOk::Methods.get_method(original_name, binding)
    binding.eval <<-EOS
      alias_method :#{new_name}, :#{actual_method_name}
    EOS
  end

  def ∂ƒ(original_name, actual_method_name)
    space_method_def(original_name, actual_method_name)
  end

  # Method invocation
  def space_method(original_name, *args, &block)
    send(SpacesAreOk::Methods.get_method(original_name, binding), *args, &block)
  end

  def ƒ(original_name, *args, &block)
    space_method(original_name, *args, &block)
  end
end
