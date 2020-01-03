#!/usr/bin/ruby

require 'os'
require_relative "some_other_file.rb"
load "some_library"

$stdout.sync = true;

starttime = Time.now;

# conventions
# 1. class names start with a capital letter
# 2. variables start with a lowercase letter
# 3. Although $ and @ are used as the first character in variable names sometimes, they indicate scope: $ for globals, @ for object instance, and @@ for class attributes
puts "hello world!"

if __FILE__ == $0
    print("Hello World!");
end

=begin
multi-line 
comment
=end


# primitive data type
## number
num = 30, 30_000
num = 3.0, 0.9
num = 3e10, 3.4E-2
num = 0b11111111, 0B11111111, 0o377, 0O377, 0xff, 0xFF, 0Xff, 0XFF
num = Math::PI, Math::E
num = '40'.to_i

## string
40.to_s
%q{this}  # single-quoted
%q|this|  # you can use any delimiter
%Q{this}  # double-quoted
%w{single-quoted list of words}


# expression
1 + 2 == 1.+(2) == 1.send "+", 2
puts "#{ any ruby code inside}"
puts "#{x.ljust(30)}"
pust 'true' if 0
5.times {print 'Odelay'}
5.times {|numbe| print number }	# 0 1 2 3 4

x, *y = [7, 8, 9]   # multiple assignment
x                   # 7
y                   # [8, 9]
x,    = [7, 8, 9]
x                   # 7

(5..8).to_a   # include right end: [5, 6, 7, 8]
(5...8).to_a  # exclude right end: [5, 6, 7]

# or (and) has very low precedence
foo = nil || "hello"  # hello
foo = nil or "hello"  # nil
(foo = nil) or "hello"

## block: anonymous function (lambda)
proc {|a, b| a<=> b}  # for a block, parameters are within |...|
Proc.new {|a, b| a<=> b}
lambda {|a, b| a<=> b}
=begin
Typically, arguments are passed to a block using yield or by using the Proc.call method
=end
foobar a, b do ... end  == foobar(a, b) do ... end
foobar a, b { ... } == foobar(a, b { ... })
=begin
{ ... } binds more tightly to the preceded expression than do ... end
=end

# loop is not a control structure, just a method defined in Kernel
loop do 
  # it creates a new scope
end

begin
  puts "i = #{i++}"
end

# string: mutable
"hello" * 5
"hello".length
"hello".reverse
'hello'.upcase
'HELLO'.downcase
'hElLo'.swapcase
'hello'.ljust(30)
'hello'.rjust(30)
'user_123'.match( /^user_(\d+)/ ) # return matchdata object || nil
'hello'.gsub('hello', 'world')	# global substitution

sentence = 'hello
world'	    # allow newline in string
sentence.lines	    # lines separated by newline, return a list of separated lines
sentence.lines.reverse	# reverse the order of elements, not reverse every element
sentence.lines.join	# opposite operation of lines

x = :hello	# symbol, symbols are cheaper than string, which will be store only once.
"hello".intern == "hello".to_sym
:hello.object_id == :hello.object_id  # true
"hello".object_id != "hello".object_id







# compound data type
# array(list)
[12, 47, 35].max
[12, 47, 35].sort!  # the exclamation is just for better explanation
ticket = [12, 47, 35]
ticket[0]   # 0-based
ticket.each {|element| do_something }
ticket << 33	# attend an element
*ticket     # expand an array


# hash
books = Hash.new {0}
books = {}
books['first'] = :splendid
books['second'] = :mediocre
books['third'] = :abysmal
books.length
books.keys, books.values
books.each {|key, value|
    puts key, value
}

books['William Shakespeare']
    .select { |k, v| 
	v['finished'] == 1591
    }.each { |key, val| 
	puts val["title"]
    }.count

# symbols are suitable for hash keys
person_1 = { :name => "John", :age => 42}
person_2 = { name: "Jane", age: 24} # alternative


'z' > 'a' > 'Z' > 'A' > '9' > '0'
# control flow
if true && 1 < 2 && 0 && 123456
    puts 'true'
end

# only false and nil evaluated to a false value, everything else is true (including 0, 0.0, "0" and "")
if false || nil || 'a' > 5
    do_something
elsif ''
    do_something
else
    puts 'false'
end

case a
when 1
  ...
when 2
  ...
when 3
  ...
else
  ...
end

case
when a==1
  ...
when b==2
  ...
when a >= 3
  ...
else
  ...
end

hash.each do |name|
    puts "hello #{name}"
end
### internally, the each method will essentially call yield

for (i=0; i<100; i++) {
    do_something;
}


# ersatz function: a function defined outside a class
# they will become private methods of the root class: Object
def fun( argument )
    do_something
    return a_value
end

def fun( arg = "default", arg2: nil ) # the default value is evaluated when the method is invoked
    ...
    true    # default return value
end

def foo(prefix, *all) # all is a list of all other arguments passed
  all.each do |arg|
    puts "${arg}"
  end
end

def meth1(&b)     # the last formal argument preceded with &
  puts b.call(9)  # the block arg will be converted to a Proc object
end               # and then being called with prc.call(args)

meth1 {|i| i + i} # the block following the method call will be converted into a Proc object and then assigned to the formal parameter

def meth2
  put yield(8)
end

square = proc {|i| i*i}

meth2 {|i| i + i}
meth2 &square   # the last actual argument in a method invocation is a Proc object, precede it with & to convert it into a block. The method may then use yield to call it
# class
class Cla	# class names always begin with a captial letter
    include MIXIN
    prepend MODULE

    attr_reader   :name   # read only
    attr_accessor :content, :time, :mood    # read/write
    attr_writer   :age

    def initialize(mood, content="")	# called when new object is created
	@time = Time.now
	@content = content[0..39]
	@mood = mood
    end

    def <=> (other) # spaceship operator
	time <=> other.time
    end

    def set=(val) # methods with = append must be called with an explicit receiver
      @content = val
      puts @content
    end
end
instance = Cla.new :confused, "a new message"
instance = Cla.new (:confused, "a new message")
Cla.new.time
instance.content = 'today is a good day'
instance.time = Time.now


## functionality
## io
File.foreach('file_name') do |line|
    do_something with line
end

file = IO.Read("file_name")

## error
begin
  some_method_that_might_run_into_an_error
rescue => e
  puts "Error = #{e}"
  raise "error message"
ensure
  puts "everything went well"
end
