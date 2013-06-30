require_relative "s_linked_list"
require_relative "s_linked_list_node"

describe SLinkedList do
  let(:list) { SLinkedList.new }
  let(:node) { SLinkedListNode.new(1, "L1") }

  context "initialization" do
	  it "should have zero size" do
	  	expect(list.size).to eql(0)
	  end
	  it "should have a nil head " do
	    expect(list.head).to eql(nil)
	  end
  end

  it "traverse : returns an  array of items" do
  	expect(list.head).to eql(nil)
  	list.insert_at_beginning node
  	expect(list.traverse(list.head)).to eql([1])
  	expect(list.head).to eql(node)
  end

	it "insert_at_beginning : takes in a single node" do
  	list.insert_at_beginning(SLinkedListNode.new(1, "L1"))
  	list.insert_at_beginning(SLinkedListNode.new(2, "L2"))
  	expect(list.traverse(list.head)).to eql([2, 1])
  	expect(list.size).to eql(2)
  end

	it "insert_at_end : takes in a single node" do
  	list.insert_at_beginning(SLinkedListNode.new(1, "L1"))
  	list.insert_at_beginning(SLinkedListNode.new(2, "L2"))
  	list.insert_at_end(SLinkedListNode.new(3, "L3"))
  	expect(list.traverse(list.head)).to eql([2, 1, 3])
  	expect(list.size).to eql(3)
  end

  describe "Advanced methods" do
    before(:each) do
      list.insert_at_beginning(SLinkedListNode.new(5, "L1"))
	  	list.insert_at_end(SLinkedListNode.new(4, "L2"))
	  	list.insert_at_end(SLinkedListNode.new(4, "L3"))
	  	list.insert_at_end(SLinkedListNode.new(1, "L4"))
	  	list.insert_at_end(SLinkedListNode.new(5, "L5"))
    end
    describe "delete_duplicates : should remove all duplicate nodes from unsorted list" do
	    it "with buffer" do
		  	list.delete_duplicates
		  	expect(list.traverse(list.head)).to eql([5, 4, 1])
		  	expect(list.size).to eql(3)
	    end
	    it "without buffer" do
	      list.delete_duplicates_without_buffer
		  	expect(list.traverse(list.head)).to eql([5, 4, 1])
		  	expect(list.size).to eql(3)
	    end
    end
		describe "find_nth_node_from_here" do
		  it "with recursion" do
	      expect(list.find_nth_to_last_element_with_recursion(2)).to eql(1)
		  end
		  it "without recursion" do
	      expect(list.find_nth_to_last_element(2)).to eql(1)
		  end
		end
  end

end


# IRB TEST
# require "./s_linked_list_node"
# require "./s_linked_list"
# list = SLinkedList.new
# l1 = SLinkedListNode.new(0, "L1")
# l2 = SLinkedListNode.new(5, "L2")
# l3 = SLinkedListNode.new(10, "L3")

# list.insert_at_beginning(l1)
# list.insert_at_end(l2)
# list.insert_at_end(l3)
# list.print_list