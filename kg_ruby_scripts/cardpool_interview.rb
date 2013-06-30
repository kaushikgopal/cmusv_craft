# Write a function that prints odd numbers from 0 to n

def print_odd_numbers n
    (0..n).each do |num|
        puts num if num.odd?
    end
end

print_odd_numbers 5

# Write a function given an array of integers, returns the largest value in an array

def get_largest_num arr
    nil if arr.size == 0
    iamlargest = arr[0]
    arr.each do |num|
        iamlargest = num if num > iamlargest
    end
    iamlargest
end

some_array = [1,5,9,3]
get_largest_num some_array

# input : [1,5,9,3]
# output : 9

# Write a function that given n, prints a nxn multiplication table

# n = 3

# 1 2 3
# 2 4 6
# 3 6 9


def print_mult n
    (1..n).each do |col|
        (1..n).each do |row|
            # print col*row + " "    # WTF! this is not possible
        end
        puts "\n"
    end
end


# Write a function that figures out how many unique numbers are in an array

def find_unique array
    return if array.nil?
    hash = {}
    array.each do |num|
        hash[num] ||= 0
        hash[num] += 1
    end
    puts hash.inspect
    hash.keys.size
end


# faster and better way!
def find_unique arr
    arr.uniq.size
end

find_unique [1,2,3,3,3,34,4]