#include <iostream>
#include <iomanip>
#include <vector>
#include <cstdint>
#include <cmath>
using namespace std;

using uInt = uint64_t;

bool isPrime(uInt N){
    if( N == 2) return true;
    if(N % 2 == 0) return false;
    uInt t = 3;
    uInt limit = floor(sqrt(N));
    while(t <= limit){
        if( N % t == 0) return false;
        t+=2;
    }
    return true;
}

std::vector<uInt> findPrimesUpTo(uInt upTo){
    uInt i = 3;
    std::vector<uInt> result;
    result.push_back(2);
    result.push_back(3);
    while (i <= upTo){
        if(isPrime(i)) result.push_back(i);
        i+= 2;
    }
    return result;
}
uInt floorLog(uInt base, uInt N){
    return floor(log(N)/log(base));
}
uInt M(uInt p,uInt q,uInt N){
    uInt pLim = floorLog(p,N/q);
    uInt qLim = floorLog(q,N/p);
    uInt max = 0;
    for(uInt pExp = 1;pExp <= pLim ; pExp++){
        for(uInt qExp = 1 ; qExp <= qLim ; qExp++){
            uInt test = uInt(pow(p,pExp)*pow(q,qExp));
            if (test > max && test <= N){
                max = test;
            }
        }
    }
    return max;
}
uInt S(uInt N){
    std::vector<uInt> primes = findPrimesUpTo(N);
    auto nPrimes = primes.size();
    uInt sum  = 0;
    for (uInt pIdx = 0 ; pIdx < nPrimes; pIdx++){
        for(uInt qIdx = pIdx+1 ; qIdx < nPrimes ; qIdx++){
            auto p = primes[pIdx];
            auto q = primes[qIdx];
            sum+= M(p,q,N);
        }
    }
    return sum;
}   
int main(){
    cout << S(100) << endl;
    cout << M(2,3,100) << endl;
    cout << M(3,5,100) << endl;
    cout << M(2,73,100) << endl;
    

    return 0;
}