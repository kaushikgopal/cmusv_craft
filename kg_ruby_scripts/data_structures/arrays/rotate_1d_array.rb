
k = 3

arr = ['a','b','c','d','e','f','g']
n = (arr.length)

new = []
j = 0

arr.each_with_index do |e, i|
	j = i + k
	if (j >= n)
		j = j-n
	end
	new[j] = e
	# puts "new of #{j} is a of #{i} -  #{e}"
end

puts arr.inspect
puts new.inspect

# but this uses a different array, so a better solution would be to "Reverse it"
# http://ruby.about.com/od/faqs/f/rotatearray.htm
# http://stackoverflow.com/questions/5270098/arrayrotate-equivalent-in-ruby-1-8-7