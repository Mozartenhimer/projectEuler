using Printf

"""



Comparing two numbers written in index form like 211 and 37 is not difficult,
 as any calculator would confirm that 211 = 2048 < 37 = 2187.

However, confirming that 632382518061 > 519432525806 would be much more difficult, as both numbers contain over three million digits.

Using base_exp.txt (right click and 'Save Link/Target As...'), a 22K text file containing one thousand lines with a base/exponent pair on each line, determine which line number has the greatest numerical value.

NOTE: The first two lines in the file represent the numbers in the example given above.

"""

# Using a naive approach
# Look for stupid 
limit = Int64(4E6)
# limit = 10
#fibSum  = Int64(0)

fib1 = 1
fib2 = 1
fib = 0
fibSum=0
while fib < limit
     fib = fib1 + fib2
     fib2 = fib1
     fib1 = fib
     if fib % 2 == 0
        fibSum += fib
     end
end

@printf("fibSum: %d\n",fibSum)