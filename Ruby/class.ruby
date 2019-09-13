#!/usr/bin/ruby

class.instance_methods	    # list all available methods for a class
class.instance_methods(false)	# liat methods, without including those from its ancestors
class.respond_to('method_name')	# test if a class has a method
