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

 function findPrimes(nPrimes,startAt = 0)
   i = startAt
   if(startAt <= 3)
    primes = [2]
    i = 3
   end
    nFound = 1
    while(nFound < nPrimes)
       if isPrime(i)
          push!(primes,i)
          nFound += 1
       end
       i+= 2
    end
    return primes
 end

 function findPrimesUpTo(upTo,startAt = 0)
   i = startAt
   if(startAt <= 3)
    primes = [2]
    i = 3
   end
   while(i <= upTo)
       if isPrime(i)
          push!(primes,i)
       end
       i+= 2
    end
    return primes
 end

 function primeFactors(number::Int64)
   # Get primes up to number 
   # Get the list of primes up to sqrt
   sqrtLim::Int64 = floor(sqrt(number))
   primes = findPrimesUpTo(sqrtLim)

   divisors = Int64[]
   # For each prime in the primes, test to see if its a divisor
   for p in primes
      if number % p == 0
         push!(divisors,p)
      end
   end
   return divisors
end