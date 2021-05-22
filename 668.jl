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
# function primes(nPrimes:Int64)
#    # naive Prime finding
#    P = []
   
#    t::Int64 = 3;# test
#    limit = floor(sqrt(n))
#    while(t <= limit)
#       if n % t == 0
         
#       end
#       t += 2
#    end
#    show(primes)

# end
# function primeFactors(n::Int64)
   

# end

# function isSmooth()
# end
for i = 2:20
   # println(i)
   # show(isPrime(i))
   if isPrime(i)
      println(i)
   end
   # @printf("i=%d : %d\n",i,isPrime(i))
end

# primeFactors(6)

# @printf("fibSum: %d\n",fibSum)