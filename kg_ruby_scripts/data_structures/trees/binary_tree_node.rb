require_relative "tree_node"

class BinaryTreeNode
	attr_reader :item, :left_node, :right_node
	attr_accessor :parent_node

	def initialize(item, parent_node, left_node, right_node)
		@item = item
		@parent_node = parent_node
		@left_node = first_child
		@right_node = next_sibling
	end



end