import itertools

def Eulerian(r, n):
    '''given 2 integers r, n, spits out the Betti number of the L^r_n.'''
    return [i_Eulerian(i, r, n) for i in range(0, n+1)]
        
def i_Eulerian(i, r, n):
    '''computes the i-th r-Eulerian number, as ith Betti number.'''
    jumps = valid_jumps(r, n)
    total = binomial(n, i)
    for jump in jumps: 
        mult = prod([r**j for j in jump])*factorial(n)/(prod([factorial(j) for j in jump] + [factorial(n-sum(jump))]))
        smaller_jumps = valid_M(jump)
        dim = 0
        for mu in smaller_jumps: 
            dim += binomial(n-sum(jump), i-sum(mu))
        total += mult*dim
    return total    
    
    
def valid_jumps(r, n):
    '''given 2 integers r, n, give all the allowable jumps.'''
    result = []
    for l in range(1, n+1): 
        for x in itertools.combinations_with_replacement(range(2, n+1), l):
            if sum(x) <= n:
                result.append(list(x))
    return result 

def valid_M(jump):
    '''given a jump, returns all vector of the same size as the jump, but strictly less than the jump.'''
    ranges = [range(1, i) for i in jump]
    return list(set(cartesian_product(ranges)))

Eulerian(4, 5)

        
