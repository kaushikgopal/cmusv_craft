require_relative "insertion_sort"
require_relative "merge_sort"

describe "Sorting Algorithms" do

	before(:each) do
	  @comparison_set =
	  [
				[[2, 9, 8, 6, 3, 2, 4], [2, 2, 3, 4, 6, 8, 9]],
				[[21, 54, 20, 99, 34, 27, 27], [20, 21, 27, 27, 34, 54, 99]],
				[[2, 1], [1, 2]],
				[[1], [1]],
				[[], []]
			]
	end

  it "should sort with insertion sort" do
			@comparison_set.each do |unsorted_array, sorted_array|
				expect(insertion_sort(unsorted_array)).to eql(sorted_array)
			end
  end

  it "should sort with merge sort" do
			@comparison_set.each do |unsorted_array, sorted_array|
				expect(merge_sort(unsorted_array)).to eql(sorted_array)
			end
  end


end