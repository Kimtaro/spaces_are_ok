module Kernel
  # Classes
  def space_class(*args, &class_definition)
    SpacesAreOk::ClassesAndModules.get_class(*args, &class_definition)
  end

  # Modules
  def space_module(*args, &module_definition)
    SpacesAreOk::ClassesAndModules.get_module(*args, &module_definition)
  end

  # Method definition
  def space_method_def(original_name, actual_method_name)
    new_name = SpacesAreOk::Methods.make_a_method(original_name)
    binding.eval <<-EOS
      alias_method :#{new_name}, :#{actual_method_name}
    EOS
  end

  # Method invocation
  def space_method(actual_name, *args, &block)
    send(SpacesAreOk::Methods.invoke_a_method(actual_name), *args, &block)
  end
end

class String
  def •@
    space_class(self)
  end
end
