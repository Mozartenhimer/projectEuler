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
function M1(p::Int,q::Int,N::Int)
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

function M2(p::Int64,q::Int64,N::Int64)
    # Compute the limits of the search space
    # Try to conservce some space by dividing out q from pLim vice versa
    pLim = Int64(floor(log(p,N/q)))
    qLim = Int64(floor(log(q,N/p)))
    # search the p, q exponent space
    
    
    # Flag bools in here as true as you find things
    if (pLim == 0 || qLim == 0)
        return 0
    end
    searchMatrix = falses(pLim,qLim)
    searchMatrix[pLim,qLim] = true

    bestSoFar::Int64 = 0
    currentCandidate::Int64 = 0
    # ip & iq -> p and q index
    iq = qLim
    # Iterate each row up the search Matrix
    while iq > 0 && searchMatrix[pLim,iq]
        # Iterate from left to right down p
        ip = pLim
        currentCandidate = p^pLim*q^iq
        while searchMatrix[ip,iq]
            if currentCandidate > N
                # Set the up and left cells to true that they need a visit
                searchMatrix[ip-1,iq] = true
                searchMatrix[ip,iq-1] = true
            else # currentCandidate <= N 
                if currentCandidate > bestSoFar 
                    bestSoFar = currentCandidate
                    break
                end
            end
            currentCandidate /= p
            ip -= 1
        end
        iq -= 1
    end
    return bestSoFar
end


function S2(N)
    # primes = findPrimesUpTo(floor(sqrt(N)))
    primes = findPrimesUpTo(N)
    nPrimes = length(primes)
    sum =0
    for pIdx = 1:nPrimes
        for qIdx = pIdx+1:nPrimes
            p=primes[pIdx]
            q=primes[qIdx]
            # println("p=",p,"q=",q)
            sum += M2(p,q,N)
        end
    end
    return sum
end
function S1(N)
    # primes = findPrimesUpTo(floor(sqrt(N)))
    primes = findPrimesUpTo(N)
    nPrimes = length(primes)
    sum = 0
    for pIdx = 1:nPrimes
        for qIdx = pIdx+1:nPrimes
            p=primes[pIdx]
            q=primes[qIdx]
            # println("p=",p,"q=",q)
            sum += M1(p,q,N)
        end
    end
    return sum
end

function S_inline(N)
    # primes = findPrimesUpTo(floor(sqrt(N)))
    primes = findPrimesUpTo(N)
    nPrimes = length(primes)
    sum =0
    for pIdx = 1:nPrimes
        for qIdx = pIdx+1:nPrimes
            p=primes[pIdx]
            q=primes[qIdx]

            pLim = Int(floor(log(p,N/q)))
            qLim = Int(floor(log(q,N/p)))
            # search the p, q exponent space
            max = 0
            for pExp::Int = 1:pLim
                for qExp::Int = 1:qLim
                    test = p^pExp*q^qExp # Belka Typed this: fvbgh bntfhgvefrd34
                #    println(test)
                    if test > max && test <= N
                        max = test
                    end
                end
            end
            sum += max
        end
    end
    return sum
end
function updateMax!(max,newNumber)
    if (newNumber > max)
        max = newNumber
    end
end
function S_inlineLoopChange(N)
    # primes = findPrimesUpTo(floor(sqrt(N)))
    primes = findPrimesUpTo(N)
    nPrimes = length(primes)
    pMax = primes[end]

    # primeBest = zeros(N)  
    # primeFlag = -1
    # pIdx = 1
     
    # for i in 1:pMax
    #     if i == primes[pIdx] 
    #         primeBest[i] = primeFlag
    #         pIdx += 1 
    #     end
    # end

    sum = 0
    
    for pIdx = 1:nPrimes
        for qIdx = pIdx+1:nPrimes
            p=primes[pIdx]
            q=primes[qIdx]
            for n in primes
                if p*q > n
                    continue
                end

                testExp::Int64 = floor(log(q,n/p))
                pExpStop::Int64 =    floor(log(p,n/q))
                pExp::Int64 = 1
                test::Int64 = q^testExp*p
                max = 0
                while pExp <= pExpStop
                    if test <= n # Move right by multiply
                        if (test > max) max = test end
                        test = test * p
                        pExp += 1
                    else # if test > n, move up by divid
                        test = test ÷ q # integer divide
                    end
                end   
                sum += max
            end
            
        end
    end
    # sum =0
    # for pIdx = 1:nPrimes
    #     for qIdx = pIdx+1:nPrimes
    #         p=primes[pIdx]
    #         q=primes[qIdx]

    #         pLim = Int(floor(log(p,N/q)))
    #         qLim = Int(floor(log(q,N/p)))
    #         # search the p, q exponent space
    #         max = 0
    #         for pExp::Int = 1:pLim
    #             for qExp::Int = 1:qLim
    #                 test = p^pExp*q^qExp # Belka Typed this: fvbgh bntfhgvefrd34
    #                 #    println(test)
    #                 if test > max && test <= N
    #                     max = test
    #                 end
    #             end
    #         end
    #         sum += max
    #     end
    # end
    return sum
end

function S(N) return S_inlineLoopChange(N) end
function M(p,q,N) return  M2(p,q,N) end
# println("M(2,3,100) = ", M(2,3,100))
# @assert M(2,3,100) == 96 "M(2,3,100) == 96 did not pass" 

# println("M(3,5,100) = ",M(3,5,100));
# @assert M(3,5,100) == 75 "M(3,5,100) == 75 did not pass"

# @assert M(2,73,100) == 0 "Zero spec didn't pass"

S(100)

# @assert S(1000) == 193408 "S(1000) not correct "
# @assert S(100)  == 2262   "S(100) not correct "
println("All asserts passed")

println("S_inline:")
@time S_inline(10000)
println("S_inlineLoopChange:")
@time S_inlineLoopChange(10000)

test = 100
println("S(", test,")=",S(test))
test = 1000
println("S(", test,")=",S(test))

# The Real Problem
N = 10000000
# S(N)