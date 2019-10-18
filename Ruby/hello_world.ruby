#!/usr/bin/ruby

$stdout.sync = true;

starttime = Time.now;

puts "hello world!"

if __FILE__ == $0
    print("Hello World!");
end

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


# expression
puts "#{x}.ljust(30)"
pust 'true' if 0
5.times {print 'Odelay'}
5.times {|numbe| print number }	# 0 1 2 3 4

# string
"hello" * 5
"hello".length
"hello".reverse
'hello'.upcase
'HELLO'.downcase
'hElLo'.swapcase
'hello'.ljust(30)
'hello'.rjust(30)
'hello'.gsub('hello', 'world')	# global substitution

sentence = 'hello
world'	    # allow newline in string
sentence.lines	    # lines separated by newline, return a list of separated lines
sentence.lines.reverse	# reverse the order of elements, not reverse every element
sentence.lines.join	# opposite operation of lines

x = :hello	# symbol, symbols are cheaper than string, which will be store only once.







# compound data type
# array
[12, 47, 35].max
[12, 47, 35].sort!
ticket = [12, 47, 35]
ticket[0]   # 0-based
ticket.each {|element| do_something }
ticket << 33	# attend an element


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



'z' > 'a' > 'Z' > 'A' > '9' > '0'
# control flow
if true && 1 < 2 && 0 && 123456
    puts 'true'
end

if false || nil || 'a' > 5
    do_something
elsif ''
    do_something
else
    puts 'false'
end

hash.each do |name|
    puts "hello #{name}"
end
### internally, the each method will essentially call yield

for (i=0; i<100; i++) {
    do_something;
}

# blocks: anonymous function (lambda)
5.times {print 'Odelay'}    # repeat 5 times of the block
5.times { |time|	    # block variable is local to the block
    puts time		    # pass value to a block
}

# methods
def fun( argument )
    do_something
    return a_value
end

def fun( arg = "default" )
    ...
    true    # default return value
end

# class
class Cla	# class names always begin with a captial letter
    attr_accessor :content, :time, :mood    # getter and setter

    def initialize(mood, content="")	# called when new object is created
	@time = Time.now
	@content = content[0..39]
	@mood = mood
    end

    def <=> (other)
	time <=> other.time
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
