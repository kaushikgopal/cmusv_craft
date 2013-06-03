require_relative "s_linked_list_node"
require "set"

class SLinkedList
	# invariant 1 : size is always accurate
	# invariant 2 : no method of this class returns a node (which you could potentially tamper with)

	attr_reader :size, :head
	# attr_accessor :head, :size

	def initialize
		@size = 0
	end

	def print_list
		puts "\n****** LINKED LIST *********"
		node = @head
		while node != nil
			node.print_node_info
			node = node.next
		end
		print "nil."
		puts "\n*************************"
	end

	def insert_at_beginning(node)
		if @size == 0
			@head = node
		else
			node.next = @head
			@head = node
		end
		@size += 1
	end

	def insert_at_end(node)
		# find nth_node
		# current_node = find_nth_node @size
		# current_node = find_nth_node_with_recursion @size
		current_node = @head.find_nth_node_from_here(@size)
		# insert
		current_node.insert_after_me node
		@size += 1
	end

	def traverse(start_node)
		@items ||= []
		@items << start_node.item if start_node
    if start_node.next
      traverse(start_node.next)
    else
      @items
    end
	end

	# def delete
	def delete_node(data)
		return if @head.nil?
		if @head.value.eql?(data)
			@head = @head.next
		else
			n_node = @head
			while n_node != nil
				if n_node.next.value.eql?(data)
					n_node.next = n_node.next.next
					break
				end
				n_node = n_node.next
			end
		end
	end

	# remove duplicates from an unsorted linked list.
	def delete_duplicates
		node = @head
		return if node == nil || node.next == nil
		item_set = Set.new [node.item]

		while node.next != nil
			if item_set.include?(node.next.item)
				# remove duplicate
				node.next = node.next.next
				@size -= 1
			else
				# add to item set
				item_set.add(node.next.item)
				node = node.next
			end
		end
	end

	# remove duplicates from an unsorted linked list without buffer
	def delete_duplicates_without_buffer
		lead_node = @head
		while !lead_node.nil? && !lead_node.next.nil?
			check_node = @head
			while check_node != lead_node.next
				if check_node.item == lead_node.next.item
					# remove lead_node.next
					lead_node.next = lead_node.next.next
					@size -= 1
					break if lead_node.next.nil?
				else
					check_node = check_node.next
					break if check_node.nil?
				end
			end
			lead_node = lead_node.next
		end
	end

	def find_nth_to_last_element(position)
		lead_node = @head

		while !lead_node.nil?
			checker_node = lead_node
			counter = 0
			position.times do
				break if checker_node.nil?
				checker_node = checker_node.next
				counter += 1
			end
			if checker_node.nil? && counter == position
				# element found
				return lead_node.item
			else
				# check next element
				lead_node = lead_node.next
			end
		end
	end

	def find_nth_to_last_element_with_recursion(position)
			node = @head
			while !node.nil?
				# we need to find one less from the node here to compare and see if next.nil?
				tmp_node = node.find_nth_node_from_here_recursion(position - 1)
				if !tmp_node.nil? && tmp_node.next.nil?
					return node.item
				else
					node = node.next
				end
			end
	end

	private

	def find_nth_node(n)
		# using while
		current_node = @head
		while n > 1
			current_node = current_node.next
			n -= 1
		end
		current_node
	end

	def find_nth_node_with_recursion(n, node = nil)
		node = @head if node == nil
		if n == 1
			node
		else
			find_nth_node_with_recursion n-1, node.next
		end
	end
end