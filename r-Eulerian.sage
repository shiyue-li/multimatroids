# Author: Shiyue, based on Theorem 4.17 of [CDLR].

import itertools
t = var('t')


def eulerian(r, n):
    '''given 2 integers r, n, spits out the Betti numbers of the L^r_n.'''
    return [i_eulerian(i, r, n) for i in range(0, n+1)]
        
def i_eulerian(i, r, n):
    '''computes the i-th r-Eulerian number, as the i-th Betti number.'''
    jumps = valid_jumps(n, )
    total = binomial(n, i) # k-th betti number of (P^1)^n

    for jump in jumps: 
        # number of chains of jump, denoted as N_j in the paper 
        mult = prod([r**j for j in jump]) * factorial(n)/(prod([factorial(j) for j in jump] + [factorial(n-sum(jump))]))

        smaller_jumps = valid_mu(jump)
        dim = 0
        for mu in smaller_jumps: 
            dim += binomial(n-sum(jump), i-sum(mu))
        total += mult * dim
    return int(total)    
    
def valid_jumps(n):
    '''given 2 integers n, gives all the allowable jumps (or jump types).'''
    jumps = []
    for l in range(1, n + 1):
        # Generate all possible combinations (ordered, with duplicates)
        sequences = ordered_sequences(n, l)
        if sequences != []:
            for seq in sequences:
                jumps.append(seq)
    return jumps 

def valid_mu(jump):
    '''given a jump, returns all vector of the same size as the jump, but strictly less than the jump.'''
    ranges = [range(1, j) for j in jump]
    result = list(set(cartesian_product(ranges)))
    return result 

def ordered_sequences(n, l):
    """Generate ordered sequences where:
       - each element at least 2
       - sum is less than equal to n
       - has fixed length l
       - treats permutations, e.g. (2,3) and (3,2), as distinct
    """
    result = []
    # Generate sequences of specific length
    for seq in itertools.product(range(2, n+1), repeat=l):
        if sum(seq) <= n:
            result.append(seq)
    return result

def is_log_concave(L):
    '''given a list of numbers, checks if log_concave.'''
    return all(L[i-1]*L[i+1] <= L[i]**2 for i in range(1, len(L)-1))


## the type B Eulerian polynomial
def type_B_eulerian(n):
    ans = 0
    for k in range(n+1):
        for i in range(1,k+1):
            ans = ans + (-1)^(k-i) * binomial(n,k-i) * (2*i-1)^(n-1) * t^(k-1)
    return ans

## Hilbert series of the L^r_n
def multi_eulerian(r, n):
    '''given 2 integers r, n, returns the Hilbert series of the L^r_n.'''
    return sum([eulerian(r, n)[i]*t^i for i in range(0, n+1)])



for r in range(2, 3):
    for n in range(r+4, r+10):
        print(f"{r, n}-Eulerian: {multi_eulerian(r, n)}")
        print(f"type B Eulerian: {type_B_eulerian(n+1)}")
        print()

        
