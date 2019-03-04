#Q1 Create a null vector of size 10.
import numpy as np
x = np.zeros(10)
print(x)

#Q2 Create a null vector of size 10 fill the fifth value which is 1.
import numpy as np
y = np.zeros(10)
y[5] = 1
print(y)

#Q3 Create a 8x8 matrix and fill it with a checkerboard pattern.
import numpy as np
cb = np.zeros(shape=(8,8))
cb[::2,::2] = 1
cb[1::2,1::2] = 1
print('The following 8 by 8 matrix is filled a checkerboard pattern:')
print(cb)

#Q4 Create and Normalise a 5x5 random matrix
# rm = np.random.randint(10 , size =(5,5))
# rmt = np.transpose(rm)  # transpose of the random matrix
# rm_by_rmt = np.dot(rm,rmt)
# rmt_by_rm = np.dot(rmt,rm)
# print(rm)
# print(rmt)
# print (rm_by_rmt)
# print (rmt_by_rm)
# if np.allclose(rm_by_rmt, rmt_by_rm) == True: #checks whether all elements of the output matrix are equal
#     print('The 5 by 5 matrix commutes')
# else:
#     print(('The 5 by 5 matrix does not commute'))
# rmnt = np.transpose(rmn) # transpose of the normalised random matrix
# rmn_by_rmnt = np.dot(rmn,rmnt)
# rmnt_by_rmn = np.dot(rmnt,rmn)
# a matrix is normal if A x A* = A* x A. The following checkes whether this is true
# if np.allclose(rmn_by_rmnt,rmnt_by_rmn) == True: #checks whether all elements of the output matrix are equal
#     print('The 5 by 5 matrix is normal')
# else:
#     print(('The 5 by 5 matrix is not normal'))

rm = np.random.rand(5,5)
rmmax,rmmin = rm.max(), rm.min()
rmn = (rm - rmmin)/(rmmax - rmmin) # normalised random matrix
print('The following matrix is a normalised 5 by 5 matrix of random numbers:')
print(rmn)

#Q5 Multiply a 5x3 matrix by a 3x2 matrix (Dot product).
import numpy as np
rm53 = np.random.randint(-10,10, (5,3))
rm32 = np.random.randint(-10,10, (3,2))
print ('The following matrix is a random 5 by 3 matrix of integers between -10 and 10:')
print (rm53)
print ('The following matrix is a random 3 by 2 matrix of integers between -10 and 10:')
print (rm32)
print ('The dot product of these two matrices is:')
rm53_by_rm32 = np.dot(rm53,rm32)
print (rm53_by_rm32)

#Q6 Find out if the vector represented by (−16, 3, 5) is orthogonal to
#   a = (1,−3,5) and b = (2,−1,7).
import numpy as np
a = np.array([1,-3,5])
b = np.array([2,-1,7])
a_dot_b = np.dot(a,b)
print ('vector a = ',b)
print ('vector b = ',b)
print ('a dot b = ',a_dot_b)
if a_dot_b == 0: # a and b are othogonal if the dot product of a and b is 0
    print('The dot product of vectors a and b is',a_dot_b,'therefore a and b are othogonal vectors.')
else:
    print('The dot product of vectors a and b is',a_dot_b,'therefore a and b are not othogonal vectors.')

# Q7 work out the determinant and inverse of a 3 by 3 matrix
import numpy as np
A = np.array([[1,5,2],[2,3,-1],[0,1,-5]])
print ('Let A = ')
print (A)
det_A = np.linalg.det(A)
print ('The determinant of A is :',np.rint(det_A))
inv_A = np.linalg.inv(A)
print ('The inverse of A is :')
print (inv_A)
chk = np.dot(A,inv_A)
print ('Check that A dot the inverse of A is the identity matrix:')
print (np.rint(chk))

# Q8 Solve for x1 and x2
import numpy as np
A = np.array([[1,3],[1,2]])
B = np.array([2,0])
print ('The matrix A is:')
print (A)
print ('The vector B is:')
print (B)
solve_AB = np.linalg.solve(A,B)
print ('AX = B when x1 and x2 are [x1 x2]:')
print (solve_AB)

