n1 = 37; N1 = 80;
n2 = 25; N2 = 60;
n3 = 65; N3 = 140;
x1 = [repmat('a',N1,1); repmat('b',N2,1);repmat('c',N3,1)];
x2 = [repmat(1,n1,1); repmat(2,N1-n1,1); repmat(1,n2,1); repmat(2,N2-n2,1);; repmat(1,n3,1); repmat(2,N3-n3,1)];
[tbl,chi2stat,pval] = crosstab(x1,x2)

n11 = 33; n12 = 29; N1 = 80;
n21 = 25; n22 = 19; N2 = 60;
n31 = 102; n32 = 12; N3 = 140;
x1 = [repmat('a',N1,1); repmat('b',N2,1);repmat('c',N3,1)];
x2 = [repmat(1,n11,1); repmat(2,n12,1);repmat(3,N1-n12-n11,1);
    repmat(1,n21,1); repmat(2,n22,1); repmat(3,N2-n22-n21,1);
    repmat(1,n31,1); repmat(2,n32,1);repmat(3,N3-n32-n31,1) ];
[tbl,chi2stat,pval] = crosstab(x1(1:140),x2(1:140))
[tbl,chi2stat,pval] = crosstab(x1([1:80 141:end]),x2([1:80 141:end]))
[tbl,chi2stat,pval] = crosstab(x1([81:end]),x2([81:end]))


n11 = 4; n12 = 60; N1 = 80;
n21 = 6; n22 = 48; N2 = 60;
n31 = 8; n32 = 115; N3 = 140;
x1 = [repmat('a',N1,1); repmat('b',N2,1);repmat('c',N3,1)];
x2 = [repmat(1,n11,1); repmat(2,n12,1);repmat(3,N1-n12-n11,1);
    repmat(1,n21,1); repmat(2,n22,1); repmat(3,N2-n22-n21,1);
    repmat(1,n31,1); repmat(2,n32,1);repmat(3,N3-n32-n31,1) ];
[tbl,chi2stat,pval] = crosstab(x1(1:140),x2(1:140))
[tbl,chi2stat,pval] = crosstab(x1([1:80 141:end]),x2([1:80 141:end]))
[tbl,chi2stat,pval] = crosstab(x1([81:end]),x2([81:end]))
[tbl,chi2stat,pval] = crosstab(x1,x2)


n11 = 40; n12 = 22; N1 = 40+22+6;
n21 = 27; n22 = 15; N2 = 27+15+12;
n31 = 32; n32 = 33; N3 = 32+33+66;
x1 = [repmat('a',N1,1); repmat('b',N2,1);repmat('c',N3,1)];
x2 = [repmat(1,n11,1); repmat(2,n12,1);repmat(3,N1-n12-n11,1);
    repmat(1,n21,1); repmat(2,n22,1); repmat(3,N2-n22-n21,1);
    repmat(1,n31,1); repmat(2,n32,1);repmat(3,N3-n32-n31,1) ];
[tbl,chi2stat,pval] = crosstab(x1,x2)
