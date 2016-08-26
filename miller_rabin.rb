class MillerRabin
  # This function is called for all k trials. It returns
  # false if n is composite and returns false if n is
  # probably prime.
  # d is an odd number such that  d*2<sup>r</sup> = n-1
  # for some r >= 1
  def self.miiller_test(d, n)
      # Pick a random number in [2..n-2]
      # Corner cases make sure that n > 4
      # a = 2 + rand() % (n - 4)
      a = Random.rand(2..n-2)
   
      # Compute a^d % n
      x = Utility.power(a, d, n)
   
      return true if (x == 1 || x == n-1)

      # Keep squaring x while one of the following doesn't
      # happen
      # (i)   d does not reach n-1
      # (ii)  (x^2) % n is not 1
      # (iii) (x^2) % n is not n-1
      while (d != n-1) do
        x = (x * x) % n
        d *= 2

        return false if x == 1
        return true if x == n-1
      end
   
      # Return composite
      false
  end
   
  # It returns false if n is composite and returns true if n
  # is probably prime.  k is an input parameter that determines
  # accuracy level. Higher value of k indicates more accuracy.
  def self.is_prime(n, k=4)
    # Corner cases
    return false if (n <= 1 || n == 4)
    return true if (n <= 3)

    # Find r such that n = 2^d * r + 1 for some r >= 1
    d = n - 1
    while (d % 2 == 0) do
      d >>= 1
    end

    # Iterate given nber of 'k' times
    k.times do |i|
      return false unless miiller_test(d, n)
    end

    return true
  end

  def self.get_prime(n)
    result = []
    (2..n).to_a.each do |i|
      result << i if is_prime(i)
    end

    result
  end
end