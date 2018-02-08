load "chabauty.m";


// R4P5 -- bad residue classes
// BadPrimes := [2, 3, 7, 37, 61, 569] --- 7 is good when C is saturated at 7
// (90 seconds to compute bad primes)
// Solved by CC at p := 7
Pr3<X,Y,Z,W> := ProjectiveSpace(Rationals(), 3);
qfseq := [
Y^3 + 243/98*Y^2*Z + 89/49*Y*Z^2 + 41/98*Z^3 + 27/98*Y^2*W - 27/98*X*Z*W + 243/392*Z*W^2,
X*Y^2 - 1/2*X^2*Z - 13/7*Y^2*Z - 12/7*Y*Z^2 - 3/7*Z^3 - 24/7*Y^2*W + 24/7*X*Z*W - 153/28*Z*W^2,
X^2*Y + 243/98*X^2*Z + 178/49*X*Y*Z + 24/7*Y^2*Z + 41/49*X*Z^2 + 128/49*Y*Z^2 + 4/7*Z^3 - 27/98*X^2*W - 48/7*X*Y*W - 783/49*X*Z*W - 564/49*Y*Z*W - 129/49*Z^2*W + 243/196*X*W^2 + 153/14*Y*W^2 + 1215/49*Z*W^2 - 243/196*W^3
];
C := Curve(Pr3, qfseq);
assert ChabautyColeman(C : p := 7);

// R4P5 - alternate version (too slow)
Pr4<[w]> := ProjectiveSpace(Rationals(), 4);
qfseq := [
w[2]*w[4] - 7/3*w[3]*w[4] - 5/6*w[4]^2 - w[1]*w[5] + 35/9*w[3]*w[5] + 34/9*w[4]*w[5] - 35/6*w[5]^2,
w[2]^2 - w[1]*w[3] - 5/3*w[2]*w[3] + 19/9*w[3]^2 - 1/3*w[3]*w[4] - 5/12*w[4]^2 - w[2]*w[5] + 64/27*w[3]*w[5] + 17/9*w[4]*w[5] - 305/108*w[5]^2,
w[1]*w[2] - 5*w[1]*w[3] + 37/9*w[2]*w[3] + 5/27*w[3]^2 + 1/3*w[1]*w[4] - 59/27*w[3]*w[4] - 41/27*w[4]^2 - 4/9*w[1]*w[5] - 11/3*w[2]*w[5] + 841/81*w[3]*w[5] + 703/81*w[4]*w[5] - 3061/243*w[5]^2
];
D := Curve(Pr4, qfseq);
ChabautyColeman(D : p := 17);

// N3H2 - 17 minutes   (solved by basic CC for p := 5)
// L-series computed by Stoll
// g := 6;
Pr5<[w]> := ProjectiveSpace(Rationals(), 5);
qfseq :=
[ -w[2]*w[5] + w[1]*w[6],
  -w[2]*w[4] + w[1]*w[5] + w[2]*w[5],
  -w[5]^2 + w[4]*w[6] - w[5]*w[6],
  -w[3]^2 - w[3]*w[4] + w[1]*w[6] + w[2]*w[6] + w[3]*w[6],
  w[1]^2 + 2*w[1]*w[2] - w[1]*w[4] - w[2]*w[4] + w[4]^2 - w[1]*w[5] + w[4]*w[5],
  w[1]*w[2] + 2*w[2]^2 - w[2]*w[4] - w[2]*w[5] + w[4]*w[5] + w[5]^2 - w[1]*w[6]
    - w[2]*w[6] + w[4]*w[6] + w[5]*w[6] ];
D := Curve(Pr5, qfseq);
assert ChabautyColeman(D);

