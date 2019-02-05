# When done, submit this entire file to the autograder.

# Part 1

def sum arr
	accum = 0
	arr.each do |el|
		accum = accum + el
	end
	accum
end

def max_2_sum arr
	size = arr.length
	if size == 0
		0
	elsif size == 1
		arr[0]
	else
		# Base cases ensure arr has >= 2 elements
		first_big = arr[0]
		second_big = arr[1]
		# Initial check
		if second_big > first_big
			first_big = arr[1]
			second_big = arr[0]
		end	
		# Loop invariant: first_big and second_big are, in order, 
		# 				  the two biggest elements of arr[0..i]
		arr[2..size-1].each do |el|
			if el > first_big
				second_big = first_big
				first_big = el
			elsif el > second_big
				second_big = el
			end
		end
		first_big + second_big
	end
end

def sum_to_n? arr, n
	arr.sort!
	size = arr.length
	# Brute force -- bc elements in arr have no constraints
	for i in 0..size-1 do
		for j in 0..size-1 do
			if i != j			# cannot consider multiple of one entry
				if (arr[i] + arr[j]) == n
					return true	# early return
				end
			end
		end
	end
	false
end

# Part 2

def hello(name)
	"Hello, " + name
end

def starts_with_consonant? s
	size = s.length
	if size == 0
		false
	else
		first_letter = s[0]
		if first_letter =~ /[[:alpha:]]/			# alphabetic character check
			if !(first_letter =~ /[aeiouAEIOU]/)	# vowel check
				return true
			end
		end
	end
	false
end

def binary_multiple_of_4? s
	# valid binary number check
	s.split('').each do |char|
		if !(char =~ /[01]/)
			return false
		end
	end
	# multiple of 4 X..X00
	size = s.length
	if size == 1 and s[0] =~ /[0]/							# zero case
		return true
	elsif size < 3											# < 4 case (for indexing)
		return false
	else
		if s[size-1] =~ /[1]/ or s[size-2] =~ /[1]/			# ones or twos must be 0
			return false
		elsif s[0..size-3] =~ /[1+]/						# entire string is not 0
			return true
		end
	end
	false
end

# Part 3

class BookInStock
	#attr_reader :isbn, :price
	#attr_writer :isbn, :price
	
	def initialize(isbn, price)
		if isbn.length == 0
			raise ArgumentError.new("isbn cannot be empty string")
		end
		if price <= 0
			raise ArgumentError.new("Price must be greater than zero")
		end
		@isbn = isbn
		@price = price
	end
	
	def isbn
		@isbn
	end
	
	def isbn=(isbn)
		if isbn.length == 0
			raise ArgumentError.new("isbn cannot be empty string")
		end
		@isbn = isbn
	end
	
	def price
		@price
	end
	
	def price=(price)
		if price <= 0
			raise ArgumentError.new("Price must be greater than zero")
		end
		@price = price
	end
	
	def price_as_string
		price_decimal = price % 1
		price_thousands_decimal = (price * 10) % 1
		price_formatted = "$" + price.to_s
		if price_decimal == 0
			price_formatted = price_formatted + ".00"
		elsif price_thousands_decimal == 0
			price_formatted = price_formatted + "0"
		end
		price_formatted
	end
end
