# -*- coding: utf-8 -*-
"""
Created on Thu Feb 11 16:27:07 2016

@author: 3501124
"""


def code(ne, nj, j, x, y):
    return (j*ne*ne) + (x*ne) + y + 1

def decode(k, ne, nj):
    k = k-1
    y = k%ne
    k = k/ne
    x = k % ne
    j = k/ne
    return j,x,y
    
def clauseAuMoinsUn(l):
    res = ''    
    for i in l:
        res += str(i) + ' '
    res += '0\n'
    return res
    
def clauseAuPlusUn(l):
    res = ''
    for i in range(0, len(l)):
        for j in range(i+1, len(l)):
            res += str(-l[i]) + ' ' + str(-l[j]) + ' 0\n' 
            
    return res
            
def encoderC1(ne, nj):
    cpt = 0
    res = ''    
    for j in range(0, nj):
        for x in range(0, ne):
            l = []
            for y in range(0, ne):
                if (x != y):
                    k = code(ne, nj, j, x, y)
                    l.append(k)
                    k = code(ne, nj, j, y, x)
                    l.append(k)
                    cpt += 1
            res += clauseAuPlusUn(l)
    print str(cpt)
    return res
    
    

def union(a, b):
    return list(set(a) | set(b))

    
def encoderC2(ne, nj):
    res = ''
    for x in range(0, ne):
        for y in range(x+1, ne):
            ldom = []
            lext = []
            for j in range(0, nj):
                k1 = code(ne, nj, j, x, y)
                ldom.append(k1)
                k2 = code(ne, nj, j, y, x)
                lext.append(k2)
            res += clauseAuMoinsUn(ldom)
            res += clauseAuMoinsUn(lext)
            res += clauseAuPlusUn(ldom)
            res += clauseAuPlusUn(lext)
        
    return res
    
def encoder(ne, nj):
    res = ''
    res += encoderC1(ne,nj)
    res += encoderC2(ne,nj)
    return res
    
def genererCNF(ne, nj, filename):
    res = ''
    res += encoderC1(ne,nj)
    res += encoderC2(ne,nj)
    f = open(filename, 'w')
    f.write('c AUTO GENERATED BY AWESOME PROGRAM ENJOY\n')
    f.write('c Vous avez demandé ' + str(ne) + ' equipes dans un tournoi de ' + str(nj) + ' jours.\n')
    f.write('p cnf ' + str(((nj-1)*ne*ne) + (ne-1)*ne + (ne-2) + 1) + ' ' + str(res.count(' 0')) + '\n')
    f.write(res)
    f.close()
    
#k = code(10,10,1,1,6)
#print k
#print decode(k,10,10)
#print encoderC1(3,4)
print encoder(3,4)
genererCNF(3,6,'toast.cnf')