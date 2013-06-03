class SLinkedListNode
	attr_reader :item, :name
	attr_accessor :next

	def initialize item, name = "node_name", next_node = nil
		@item = item
		@name = name
		@next = next_node
	end

	def print_node_info
		if @next
			print " #{name} [ #{item} | Nxt(#{@next.name}) ] > "
		else
			print " #{name} [ #{item} | Nxt(nil) ] > "
		end
	end

	# recursive
	def self.print_all_nodes_from_here node
		if node
			node.print_node_info
			SLinkedListNode.print_all_nodes_from_here node.next if node
		end
	end

	def insert_after_me node
		node.next = @next
		@next = node
	end

	# recursion
	def find_nth_node_from_here(position)
		if position == 1
			self
		else
			self.next.find_nth_node_from_here(position-1)
		end
	end


	def find_nth_node_from_here_recursion(position)
		return self if position == 0
		self.next.find_nth_node_from_here_recursion(position - 1)
	end

end