# Write a method that returns a list of all of the divisors of the positive
# integer passed in as an argument.
# The return value can be in any sequence you wish.

def divisor?(num, div)
  num % div == 0
end

def divisors(num)
  (1..num).to_a.select do |div|
    divisor?(num, div)
  end
end

p divisors(1) == [1]
p divisors(7) == [1, 7]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]
# p divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute

def divisors_opt(num)
  result = []
  counter = 1
  while counter <= Math::sqrt(num)
    if divisor?(num, counter)
      result << counter
      other_divisor = num / counter
      result << other_divisor unless other_divisor == counter
    end
    counter += 1
  end
  result.sort
end

p divisors_opt(16) == [1, 2, 4, 8, 16]
p divisors_opt(99400891) == [1, 9967, 9973, 99400891]
p divisors_opt(999962000357) == [1, 999979, 999983, 999962000357]
