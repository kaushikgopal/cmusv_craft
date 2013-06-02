require_relative "s_linked_list"
require_relative "s_list_node"

describe SLinkedList do
  let(:list) { SLinkedList.new }

  context "initialization" do
	  it "should have zero size" do
	  	expect(list.size).to eql(0)
	  end
	  it "should have a nil head " do
	    expect(list.head).to eql(nil)
	  end
  end

  context "should have method " do
	  let(:node) { SListNode.new(1, "L1") }
	  it "traverse : that returns an  array of items" do
	  	expect(list.head).to eql(nil)
	  	list.insert_at_beginning node
	  	expect(list.traverse list.head).to eql([1])
	  	expect(list.head).to eql(node)
	  end
		it "insert_at_beginning : takes in a single node" do
	  	list.insert_at_beginning SListNode.new(1, "L1")
	  	list.insert_at_beginning SListNode.new(2, "L2")
	  	expect(list.traverse list.head).to eql([2, 1])
	  	expect(list.size).to eql(2)
	  end
		it "insert_at_end : takes in a single node" do
	  	list.insert_at_beginning SListNode.new(1, "L1")
	  	list.insert_at_beginning SListNode.new(2, "L2")
	  	list.insert_at_end SListNode.new(3, "L3")
	  	expect(list.traverse list.head).to eql([2, 1, 3])
	  	expect(list.size).to eql(3)
	  end

  end

end