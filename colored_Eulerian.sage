# Author: Shiyue Li 
# Verify whether the colored Eulerian polynmoial is the same as the betti numbers of the moduli space. Answer is no. 
# The formula of excedance polynomial is by Theorem 17 of https://www.sciencedirect.com/science/article/pii/S0195669884710213?ref=cra_js_challenge&fr=RR-1. 



R = PolynomialRing(ZZ, 'x')
def excedance_poly(r, n):
    E = 0
    for i in range(n):
        f = (n*i + 1)^r*x^i # there may be an issue here because I don't know the degree of the polynomial here. 
        E += f
    
    E *= (1-x)^(r+1)
    return E

for r, n in cartesian_product([range(1, 9), range(1, 9)]):
    E = excedance_poly(r, n)
    print('r = ', r, ', n = ', n, ': ', E.full_simplify())

    
        
