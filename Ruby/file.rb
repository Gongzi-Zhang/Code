#!/usr/bin/ruby

require "fileutils"

File.open("file", "w") {|f| f.puts "This is a file."} # the block acts like as in python, which will close (flush) file properly
FileUtils.cp("file", "newfile")

open("|less", "w") {|f| f.puts "abc"}

# line number $. or lineno
# special constnt ARGF: file-like object that can be used to read all the input files specified on the command line
while gets  # read from ARGF
  print $_  # perl like implicit parameter
end

puts $.           # total line number counting
ARFG.file.lineno  # current file line number

Dir.glob("*").sort {|a, b| File.mtime(b) <=> File.mtime(a)}
Dir.glob("*").map {|f| [File.mtime(f), f]}.
  sort {|a, b| b[0] <=> a[0] }.map(&:last)