// N4H3 - 27sec (solved by CC for p := 3)
// g := 5;
Pr4<[w]> := ProjectiveSpace(Rationals(), 4);
qfseq := [
w[2]^3*w[4] - 327001/225*w[2]^2*w[4]^2 - 30030923/75*w[1]*w[3]*w[4]^2 + 9706027/150*w[2]*w[3]*w[4]^2 + 14231204/25*w[1]*w[4]^3 + 651902/75*w[2]*w[4]^3 - 57911411/225*w[3]*w[4]^3 - 34328947/450*w[4]^4 + 44/5*w[2]^2*w[4]*w[5] + 95968/3*w[1]*w[3]*w[4]*w[5] - 8417/9*w[2]*w[3]*w[4]*w[5] - 50111827/30*w[1]*w[4]^2*w[5] + 23473097/450*w[2]*w[4]^2*w[5] + 41331421/75*w[3]*w[4]^2*w[5] + 82125193/450*w[4]^3*w[5] - w[2]^2*w[5]^2 - 16*w[1]*w[3]*w[5]^2 + 101/3*w[2]*w[3]*w[5]^2 - 32656/3*w[1]*w[4]*w[5]^2 + 25774/45*w[2]*w[4]*w[5]^2 + 77705/9*w[3]*w[4]*w[5]^2 - 112798583/450*w[4]^2*w[5]^2 - 1420*w[1]*w[5]^3 + 143/3*w[2]*w[5]^3 + 1261/3*w[3]*w[5]^3 - 33556/45*w[4]*w[5]^3 - 572/3*w[5]^4,
w[2]^2*w[3] - 676/15*w[2]^2*w[4] - 63323/5*w[1]*w[3]*w[4] + 20387/10*w[2]*w[3]*w[4] + 90012/5*w[1]*w[4]^2 + 1347/5*w[2]*w[4]^2 - 121886/15*w[3]*w[4]^2 - 72097/30*w[4]^3 + w[2]^2*w[5] + 1436*w[1]*w[3]*w[5] - 244/3*w[2]*w[3]*w[5] - 106975/2*w[1]*w[4]*w[5] + 49727/30*w[2]*w[4]*w[5] + 88176/5*w[3]*w[4]*w[5] + 174103/30*w[4]^2*w[5] + 1420*w[1]*w[5]^2 - 143/3*w[2]*w[5]^2 - 689/3*w[3]*w[5]^2 - 241313/30*w[4]*w[5]^2 + 572/3*w[5]^3,
w[1]^2 + 5/8*w[1]*w[3] - 5/48*w[2]*w[3] - w[1]*w[4] + 5/12*w[3]*w[4] + 5/48*w[4]^2 + 49/16*w[1]*w[5] - 5/48*w[2]*w[5] - 5/6*w[3]*w[5] - 11/48*w[4]*w[5] + 17/48*w[5]^2,
w[1]*w[2] + 13*w[1]*w[3] - 13/6*w[2]*w[3] - 23*w[1]*w[4] + 26/3*w[3]*w[4] + 13/6*w[4]^2 + 129/2*w[1]*w[5] - 13/6*w[2]*w[5] - 55/3*w[3]*w[5] - 31/6*w[4]*w[5] + 49/6*w[5]^2,
w[3]^2 + 21*w[1]*w[4] - w[2]*w[4] + 2*w[4]^2];
C := Curve(Pr4, qfseq);
ChabautyColeman(C : p:=3); // BadPrimes := [2, 3, 5, 61, 79, 3697] -- 3 is potentially good

