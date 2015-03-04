# Odin8-Ruby-Advanced-Building_Blocks
Odin Project ruby assignment:
http://www.theodinproject.com/ruby-programming/advanced-building-blocks?ref=lnav

## 1. Bubble sort
1.1 Build a method `#bubble_sort` that takes an array and returns a sorted array. It must use the bubble sort methodology
1.2 Create a similar method called `#bubble_sort_by` which sorts an array but accepts a block. The block should take two arguments which represent the two elements currently being compared.

## 2. Enumerable Methods
Add your new methods onto the existing `Enumerable` module.
- Create `#my_each`, a method that is identical to `#each` but (obviously) does not use `#each`. You'll need to remember the yield statement. Make sure it returns the same thing as `#each` as well.
- Create `#my_each_with_index` in the same way.
- Create `#my_select` in the same way, though you may use `#my_each` in your definition (but not `#each`).
- Create `#my_all?` (continue as above)
- Create `#my_any?`
- Create `#my_none?`
- Create `#my_count`
- Create `#my_map`
- Create `#my_inject`
- Test your `#my_inject` by creating a method called #multiply_els which multiplies all the elements of the array together by using `#my_inject`, e.g. `multiply_els([2,4,5]) #=> 40`
- Modify your `#my_map` method to take a proc instead.
- Modify your `#my_map` method to take either a proc or a block, executing the block only if both are supplied (in which case it would execute both the block AND the proc).
