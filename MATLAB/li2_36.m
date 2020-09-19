clc;
b = [0.2,0,0];a = [1,0.3,-0.25,0.021];
[r,p,c] = residue(b,a);
[b,a]= residue(r,p,c);