// N4H3 - alternative model
// (solved by CC for p := 3)
// BadPrimes := ??
Pr4<[X]> := ProjectiveSpace(Rationals(), 4);
qfseq := [X[1]^2*X[4]^2 - 2935/99*X[1]*X[4]^3 + 2234/33*X[3]*X[4]^3 - 1660/33*X[4]^4 +
    5/9*X[1]^3*X[5] - 140/9*X[1]*X[3]^2*X[5] - 50/9*X[2]*X[3]^2*X[5] +
    235/9*X[3]^3*X[5] - 1226/99*X[1]^2*X[4]*X[5] + 213127/1089*X[1]*X[4]^2*X[5]
    - 1998878/3267*X[3]*X[4]^2*X[5] + 3564944/3267*X[4]^3*X[5] +
    624928/3267*X[1]^2*X[5]^2 - 4220275/3267*X[1]*X[3]*X[5]^2 +
    135275/1089*X[2]*X[3]*X[5]^2 + 6966845/3267*X[3]^2*X[5]^2 +
    755144/363*X[1]*X[4]*X[5]^2 - 9854426/3267*X[3]*X[4]*X[5]^2 -
    8633965/3267*X[4]^2*X[5]^2 - 19335241/3267*X[1]*X[5]^3 -
    2084030/3267*X[2]*X[5]^3 + 22207547/1089*X[3]*X[5]^3 -
    13562947/363*X[4]*X[5]^3 + 38910088/1089*X[5]^4,
X[1]^2*X[3] - 6*X[1]*X[3]^2 - X[2]*X[3]^2 + 8*X[3]^3 - 26/11*X[1]*X[4]^2 +
    856/165*X[3]*X[4]^2 - 442/165*X[4]^3 - 25/33*X[1]^2*X[5] -
    641/33*X[1]*X[3]*X[5] + 270/11*X[2]*X[3]*X[5] + 3013/33*X[3]^2*X[5] -
    217/11*X[1]*X[4]*X[5] + 5149/165*X[3]*X[4]*X[5] + 1376/165*X[4]^2*X[5] -
    2075/33*X[1]*X[5]^2 - 4372/33*X[2]*X[5]^2 + 5301/55*X[3]*X[5]^2 +
    4654/11*X[4]*X[5]^2 + 94344/55*X[5]^3,
X[1]*X[3]*X[4] - 162/11*X[1]*X[4]^2 + 362/11*X[3]*X[4]^2 - 254/11*X[4]^3 -
    90/11*X[1]^2*X[5] + 548/11*X[1]*X[3]*X[5] + 45/11*X[2]*X[3]*X[5] -
    745/11*X[3]^2*X[5] - 797/11*X[1]*X[4]*X[5] + 1282/11*X[3]*X[4]*X[5] +
    2459/11*X[4]^2*X[5] + 2232/11*X[1]*X[5]^2 - 370/11*X[2]*X[5]^2 -
    8312/11*X[3]*X[5]^2 + 16447/11*X[4]*X[5]^2 - 7248/11*X[5]^3,
X[3]^2*X[4] - 75/11*X[1]*X[4]^2 + 493/33*X[3]*X[4]^2 - 343/33*X[4]^3 -
    125/33*X[1]^2*X[5] + 755/33*X[1]*X[3]*X[5] + 30/11*X[2]*X[3]*X[5] -
    1006/33*X[3]^2*X[5] - 370/11*X[1]*X[4]*X[5] + 2080/33*X[3]*X[4]*X[5] +
    3389/33*X[4]^2*X[5] + 2990/33*X[1]*X[5]^2 - 740/33*X[2]*X[5]^2 -
    3774/11*X[3]*X[5]^2 + 7650/11*X[4]*X[5]^2 - 2544/11*X[5]^3,
X[1]*X[2] - 4*X[2]*X[3] - X[3]^2 + X[1]*X[4] - X[3]*X[4] + 3*X[4]^2 +
    8*X[1]*X[5] - 6*X[2]*X[5] - 8*X[3]*X[5] - 23*X[4]*X[5] - 176*X[5]^2,
X[2]^2 - X[1]*X[3] + 2*X[3]^2 + 21*X[3]*X[5],
X[2]*X[4] + 2/5*X[3]*X[4] - 4/5*X[4]^2 - X[1]*X[5] + 11/5*X[3]*X[5] -
    4/5*X[4]*X[5] + 104/5*X[5]^2];
C := Curve(Pr4, qfseq);
ChabautyColeman(C : UseReduction := false);

