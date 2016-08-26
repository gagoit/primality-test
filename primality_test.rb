require 'benchmark'
require 'prime'
require File.expand_path('../test_case.rb', __FILE__)
require File.expand_path('../utility.rb', __FILE__)
require File.expand_path('../miller_rabin.rb', __FILE__)

class PrimalityTest

  def self.check_prime
    prime_nums = TestCase.load_data

    wrong_nums = []
    prime_nums.each do |n|
      wrong_nums << n unless MillerRabin.is_prime(n, 4)
    end

    wrong_nums.empty? ? "Success" : "Failed: #{wrong_nums.join(',')}"
  end

  def self.check_get_prime(n)
    miller_result = MillerRabin.get_prime(100)
    prime_result = Prime.each(100).to_a

    a = miller_result - (miller_result & prime_result)
    a.empty? ? "Success" : "Failed: #{a.join(',')}"
  end
end

puts PrimalityTest.check_prime

puts PrimalityTest.check_get_prime(100)