# Q9 Find the critical points of the equation and the minimum under the contraint 0<x<1
# f = x^3 - 2*x^2 + x
from sympy import *
x, y, z, t = symbols('x y z t')
# k, m, n = symbols('k m n', integer=True)
# f, g, h = symbols('f g h', cls=Function)
print ('The first derivative of x**3 - 2*x**2 + x is:')
f = x**3 - 2*x**2 + x
f_dx = diff(f,x)
print (f_dx)
print ('The critical points of ',f,'occur when x=')
cp = solve(f_dx,x)
print (cp)
print ('The second derivative of x**3 - 2*x**2 + x is:')
f_dx2 = diff(f_dx,x)
print (f_dx2)

#Evaluate the function for x bound by 0 and 1 and at the solutions to the first derivative
f_at_0 = f.subs(x,0)
f_at_1 = f.subs(x,1)
f_at_cp0 = f.subs(x,cp[0])
f_at_cp1 = f.subs(x,cp[1])
f_dx2_cp0 = f_dx2.subs(x, cp[0])
f_dx2_cp1 = f_dx2.subs(x, cp[1])
print ('The local maximum occurs when the second derivative is negative. Check the first point x =',cp[0],':')
if f_dx2_cp0 < 0:
    print ('At x =',cp[0],'the second derivative is',f_dx2_cp0, 'which corresponds to a local maxima.')
    if (f_at_cp0 > f_at_0) & (f_at_cp0 > f_at_1):
        print ('This is also the local maxima for x bound by [0,1] and the local maxima is f =',f_at_cp0)
    elif (f_at_0 > f_at_cp0) & (f_at_0 > f_at_1):
        print ('But f(0) is greater than f at the first critical point.')
    else:
        print ('But f(1) is greater than f at the first critical point.')
else:
    print ('At x =',cp[0],'the second derivative is',f_dx2_cp0, 'which corresponds to a local minima.')

print('Check the second critical point x=',cp[1],':')
if f_dx2_cp1 < 0:
    print ('At x =',cp[1],'the second derivative is',f_dx2_cp1, 'which corresponds to a local maxima.')
    if (f_at_cp0 > f_at_0) & (f_at_cp0 > f_at_1):
        print ('This is also the local maxima for x bound by [0,1] and the local maxima is f =',f_at_cp0)
    elif (f_at_0 > f_at_cp0) & (f_at_0 > f_at_1):
        print ('But f(0) is greater than f at the first critical point.')
    else:
        print ('But f(1) is greater than f at the first critical point.')
else:
    print ('At x =',cp[1],'the second derivative is',f_dx2_cp1, 'which corresponds to a local minima.')

# Q10 Constrained optimisation problem: maximumise f(x,y,z) = xy + yz
#     with the constraints x + 2y = 6 and x - 3z = 0
from sympy import *
x, y, z, t, L, l, u = symbols('x y z t L l u')
k, m, n = symbols('k m n', integer=True)
f, g, h = symbols('f g h', cls=Function)
f= x*y + y*z
g = x + 2*y - 6
h = x - 3*z
L = f - l*g - u*h
L_dx = diff(L,x)
L_dy = diff(L,y)
L_dz = diff(L,z)
L_dl = diff(L,l)
L_du = diff(L,u)
print(L)
#print(L_dx)
#print(L_dy)
#print(L_dz)
#print(L_dl)
#print(L_du)
#cpx = solve(L_dx,x,y,z,l,u)
#cpy = solve(L_dy,x,y,z,l,u)
#cpz = solve(L_dz,x,y,z,l,u)
cpa = solve(L_dx,L_dy,L_dz,L_dl,L_du,x,y,z,l,u)

#print(cpx)
#print(cpy)
#print(cpz)
print(cpa)
#L_dx_0 = L_dx.subs(L_dx,0)
#L_dy_0 = L_dx.subs(L_dy,0)
#L_dz_0 = L_dx.subs(L_dz,0)
#L_dl_0 = L_dx.subs(L_dl,0)
#L_du_0 = L_dx.subs(L_du,0)
#solve(L_dx,L_dy,L_dz,L_dl,L_du)
#print(L_dx_0)
#solve(L_dx_0,L_dy_0,L_dz_0,L_dl_0,L_du_0)
#print(sols)
#from sympy.physics.mechanics import *
#LM = LagrangesMethod(L, [x,y,z,l,u])
