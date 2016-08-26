class Utility
  # Utility function to do modular exponentiation.
  # It returns (x^y) % p
  def self.power(x, y, p)
    res = 1;      # Initialize result
    x = x % p;  # Update x if it is more than or
                # equal to p
    while y > 0 do
      # If y is odd, multiply x with result
      res = (res*x) % p if y & 1 == 1

      # y must be even now
      y = y>>1 # y = y/2
      x = (x*x) % p
    end

    res
  end


  def self.power_test(n = 10)
    (1..n).each do |i|
      x = Random.rand(1..100).to_i
      y = Random.rand(1..100).to_i
      p = Random.rand(1..100).to_i

      puts "power(#{x}, #{y}, #{p}) = #{power(x, y, p)} :  (x^y) % p = #{(x**y) % p}"
    end
  end
end