require_relative "my_hash"

describe "My Custom Hash implementation" do
	let(:hash) { MyHash.new }

	it "should have a size function" do
		expect(hash).to respond_to(:size)
	end

  it "should be initializable with 1 element" do
  	hash = MyHash.new("my_key1", "my_value1")
  	expect(hash.size).to eql(1)
  end
  it "with multiple elements"
end