using Printf
include("primeAlgo.jl")
@time println(pop!(findPrimes(6)))


# """

# A positive integer is called square root smooth if all of its prime factors are strictly less than its square root.
#    Including the number 1 , there are 29 square root smooth numbers not exceeding 100.   
#    How many square root smooth| numbers are there not exceeding 10,000,000,000 ?

# """
# @time println(findPrimes(10001))

#@time findPrimes(10000000000)
# primeFactors(6)

# @printf("fibSum: %d\n",fibSum)