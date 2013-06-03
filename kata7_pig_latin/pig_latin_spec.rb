require_relative "pig_latin"
describe PigLatin do
  let(:pl) { PigLatin.new }


  it "should have a translate method" do
    expect(pl.respond_to?("translate")).to eql(true)
  end

  context "Word translations" do

	  context "Consonant translation rules: " do
	    describe "Starts with single consonant" do
		    it "should translate happy to appyhay" do
		      expect(pl.translate("happy")).to eql("appyhay")
		    end
		    it "should translate duck to uckday" do
		    	expect(pl.translate("duck")).to eql("uckday")
		    end
	    end
	    describe "Starts with multiple consonants" do
	      it "should translate glove to oveglay" do
		    	expect(pl.translate("glove")).to eql("oveglay")
		    end
		    it "should translate for special case 'qu'" do
		      expect(pl.translate("quiet")).to eql("ietquay")
		    end
		    it "should translate for special case 'Qu'" do
		      expect(pl.translate("Queen")).to eql("Eenquay")
		    end
	    end
	    it "should take care of capitalization" do
	      expect(pl.translate("Banana")).to eql("Ananabay")
	    end
	  end

	  describe "Vowel translation rules:" do
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

  context "non alpha character translation" do
  	it "should not translate words that don't begin with alphabets" do
  		expect(pl.translate("234BalancedTrees")).to eql("234BalancedTrees")
  	end
  end

  context "paragraph translation" do
    # Punctuation?
  end

end