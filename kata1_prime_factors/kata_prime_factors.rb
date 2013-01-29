module KataPrimeFactors

  def self.generate(n)
    prime_factors = []

    # iterate from 2 (the first prime factor) to half the value of n.
    (2..(n/2)+1).each do |f|
        is_pf = true
        prime_factors.each do |pf|
            if f%pf == 0
                is_pf = false
                break
            end
        end
        prime_factors << f if is_pf && n%f == 0
    end
    return prime_factors
  end

end