/*
// N4H4 -- successful for p=5 (3 hours) MISTAKE
// g := 6;
Pr5<[w]> := ProjectiveSpace(Rationals(), 5);
qfseq := [
186624*w[1]^2 - 4416768*w[2]^2 + 18313344*w[2]*w[3] - 21253392*w[3]^2 - 77760*w[1]*w[4] - 137376*w[2]*w[4] + 1834704*w[3]*w[4] + 7776*w[4]^2 - 6365592*w[3]*w[5] + 418176*w[4]*w[5] + 99000*w[5]^2 + 5870592*w[2]*w[6] - 1783056*w[3]*w[6] - 2125620*w[4]*w[6] + 269988*w[5]*w[6] + 1853495*w[6]^2,
5184*w[1]*w[2] - 33696*w[2]^2 + 112896*w[2]*w[3] - 124032*w[3]^2 - 2160*w[2]*w[4] + 10224*w[3]*w[4] - 29724*w[3]*w[5] + 3816*w[4]*w[5] - 1392*w[5]^2 + 34248*w[2]*w[6] - 21154*w[3]*w[6] - 16512*w[4]*w[6] + 7888*w[5]*w[6] + 11135*w[6]^2,
-432*w[2]^2 + 432*w[1]*w[3] + 936*w[2]*w[3] - 1380*w[3]^2 - 288*w[3]*w[5] + 72*w[4]*w[5] - 48*w[5]^2 + 432*w[2]*w[6] - 181*w[3]*w[6] - 300*w[4]*w[6] + 218*w[5]*w[6] + 141*w[6]^2,
-1296*w[2]*w[4] + 1296*w[1]*w[5] + 11160*w[3]*w[5] + 1800*w[4]*w[5] - 3900*w[5]^2 - 8856*w[2]*w[6] - 9600*w[3]*w[6] - 4800*w[4]*w[6] + 11909*w[5]*w[6] - 2400*w[6]^2,
-432*w[3]*w[4] + 2088*w[3]*w[5] + 144*w[4]*w[5] - 312*w[5]^2 + 432*w[1]*w[6] - 1800*w[2]*w[6] - 1200*w[3]*w[6] - 384*w[4]*w[6] + 904*w[5]*w[6] + 11*w[6]^2,
-72*w[3]*w[4] + 72*w[2]*w[5] + 144*w[3]*w[5] - 36*w[5]^2 - 300*w[2]*w[6] + 158*w[3]*w[6] + 36*w[4]*w[6] + 78*w[5]*w[6] - 79*w[6]^2
];
C := Curve(Pr5, qfseq);
ChabautyColeman(C : UseReduction := false);

// N4H4 - alternative model
// g := 6;
A2<t,x> := AffinePlane(Rationals());
F := (2*t^5 + t^4)*x^4 + (t^6 + 7*t^5 + 15*t^4 + 10*t^3 + 2*t^2)*x^3 + (-t^7 - 10*t^6 - 35*t^5 - 51*t^4 - 34*t^3 - 10*t^2 - t)*x^2 + (4*t^7 + 26*t^6 + 64*t^5 + 78*t^4 + 50*t^3 + 16*t^2 + 2*t)*x - 4*t^7 - 20*t^6 - 41*t^5 - 44*t^4 - 26*t^3 - 8*t^2 - t;
C := Curve(A2, F);
irr := IrreducibleComponents(C);
C := Curve(irr[2]);
D := Curve(EmbedPlaneCurveInP3(C));
UseReduction := false;
ChabautyColeman(D);
*/



