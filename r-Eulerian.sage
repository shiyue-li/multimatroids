import itertools

def Eulerian(r, n):
    '''given 2 integers r, n, spits out the Betti number of the L^r_n.'''
    jumps = valid_jumps(r, n)
    for jump in jumps:
        
def i_Eulerian(i, r, n):
    '''computes the i-th r-Eulerian number, as ith Betti number.'''
    
    
    
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
    result = []
    length = len(jump)
    ranges = [[1, i-1] for i in jump]
    return list(set(cartesian_product(ranges)))
    

valid_M([2, 2])
        
