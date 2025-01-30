from math  import exp
def suite(a,n):
    if n!= 0 :
        return suite(n-1,exp(2*a)-1)
    return a

suite = lambda a, n: suite(n-1, exp(2*a)-1) if n != 0 else a