# first exercise
# using binary_sort and verification methods inside bubble_sort
# practically will run binary_sort until verification == true
def binary_sort(my_array)
  my_array.each_with_index do |number, index|
    if (index < my_array.length-1) && (number > my_array[index+1])
      # if second number is greater than first SWITCH the places
      my_array[index] , my_array[index+1] = my_array[index+1], my_array[index]
    end
  end

end
# verify if any second number is less than first number
def verification (my_array)
  my_array.each_with_index do |number, index|
    if (index < my_array.length-1) && (number > my_array[index+1])
      return false
    end
  end
end


def bubble_sort (my_array)
  final_array = my_array
  while verification(final_array) == false do
    final_array = binary_sort(my_array)
    my_array = final_array

  end
  print final_array
end

bubble_sort([4,3,78,2,0,2])

###################
# second exercise
# yield will allow to run a block

def bubble_sort_by (my_array)
  verif = false
  while verif == false do
    verif = true
    my_array.each_with_index do |item, index|
                                       # yield(my_array[index], my_array[index+1]) will be the result from the block below:
                                       # right.length - left.length
      if (index < my_array.length-1) && (yield(my_array[index], my_array[index+1]) < 0)
        my_array[index] , my_array[index+1] = my_array[index+1], my_array[index]
        verif = false
      end
    end
  end
  print my_array
end

# the block will be used in the YIELD
bubble_sort_by(["bonjour","hi","hello","hey"]) do |left,right|
  right.length - left.length
end
