require_relative "insertion_sort"

describe "Sorting Algorithms" do
  it "should sort with insertion sort" do
			[
				[[2, 9, 8, 6, 3, 2, 4], [2, 2, 3, 4, 6, 8, 9]],
				[[21, 54, 20, 99, 34, 27, 27], [20, 21, 27, 27, 34, 54, 99]],
				[[2, 1], [1, 2]],
				[[1], [1]],
				[[], []]
			].each do |unsorted_array, sorted_array|
				expect(insertion_sort(unsorted_array)).to eql(sorted_array)
			end
  end
end