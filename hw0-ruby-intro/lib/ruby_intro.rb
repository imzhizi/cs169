# frozen_string_literal: true

# When done, submit this entire file to the autograder.

# Part 1

def sum(arr)
  return 0 if arr.empty?

  sum = 0
  arr.each do |e|
    sum += e
  end
  sum
end

def max_2_sum(arr)
  return 0 if arr.empty?

  return arr[0] if arr.length == 1

  arr.sort! {|a, b| b <=> a}

  arr[0] + arr[1]
end

def sum_to_n?(arr, n)
  arr.each do |e|
    arr.delete e
    return true if arr.include?(n - e)
  end
  false
end

# Part 2

def hello(name)
  ('Hello, ' + name)
end

def starts_with_consonant?(s)
  return false if s.empty?

  c = s[0].downcase

  return true if (c =~ /[a-z]/i) && !(%w[a e i o u].include? c)

  false
end

def binary_multiple_of_4?(s)
  if !s.empty? && /^[0|1]*$/i =~ s && s.to_i(2) % 4 == 0
    true
  else
    false
  end
end

# Part 3

class BookInStock
  def initialize isbn, price
    raise ArgumentError if isbn == '' || price <= 0
    @isbn = isbn
    @price = price
  end


  attr_accessor 'isbn'
  attr_accessor 'price'


  def price_as_string
    format('$%.2f', price)
  end
end
