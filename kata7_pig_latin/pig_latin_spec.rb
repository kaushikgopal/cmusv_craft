require_relative "pig_latin"
describe PigLatin do
  let(:pl) { PigLatin.new }


  it "should have a translate method" do
    expect(pl.respond_to?("translate")).to eql(true)
  end

  context "Word translation" do

	  context "For consonants: " do
	    describe "starts with single consonant" do
		    it "should translate happy to appyhay" do
		      expect(pl.translate("happy")).to eql("appyhay")
		    end
		    it "should translate duck to uckday" do
		    	expect(pl.translate("duck")).to eql("uckday")
		    end
	    end
	    describe "starts with multiple consonants" do
	      it "should translate glove to oveglay" do
		    	expect(pl.translate("glove")).to eql("oveglay")
		    end
		    it "should translate three to eethray" do
		    	expect(pl.translate("three")).to eql("eethray")
		    end
	    end
	    it "should translate for special case 'qu'" do
	      expect(pl.translate("quiet")).to eql("ietquay")
	    end
	    it "should translate for special case 'Qu'" do
	      expect(pl.translate("Queen")).to eql("Eenquay")
	    end
	    it "should take care of capitalization" do
	      expect(pl.translate("Banana")).to eql("Ananabay")
	    end
	  end

	  describe "For vowels:" do
	    it "should translate egg to eggway" do
		    expect(pl.translate("egg")).to eql("eggway")
	    end
		  it "should translate inbox to inboxway" do
		    expect(pl.translate("inbox")).to eql("inboxway")
		  end
			it "should translate eight to eightway" do
	    	expect(pl.translate("eight")).to eql("eightway")
	  	end
	    it "should take care of capitalization" do
	      expect(pl.translate("Apeman")).to eql("Apemanway")
	    end

	  end

  end

  context "For words that don't start with characters: " do
  	it "should not translate words that don't begin with alphabets" do
  		expect(pl.translate("234BalancedTrees")).to eql("234BalancedTrees")
  	end
  end

  context "For sentences: " do
    it "should translate multiple sentences" do
      para = "This is a normal sentence. We are going ahead and translating it into Pig Latin."
	    para_translated = "Isthay isway away ormalnay entencesay. Eway areway oinggay aheadway andway anslatingtray itway intoway Igpay Atinlay."
	    expect(pl.translate(para)).to eql(para_translated)
    end
  end

end