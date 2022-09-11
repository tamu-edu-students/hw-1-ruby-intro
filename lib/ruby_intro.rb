require "set"
# frozen_string_literal: true

# Part 1

def sum(arr)
  # YOUR CODE HERE
  
  #Variable to store sum of given array
  summation = 0
  
  #Iterating the given array and adding values to summation
  arr.each { |number|
    summation += number.to_i
  }
  return summation
end

def max_2_sum(arr)
  # YOUR CODE HERE
  
  #If length is zero return 0
  if arr.length() == 0
    return 0
    
  #If length is one return the first element of the given array
  elsif arr.length() == 1
    return arr.at(0)
    
  #Else calculate the two largest values in the given array
  else
    #Initializing the minimum value for comparison
    min_value = -(2 ** (0.size * 8 -2))
    largest1 = min_value
    largest2 = min_value
    
    #Iterating the given array and comparing values
    arr.each { |number|
      if number > largest1
        largest1 = number
      elsif number > largest2
        largest2 = number
      end
    }
  end
  return (largest1+largest2)
  
end

def sum_to_n?(arr, number)
  # YOUR CODE HERE
  
  #If given array length is less than 2 then return false
  if arr.length() <= 1
    return false
    
  #Else calcuate sum
  else
    #Initializing hashmap
    hash_map = {}
    
    #Iterating the given array to calculate inverse values
    for i in 0..arr.length() do
      
      #Calculating inverse value
      inverse_value = number - arr.at(i).to_i
      
      #Storing inverse value as the key and array element index as value
      hash_map[inverse_value] = i
    end
    
    #Iterating the given array
    for i in 0..arr.length() do
      
      #If inverse value matches with any given element of the array
      #then return true as sum to n is possible.
      if hash_map.key?(arr.at(i)) && i != hash_map[arr.at(i)]
        return true
      end
    end
  end
  return false;
end

# Part 2

def hello(name)
  # YOUR CODE HERE
  return ("Hello, " + name)
end

def starts_with_consonant?(string)
  # YOUR CODE HERE
  
  #Checking if length is greater than 0
  if(string.length >= 1)
    
    #Declaring and Initialzing set
    set = Set["A", "E", "I", "O", "U", "a", "e", "i", "o", "u"]
    
    #If character o string[0] is an alphabet and
    #if doesn't belong in the above set
    #then return true
    if string[0].match?(/[A-Za-z]/) && !set.include?(string[0])
      return true
    end
  end
  return false
end

def binary_multiple_of_4?(string)
  # YOUR CODE HERE
  
  # Check if string is not empty and if it only contains '0's and '1's
  if string.length > 0 && string.match?(/\A[01]+\Z/)
    
    #Since we have a valid binary string, converting it to integer
    int_value = string.to_i(2)
    
    #If the integer is a multiple of 4 then return true
    return (int_value % 4 == 0)
  end
  return false
end

# Part 3

# Object representing a book
class BookInStock
  # YOUR CODE HERE
  def initialize(isbn, price)
    
    #Checking if ISBN attribute meets the requirement
    #If not exception is raised
    raise ArgumentError.new(
      "ArgumentError: ISBN cannot be empty"
    ) if isbn.length == 0
  
    #Checking if price attribute meets the requirement
    #If not exception is raised
    raise ArgumentError.new(
      "ArgumentError: Price cannot be less than or equal to zero"
    ) if price <= 0
    
    #Storing attribute value
    @isbn = isbn
    @price = price
    
  end
  
  #Getter and setter methods for isbn and price attribute
  attr_accessor :isbn, :price
  
  #Method to convert price to appropiate format
  def price_as_string
    price_to_return = '$' + '%.2f' % @price
    return price_to_return
  end
end
