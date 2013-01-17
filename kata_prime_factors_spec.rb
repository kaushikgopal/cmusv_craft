require_relative 'kata_prime_factors'

describe "Prime Factors" do
  [
    [1,[]],
    [6,[2,3]],
    [10,[2,5]],
    [30,[2,3,5]]
  ].each do |n, factors|
      it "should return #{factors} for N = #{n} " do
          KataPrimeFactors.generate(n).should == factors
      end
  end

  # it "should return an empty list for N = 1" do
  #   KataPrimeFactors.generate(1).should == []
  # end
  # it "should return [2,3] for N = 6" do
  #   KataPrimeFactors.generate(6).should == [2,3]
  # end
  # it "should return [2,5]  for N = 10" do
  #   KataPrimeFactors.generate(10).should == [2,5]
  # end
  # it "should return [2,3,5]  for N = 30" do
  #   KataPrimeFactors.generate(30).should == [2,3,5]
  # end

end

