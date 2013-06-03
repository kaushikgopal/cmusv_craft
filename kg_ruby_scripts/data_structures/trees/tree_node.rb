class TreeNode

	attr_reader :item, :parent_node, :first_child, :next_sibling

	def initialize(item, parent_node, first_child, next_sibling)
		@item = item
		@parent_node = parent_node
		@first_child = first_child
		@next_sibling = next_sibling
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
		# 1. visit children first
		@first_child.post_order_traversal unless @first_child.nil?
		# 2. then you visit self
		visit
		# 3. then you visit siblings
		@next_sibling.post_order_traversal unless @next_sibling.nil?
	end

	# Traversal type 3 (only for binary trees)
	def in_order_traversal
		# 1. visit left child
		# 2. visit node itself
		# 3. visit right child
	end

	# Traversal type 4
	# not naturally recursive
	def level_order_traversal
		# 1. visit root
		# 2. visit depth 1 nodes (left to right)
		# 3. visit depth 2 nodes etc.

		# use a queue: which initially only contains root.
		# Repeat until queue is empty:
			# dequeue a node
			# visit it
			# enqueue it's children from left to right
	end


	private
	def visit
		puts "you can put some computation here"
	end

end