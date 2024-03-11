# Author: Shiyue Li 
# Verify whether the colored Eulerian polynmoial is the same as the betti numbers of the moduli space. Answer is no. 
R = PolynomialRing(ZZ, 'x')
def excedance_poly(r, n):
    E = 0
    for i in range(n):
        f = (n*i + 1)^r*x^i
        E += f
    
    E *= (1-x)^(r+1)
    return E

for r, n in cartesian_product([range(1, 9), range(1, 9)]):
    E = excedance_poly(r, n)
    print('r = ', r, ', n = ', n, ': ', E.full_simplify())

    
        
