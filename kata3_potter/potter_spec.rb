require './potter.rb'
require "rspec"


describe "Potter book calculator" do
  
  let(:p){Potter.new}
  let(:basket){{:book1 => 0,:book2 => 0,:book3 => 0,:book4 => 0,:book5 => 0}}
	
	after(:each) do
		basket = {:book1 => 0,:book2 => 0,:book3 => 0,:book4 => 0,:book5 => 0}
	end

	
	context "Basic Tests" do  
	  it {expect(p.calc(basket)).to eql(0)}
	  it "8 EUR for a single book" do
	    basket.each do |book, qty|
	    	basket[book] = 1	
		    expect(p.calc(basket)).to eql(8)
		    basket[book] = 0	
	    end
	  end
	  it "8 * 2 EUR for two books" do
	    	basket[:book3] = 2
		    expect(p.calc(basket)).to eql(16)
	  end
	  it "8 * 3 EUR for three books" do
	    	basket[:book4] = 3
		    expect(p.calc(basket)).to eql(8*3)
	  end
	end

	
	context "Simple Discounts" do
		it "8 * 2 * 0.95 EUR for 2 different books" do
			basket[:book1] = 1
			basket[:book2] = 1
			expect(p.calc(basket)).to eql(8 * 2 * 0.95)
		end  
		it "8 * 3 * 0.9 EUR for 3 different books" do
			basket[:book1] = 1
			basket[:book3] = 1
			basket[:book5] = 1
			expect(p.calc(basket)).to eql(8 * 3 * 0.9)
		end  
		it "8 * 4 * 0.8 EUR for 4 different books" do
			basket[:book1] = 1
			basket[:book2] = 1
			basket[:book3] = 1
			basket[:book5] = 1
			expect(p.calc(basket)).to eql(8 * 4 * 0.8)
		end  
		it "8 * 5 * 0.75 EUR for 5 different books" do
			basket[:book1] = 1
			basket[:book2] = 1
			basket[:book3] = 1
			basket[:book4] = 1
			basket[:book5] = 1
			expect(p.calc(basket)).to eql(8 * 5 * 0.75)
		end 
	
	end

	context "Several discounts" do
    it "debugging" do
      basket[:book1] = 5
      basket[:book2] = 3
      basket[:book3] = 3
      basket[:book4] = 0
      basket[:book5] = 0
      p.calc(basket)
    end

    xit "8 + (8 * 2 * 0.95) EUR for 2 book1s and 1 book3" do
	    	basket[:book1] = 2
	    	basket[:book3] = 1
		    expect(p.calc(basket)).to eql(8 + (8 * 2 * 0.95))
	  end
		xit "2 * (8 * 2 * 0.95) EUR for 2 book1s and 2 book3" do
	    	basket[:book1] = 2
	    	basket[:book3] = 2
		    expect(p.calc(basket)).to eql(2 * (8 * 2 * 0.95))
	  end
	  xit "(8 * 4 * 0.8) + (8 * 2 * 0.95) EUR for 2 book1s, 1 book2, 2 book3s, 1 book4" do
	    	basket[:book1] = 2
	    	basket[:book2] = 1
	    	basket[:book3] = 2
	    	basket[:book4] = 1
		    expect(p.calc(basket)).to eql((8 * 4 * 0.8) + (8 * 2 * 0.95))
	  end
	  xit "8 + (8 * 5 * 0.75) EUR for 2 book1s, 1 book2, 2 book3s, 1 book4" do
	    	basket[:book1] = 1
	    	basket[:book2] = 2
	    	basket[:book3] = 1
	    	basket[:book4] = 1
	    	basket[:book5] = 1
		    expect(p.calc(basket)).to eql(8 + (8 * 5 * 0.75))
	  end

	end

	context "EdgeCase discounts" do
	  xit "2 * (8 * 4 * 0.8) for 2 book1s, 2 book2s, 2 book3s, 1 book4, 1 book5 " do
	    	basket[:book1] = 2
	    	basket[:book2] = 2
	    	basket[:book3] = 2
	    	basket[:book4] = 1
	    	basket[:book5] = 1
		    expect(p.calc(basket)).to eql(2 * (8 * 4 * 0.8))
	  end
	  xit "3 * (8 * 5 * 0.75) + 2 * (8 * 4 * 0.8) for 5 book1s, 5 book2s, 4 book2s, 5 book3s, 4 book5s" do
	    	basket[:book1] = 5
	    	basket[:book2] = 5
	    	basket[:book3] = 4
	    	basket[:book4] = 5
	    	basket[:book5] = 4
		    expect(p.calc(basket)).to eql(3 * (8 * 5 * 0.75) + 2 * (8 * 4 * 0.8))
	  end
	end


end
