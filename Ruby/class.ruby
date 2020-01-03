#!/usr/bin/ruby

obj.class
class.instance_methods	    # list all available methods for a class
class.instance_methods(false)	# liat methods, without including those from its ancestors
class.respond_to('method_name')	# test if a class has a method

# "Class" (static) variable names always begin with @@
class Exp
  @@instances = 0 # class variable (@@ID); shared by all instances
  attr_accessor :attr1

  class << self
    attr_accessor :inst # Class instance variable; belong to the Class object, rather than any instance of this defined class 
  end

  def initialize(value)  # constructor
    @attr1 = value
  end

  def inspect
    "#{attr1}"
  end

  def self.test # class method, which can be invoked without any instance
    "this is Exp class"
  end
end


def Exp.another_class_method  # define class method at the top level
end
# class inheritance
class Exp2 << Exp
end
# access modifier
# private means the methods are accessible only when they can be called without an explicit receiver: only self is allowed to be the receiver


# singleton methods: per-object methods
class Car
  def inspect
    "Cheap car"
  end
end

porsche = Car.new
porsche.inspect   # Cheap car
def porsche.inspect
  "Expensive car"
end
porsche.inspect   # Expensive car

vw = Car.new
vw.inspect        # Cheap car

# singleton class
# an anonymous class; a literal class
class << foo
  attr_accessor :name

  def hello
    "hello, I'm ${name}"
  end
end
