
"""


If we list all the natural numbers below 10 that are multiples of 
3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
Find the sum of all the multiples of 3 or 5 below 1000.
"""
# Using a naive approach
# Look for stupid 
limit = 1000
multiples = Int64[];
# sizehint(multiples,limit)
for i = 1:(limit-1)
    if i%3 == 0 || i%5 == 0
        push!(multiples,i)
    end
end

println(sum(multiples))