require_relative "s_list_node"


l3 = ListNode.new(6, "L3")

# creating new nodes with constructors
l2 = ListNode.new(0, "L2", l3)
l1 = ListNode.new(7, "L1", l2)

# Insert after l2, a node lx with item 3
l2.next = ListNode.new(3, "LX", l2.next)



# TODO make this a SinglyLinked List
# TODO Doubly Linked List - Empty list : watch out for sentinel pointing to itself (remember the expression evaluated from right, to left)
