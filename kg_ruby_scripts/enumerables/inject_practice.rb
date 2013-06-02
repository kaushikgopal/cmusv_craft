# examples taken from http://blog.jayfields.com/2008/03/ruby-inject.html
# mainly for practicing inject, map & select

#######################################
int_array = [1, 2, 3, 4]

# expected output: 10
# Solution 1
int_array.inject(0) do |result, element|
	result + element
end
# Solution 2
int_array.inject do |result, element|
	result + element
end
# Solution 3
int_array.inject(&:+)


# expected output: ["1", "2", "3", "4"]
# Solution 1
int_array.inject([]) do |result, element|
	result << element.to_s
	result
end
# Solution 2
int_array.map { |e| e.to_s }


#######################################
combo_array = [[:first_name, 'Shane'], [:last_name, 'Harvie']]

# expected output: {:first_name=>"Shane", :last_name=>"Harvie"}
combo_array.inject ({}) do |result, element|
	result[element.first] = element.last
	result
end

# expected output: {"first_name"=>"shane", "last_name"=>"harvie"}
combo_array.inject ({}) do |result, element|
	result[element.first.to_s] = element.last.downcase
	result
end

#######################################
TestResult = Struct.new(:status, :message)
results = [
  TestResult.new(:failed, "1 expected but was 2"),
  TestResult.new(:sucess),
  TestResult.new(:failed, "10 expected but was 20")
]

# expected output: ["1 expected but was 2", "10 expected but was 20"]
# Solution 1
results.select do |tr|
	tr.status == :failed
end.map do |tr|
	tr.message
end
# Solution 2
results.inject ([]) do |result, tr|
	result << tr.message if tr.status == :failed
	result
end

# expected output:
# {:failed => [
#    #<struct TestResult status=:failed, message="1 expected but was 2">,
#    #<struct TestResult status=:failed, message="10 expected but was 20">],
#  :sucess => [ #<struct TestResult status=:sucess, message=nil> ]
# }
results.inject ({}) do |result, tr|
	result[tr.status] ||=  []
	result[tr.status] << tr
	result
end