// N4H4 : g := 7
Pr6<[w]> := ProjectiveSpace(Rationals(), 6);
Flst := [128*w[1]^2 + 5280*w[2]*w[3] + 11640*w[3]^2 - 12848*w[3]*w[4] - 84380*w[4]^2 - 145384*w[4]*w[5] - 167748*w[5]^2 + 288*w[1]*w[6] - 768*w[2]*w[6] + 1016*w[3]*w[6] + 14316*w[4]*w[6] + 38046*w[5]*w[6] - 21536*w[6]^2 + 816*w[1]*w[7] + 1824*w[2]*w[7] - 20300*w[4]*w[7] + 99333*w[5]*w[7] - 127732*w[6]*w[7] - 202368*w[7]^2,
64*w[1]*w[2] - 1056*w[2]*w[3] - 2112*w[3]^2 + 2184*w[3]*w[4] + 14126*w[4]^2 + 24116*w[4]*w[5] + 28410*w[5]^2 + 32*w[1]*w[6] + 144*w[2]*w[6] - 384*w[3]*w[6] - 3332*w[4]*w[6] - 7942*w[5]*w[6] + 4840*w[6]^2 - 528*w[2]*w[7] + 3282*w[4]*w[7] - 19647*w[5]*w[7] + 28488*w[6]*w[7] + 45024*w[7]^2,
32*w[1]*w[3] + 144*w[2]*w[3] + 120*w[3]^2 - 608*w[3]*w[4] - 1782*w[4]^2 - 2456*w[4]*w[5] - 3087*w[5]^2 - 16*w[2]*w[6] + 72*w[3]*w[6] + 192*w[4]*w[6] + 552*w[5]*w[6] - 248*w[6]^2 + 32*w[1]*w[7] + 72*w[2]*w[7] - 554*w[4]*w[7] + 1674*w[5]*w[7] - 1404*w[6]*w[7] - 2280*w[7]^2,
-16*w[2]*w[3] + 16*w[1]*w[4] + 52*w[3]*w[4] + 78*w[4]^2 + 36*w[4]*w[5] + 104*w[5]^2 - 8*w[3]*w[6] - 26*w[5]*w[6] - 16*w[2]*w[7] + 22*w[4]*w[7] - 117*w[5]*w[7] - 8*w[6]*w[7],
-24*w[3]^2 - 36*w[3]*w[4] + 24*w[4]^2 + 24*w[1]*w[5] + 105*w[4]*w[5] + 60*w[5]^2 - 36*w[4]*w[6] - 70*w[5]*w[6] + 64*w[6]^2 + 18*w[4]*w[7] - 144*w[5]*w[7] + 384*w[6]*w[7] + 600*w[7]^2,
64*w[2]^2 + 288*w[2]*w[3] + 240*w[3]^2 - 1032*w[3]*w[4] - 2964*w[4]^2 - 4012*w[4]*w[5] - 4753*w[5]^2 + 64*w[2]*w[6] + 144*w[3]*w[6] + 504*w[4]*w[6] + 1232*w[5]*w[6] - 624*w[6]^2 + 288*w[2]*w[7] - 924*w[4]*w[7] + 3384*w[5]*w[7] - 3696*w[6]*w[7] - 6000*w[7]^2,
-48*w[3]^2 + 48*w[2]*w[4] + 156*w[4]^2 + 372*w[4]*w[5] + 507*w[5]^2 - 48*w[4]*w[6] - 176*w[5]*w[6] + 128*w[6]^2 + 108*w[4]*w[7] - 360*w[5]*w[7] + 768*w[6]*w[7] + 1200*w[7]^2,
-4*w[3]*w[4] - 6*w[4]^2 + 4*w[2]*w[5] - 9*w[4]*w[5] - 8*w[5]^2 + 4*w[5]*w[6] - 4*w[4]*w[7] + 9*w[5]*w[7],
-4*w[4]^2 + 4*w[3]*w[5] - 6*w[4]*w[5] - 13*w[5]^2 + 4*w[5]*w[7],
-12*w[4]*w[6] - 22*w[5]*w[6] + 16*w[6]^2 + 12*w[3]*w[7] - 45*w[5]*w[7] + 96*w[6]*w[7] + 156*w[7]^2];
C := Curve(Pr6, Flst);
ChabautyColeman(C : UseReduction := false);

// C6 in X(7) paper
P2<x,y,z> := ProjectivePlane(Rationals());
F := x^4+2*x^3*y+3*x^2*y^2+2*x*y^3+18*x*y*z^2+9*y^2*z^2-9*z^4;
C := Curve(P2, F);

// curve of Gordon & Grant that is solved directly by Coleman's theorem for p:= 7: - 2sec
A2<x,y> := AffinePlane(Rationals());
F := -y^2 + x*(x-1)*(x-2)*(x-5)*(x-6);
C := Curve(A2, F);
D, m := EmbedPlaneCurveInP3(C);
D := Curve(D);
assert ChabautyColeman(D);
