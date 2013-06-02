class SLinkedList
	# invariant 1 : size is always accurate
	# invariant 2 : no method of this class returns a node (which you could potentially tamper with)

	attr_reader :size, :head
	# attr_accessor :head, :size

	def initialize
		@size = 0
	end

	def insert_at_beginning node
		if @size == 0
			@head = node
		else
			node.next = @head
			@head = node
		end
		@size += 1
	end
	def insert_at_end node
		# find nth_node
		# current_node = find_nth_node @size
		# current_node = find_nth_node_with_recursion @size
		current_node = @head.find_nth_node_from_here @size
		# insert
		current_node.insert_after_me node
		@size += 1
	end

	def traverse start_node
		@items ||= []
		@items << start_node.item if start_node
    if start_node.next
      traverse start_node.next
    else
      @items
    end
	end

	# def delete

	private

	def find_nth_node n
		# using while
		current_node = @head
		while n > 1
			current_node = current_node.next
			n -= 1
		end
		current_node
	end

	def find_nth_node_with_recursion n, node = nil
		node = @head if node == nil
		if n == 1
			node
		else
			find_nth_node_with_recursion n-1, node.next
		end
	end

	# without knowing size (use the double pointer method)
	def find_nth_node_from_last n
		# traverse all the way till the end

		# start traversing in reverse direction
	end



end