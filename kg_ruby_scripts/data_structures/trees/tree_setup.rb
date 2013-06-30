require_relative "tree"
require_relative "tree_node"

root = TreeNode.new("Root", nil, nil, nil)
node1 = TreeNode.new("Node 1", root, nil, nil)
node2 = TreeNode.new("Node 2", root, nil, nil)
leaf1 = TreeNode.new("Leaf 1", node1, nil, nil)

root.first_child = node1
node1.next_sibling = node2
node1.first_child = leaf1

t = Tree.new(root)

puts "pre order"
root.pre_order_traversal

puts "post order"
root.post_order_traversal

puts "in order"
root.in_order_traversal


  #   3
  #  /  \
  # 9   20
  #    /  \
  #   15    7
root = TreeNode.new("3", nil, nil, nil, 0)
node1 = TreeNode.new("9", root, nil, nil)
node2 = TreeNode.new("20", root, nil, nil)
leaf1 = TreeNode.new("15", node2, nil, nil)
leaf2 = TreeNode.new("7", node2, nil, nil)

root.first_child = node1
node1.next_sibling = node2
node2.first_child = leaf1
leaf1.next_sibling = leaf2
t = Tree.new(root)

puts "level order"
root.level_order_traversal
