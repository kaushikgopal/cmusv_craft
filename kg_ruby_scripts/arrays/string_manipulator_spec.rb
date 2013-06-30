require_relative "string_manipulator"

describe StringManipulator do

  describe "remove duplicate characters" do
  	let(:sm) { StringManipulator }
  	it "should return empty string if passed an empty string" do
  		expect(StringManipulator.remove_duplicate_characters "").to eql(nil)
  	end
  	it "should return nil if nil passed in" do
  	  expect(StringManipulator.remove_duplicate_characters nil).to eql(nil)
  	end
    it "should return correctly for all duplicates" do
      expect(StringManipulator.remove_duplicate_characters "kkkkkk").to eql("k")
    end

    it "should remove duplicate characters at end of the string" do
      expect(StringManipulator.remove_duplicate_characters "kaushikk").to eql("kaushi")
    end
    it "should remove duplicate characters at start of the string" do
      expect(StringManipulator.remove_duplicate_characters "kkkkkaushi").to eql("kaushi")
    end
    it "should remove duplicate characters at start & end of the string" do
      expect(StringManipulator.remove_duplicate_characters "kkkkkaushikkkk").to eql("kaushi")
    end
    it "should not remove anything for unique string" do
      expect(StringManipulator.remove_duplicate_characters "kaushi").to eql("kaushi")
    end
    it "should not be case senstive" do
      expect(StringManipulator.remove_duplicate_characters "Kaushik").to eql("Kaushik")
    end
  end

  describe "anagram checker" do
    it 'should check the anagrams' do
      [
          ["abcd", "dcba", true],
          ["abcd", "dbca", true],
          ["abcd", "aaa", false],
          ["caaab", "aaabc", true],
          ["aaa", "aaa", true]
      ].each do |ss|
        expect(StringManipulator.check_anagrams ss[0], ss[1]).to eql(ss[2])
      end
    end
  end

end