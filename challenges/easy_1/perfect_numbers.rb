# - If number <= 0, raise an error
# - Initialize an empty array to store divisors
# - Find all divisors for the integer n
#   - Iterate from 1 to n-1
#     - if element is a divisor, store into array of divisors
# - Compute the sum of all divisors
# - Compare the sum with integer n
#   - If sum == n then return 'perfect'
#   - If sum > n then  return 'abundant'
#   - If sum < n then  return 'deficient'

class PerfectNumber
  def self.classify(n)
    raise RuntimeError unless n > 0

    sum = (1...n).reduce do |acc, num|
      n % num == 0 ? acc + num : acc
    end

    return 'perfect' if sum == n
    return 'abundant' if sum > n
    'deficient'
  end
end
