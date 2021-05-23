include("primeAlgo.jl")
using Printf
# Problem 347

# The largest integer ≤ 100 that is only divisible by 
#  both the primes 2 and 3 is 96, as 96=32*3 =2⁵*3.
#
#  For two distinct primes p and q let M(p,q,N)
#  be the largest positive integer ≤N only divisible 
# by both p and q and M(p,q,N)=0 if such a positive 
# integer does not exist.

#     E.g. M(2,3,100)=96.
#     M(3,5,100)=75 and not 90 because 90 is divisible by 2 ,3 and 5.
#     Also M(2,73,100)=0 because there does not exist a positive integer ≤ 100 that is divisible by both 2 and 73.
    
#     Let S(N) be the sum of all distinct M(p,q,N). S(100)=2262.
    
#     Find S(10 000 000).
function M(p::Int,q::Int,N::Int)
    # Compute the limits of the search space
    # Try to conservce some space by dividing out q from pLim vice versa
    pLim = Int(floor(log(p,N/q)))
    qLim = Int(floor(log(q,N/p)))
    # search the p, q exponent space
    max = 0
    for pExp::Int = 1:pLim
        for qExp::Int = 1:qLim
           test = p^pExp*q^qExp
        #    println(test)
           if test > max && test <= N
                max = test
            end
        end
    end
    return max
end
function S(N)
    # primes = findPrimesUpTo(floor(sqrt(N)))
    primes = findPrimesUpTo(N)
    nPrimes = length(primes)
    sum =0
    for pIdx = 1:nPrimes
        for qIdx = pIdx+1:nPrimes
            p=primes[pIdx]
            q=primes[qIdx]
            # println("p=",p,"q=",q)
            sum += M(p,q,N)
        end
    end
    return sum
end

@assert M(2,3,100) == 96 "Given did not pass" 
@assert M(3,5,100) == 75 "Given did not pass"
@assert M(2,73,100) == 0 "Zero spec didn't pass"
test = 100
println("S(", test,")=",S(test))

@assert S(100) == 2262 "S(N) not correct "
println("All asserts passed")
@time(S(100))
@time(S(1000))
@time(S(10000))
# println(S(10000000))