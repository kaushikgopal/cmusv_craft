Node = Struct.new(:value, :next)

class List
	attr_reader :head
	def insert_node_at_beginning(node)
			node.next = @head
			@head = node
	end

	def display
		puts "\nLinked List"
		node = @head
		while !node.nil?
			print "#{node.value} > "
			node = node.next
		end
		puts "\n---"
	end
end



# You have two numbers represented by a linked list, where each node
# contains a single digit. The digits are stored in reverse order, such
# that the 1’s digit is at the head of the list. Write a function that adds
# the two numbers and returns the sum as a linked list.
# EXAMPLE Input: (3-> 1 -> 5) + (5 -> 9 -> 2) Output: 8 -> 0 -> 8


n3 = Node.new(5)
n2 = Node.new(1, n3)
n1 = Node.new(3, n2)
ll1 = List.new
ll1.insert_node_at_beginning(n3)
ll1.insert_node_at_beginning(n2)
ll1.insert_node_at_beginning(n1)
ll1.display

n3 = Node.new(2)
n2 = Node.new(9, n3)
n1 = Node.new(5, n2)
ll2 = List.new
ll2.insert_node_at_beginning(n3)
ll2.insert_node_at_beginning(n2)
ll2.insert_node_at_beginning(n1)
ll2.display


def sum_of_lists(ll1, ll2)
	node_1 = ll1.head
	node_2 = ll2.head
	ll3 = List.new
	# easy non-efficient way
	sum = []
	sum_value_tmp = 0
	carry_over = 0
	while !(node_1.nil? && node_2.nil?)
		sum_value_tmp = (node_1.nil? ? 0 : node_1.value) + (node_2.nil? ? 0 : node_2.value)
		sum_value_tmp += carry_over
		if sum_value_tmp > 9
			carry_over = 1
			sum_value_tmp = sum_value_tmp % 10
		else
			carry_over = 0
		end
		sum << sum_value_tmp
		node_1 = node_1.next unless node_1.nil?
		node_2 = node_2.next unless node_2.nil?
	end

	sum.reverse.each do |sum_value|
		ll3.insert_node_at_beginning(Node.new(sum_value))
	end
	ll3
end

sum_of_lists(ll1, ll2).display

