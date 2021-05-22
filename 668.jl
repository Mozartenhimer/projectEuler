using Printf

"""

A positive integer is called square root smooth if all of its prime factors are strictly less than its square root.
   Including the number 1 , there are 29 square root smooth numbers not exceeding 100.   
   How many square root smooth numbers are there not exceeding 10,000,000,000 ?

"""
# Unoptimized prime finder.
function isPrime(N)
   if(N == 2)
      return true
   end
   if(iseven(N))
      return false
   end
   t = 3
   limit = floor(sqrt(N))
   while(t <= limit)
      if N % t == 0
         return false
      end
      t += 2
   end
   return true 
end
function findPrimes(nPrimes)
   
   primes = [2]
   # for i = 2:upTo
   i = 3
   nFound = 1
   while(nFound < nPrimes)
      if isPrime(i)
         push!(primes,i)
         nFound += 1
      end
      i+= 2
   end
   return pop!(primes)
end
@time println(findPrimes(10001))
@time println(findPrimes(6))
#@time findPrimes(10000000000)
# primeFactors(6)

# @printf("fibSum: %d\n",fibSum)