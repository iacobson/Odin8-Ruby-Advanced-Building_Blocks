#adding methods to the default Enumerable module
module Enumerable
  def my_each
    i = 0
    while i < self.length
      # yield will run the block in the #Testing below
      yield(self[i])
      i += 1
    end
    self
  end

  def my_each_with_index
    i = 0
    while i < self.length
      yield(self[i], i)
      i += 1
    end
    self
  end

  def my_select
    result = []
    self.my_each do |n|
      if yield(n) == true
        result << n
      end
    end
    result
  end

  def my_all?
    self.my_each do |n|
      if yield(n) == false
        return false
      end
    end
    return true
  end

  def my_any?
    self.my_each do |n|
      if yield(n) == true
        return true
      end
    end
    return false
  end

  def my_none?
    self.my_each do |n|
      if yield(n) == true
        return false
      end
    end
    return true
  end


  # count → int
  # count(item) → int
  # count { |obj| block } → int
  # Returns the number of items in enum through enumeration.
  # If an argument is given, the number of items in enum that are equal to item are counted.
  # If a block is given, it counts the number of elements yielding a true value.
  def my_count(input = nil)
    # check if a block is passed to the method (all 3 possible utilization tested below)
    if block_given?
      self.my_select {|n| yield(n)}.size
    elsif input != nil
      self.my_select {|n| n == input}.size
    else
      self.size
    end
  end

  # include the possibility to have also a proc
    # 1. have a bloc but no proc
    # 2. have proc but no block
    # 3. have both and execute both
  def my_map (my_map_proc = nil)

    self.my_each_with_index do |n, i|
        # just block
        self[i] = yield(n) if my_map_proc == nil && block_given?
        # just proc
        self[i] = my_map_proc.call(n) if my_map_proc != nil && block_given? == false
        # both proc and block
        # proc will be executed first
        self[i] = yield(my_map_proc.call(n)) if my_map_proc != nil && block_given?

    end
  end

  def my_inject (initial = nil)

    # if an argument is given (initial value is not nil)
    if initial != nil
      # accumulator become initial value
      acc = initial
      self.my_each do |n|
        acc = yield(acc, n)
      end

    # if no argument
    else
      # accumulator become the first array element
      acc = self[0]
      self.my_each_with_index do |n, i|
        # the n will start with the secont element of the array and will stop at the last (conditioned by the if)
        acc = yield(acc, self[i+1]) if (i < self.length-1)
      end
    end

    return acc

  end

end

# inject testing method
def multiply_els (input_array)
  input_array.my_inject {|acc, n| acc *= n}
end

###Testing

puts "my_each"
[1,2,3].my_each do |n|
  print n
end
print "\n"

puts "my_each_with_index"
[1,2,3].my_each_with_index do |n, i|
  puts "#{i} ==> #{n}"
end
print "\n"

puts "my_select"
result = [1,2,3,4].my_select{|n| n%2 == 0}
print result
print "\n"

puts "my_all?"
result = [2,4,7].my_all? {|n| n%2 == 0}
puts result
print "\n"

puts "my_any?"
result = [2,5,7].my_any? {|n| n%2 == 0}
puts result
print "\n"

puts "my_none?"
result = [1,5,7].my_none? {|n| n%2 == 0}
puts result
print "\n"

puts "my_count"
puts [1,2,3].my_count
puts [1,2,3,3].my_count(3)
puts [1,2,3,5,7].my_count {|n| n%2 != 0}
print "\n"

puts "my_map"
result = [1,2,3].my_map{|n| n*2}
print result
print "\n"

# adding proc to my_map
my_map_proc = Proc.new {|n| n+1}
result = [2,3,4].my_map(my_map_proc)
print result
print "\n"

# adding both proc and block to my_map
result = [1,2,3].my_map(my_map_proc){|n| n*2}
print result
print "\n"

puts "my_inject"
result = [1,2,3,4].my_inject(10){|acc, n| acc += n}
print result
print "\n"

puts "testing my_inject"
print multiply_els([2,4,5])
print "\n"
