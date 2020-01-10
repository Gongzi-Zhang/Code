#!/usr/bin/ruby


def permutation (array)
  if !array.respond_to?("each")
    puts "array argument needed"
    return
  end

  if array.length == 1
    return array
  end

  return_array = []
  array.each do |ele|
    left_array = left_array # FIXME
    permutation(left_array).each do |p_ele|
      return_array << ele.concat( p_ele )
    end
  end

  return return_array
end

if __FILE__ == $0
  
