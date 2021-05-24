#include <iostream>
#include <iomanip>
#include <vector>
#include <cstdint>
#include <cmath>
using namespace std;
using uint = uint64_t;
bool isPrime(uint N){
    if( N == 2) return true;
    if(N % 2 == 0) return false;
    uint t = 3;
    uint limit = floor(sqrt(N));
    while(t <= limit){
        if( N % t == 0) return false;
        t+=2;
    }
    return true;
}

std::vector<uint> findPrimesUpTo(uint upTo){
    uint i = 3;
    std::vector<uint> result;
    result.push_back(2);
    result.push_back(3);
    while (i <= upTo){
        if(isPrime(i)) result.push_back(i);
        i+= 2;
    }
    return result;
}
double log(uint base, uint N){

    return 0.0;
}
uint M(uint p,uint q,uint N){
    uint pLim = floor(log(p,N/q));
    uint qLim = floor(log(q,N/p));
    
    
    return 0;
}
int main(){


}