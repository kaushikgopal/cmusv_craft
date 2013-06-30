class TreeNode

	attr_reader :item, :parent_node, :depth
	attr_accessor :first_child, :next_sibling

	def initialize(item, parent_node, first_child, next_sibling, depth)
		@item = item
		@parent_node = parent_node
		@first_child = first_child
		@next_sibling = next_sibling
		@depth = depth
	end

	# Traversal type 1 (most common)
	# nice to print a directory kind of structure
	def pre_order_traversal
		# 1 : visit self
		visit
		# 2 : "recursively" traverse children
		@first_child.pre_order_traversal unless @first_child.nil?
		# 3 : traverse next sibling
		@next_sibling.pre_order_traversal unless @next_sibling.nil?
	end

	# Traversal type 2
	# natural way to sum total disk space in directories
	def post_order_traversal
		# 1. visit left child
		@first_child.post_order_traversal unless @first_child.nil?
		# 2. visit right child
	  @next_sibling.post_order_traversal unless @next_sibling.nil?
		# 3. visit node itself
		visit
	end

	# Traversal type 3 (for binary trees)
	def in_order_traversal
		# 1. visit children first
		@first_child.post_order_traversal unless @first_child.nil?
		# 2. then you visit self
		visit
		# 3. then you visit siblings
		@next_sibling.post_order_traversal unless @next_sibling.nil?
	end

	# Traversal type 4
	# not naturally recursive
	def level_order_traversal
		# initialize two arrays
			# use one as a queue
		order_queue, order_items = [], []

    # enqueue self
    order_queue.push(self)
		order_items.push(self.item)
		print "#{self.item}"

		while !order_queue.empty?
	    puts ""
	    # dequeue the first element
	    node = order_queue.shift

	    # enqueue the children
	    child_node = node.first_child
	    while !child_node.nil?
	    	order_queue.push(child_node)
	    	order_items.push(child_node.item)
	    	print "#{child_node.item} "
	    	child_node = child_node.next_sibling
	    end

		end
		# puts "Level order conversion of items is #{order_items.inspect}"
	end


	private
	def visit
		puts "- Item #{@item} -"
	end

end
