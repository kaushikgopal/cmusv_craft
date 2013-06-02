# Practice creating a linked list

class SLinkedListNode
	attr_reader :value
	attr_accessor :next_node

	def initialize(value, next_node = nil)
		@value = value
		@next_node = next_node
	end
end

class SLinkedList
	def initialize(head_node)
		@head = head_node
	end
	def to_s
		puts "\n****** LINKED LIST *********"
		node = @head
		while node != nil
			print "#{node.value} > "
			node = node.next_node
		end
		print "nil."
		puts "\n*************************"
	end

	def append_to_tail(node)
		if @head.nil?
			@head = node
		else
			n_node = @head
			while n_node.next_node != nil
				n_node = n_node.next_node
			end
			n_node.next_node = node
		end
	end
	def delete_node(data)
		return if @head.nil?
		if @head.value.eql?(data)
			@head = @head.next_node
		else
			n_node = @head
			while n_node != nil
				if n_node.next_node.value.eql?(data)
					n_node.next_node = n_node.next_node.next_node
					break
				end
				n_node = n_node.next_node
			end
		end
	end

###############################################################
# Write code to remove duplicates from an unsorted linked list.
###############################################################
	def remove_duplicates

	end


end

# create a linked list
head = SLinkedListNode.new("H")
ll = SLinkedList.new(head)

n1 = SLinkedListNode.new("N1")
ll.append_to_tail(n1)

ll.to_s
ll.delete_node("N1")
ll.to_s



# Write code to remove duplicates from an unsorted linked list.
