#import "template.typ": *

#let log = $upright(log)$
#let exp = $upright(exp)$
#let max = $upright(max)$
#let Gamma = $upright(Gamma)$

#show: ams-article.with(
  title: "On discrete Fourier analysis 
  and applications",
  short-title: "On discrete Fourier analysis and applications",
  authors: (
    (
      name: "Letícia Mattos",
      organization: [IMPA],
      location: [Rio de Janeiro, RJ, Brasil],
      email: "leticiadmat@gmail.com",
    ),
    // (
    //   name: "Second author",
    //   organization: [University],
    //   location: [Brazil],
    //   email: "email",
    // ),
    // (
    //   name: "Third author",
    //   organization: [University],
    //   location: [Brazil],
    //   email: "email",
    // ),
    // (
    //   name: "Fourth author",
    //   organization: [University],
    //   location: [Brazil],
    //   email: "email",
    // )
  ),
  abstract: [In this short note we introduce a few tools in discrete Fourier analysis and prove Meshulam and Roth's theorem. These notes are based on a minicourse given by Victor Souza at IMPA, summer 2024.],
  bibliography-file: "refs.bib",
)

#show: ams-stmt-rules
#show: ams-general-rules

= Lecture 1: Fourier analysis and arithmetic progressions
<introduction>

Let $(G,dot)$ be a finite abelian group. A 3-AP in $G$ is simply a set of the form ${x,x+y,x+2y} subset.eq G$ with $x eq.not y$.
Let $S subset.eq G$ be a finite subset. We define
$ r_3(S) = max {A subset.eq S: A "is 3-AP free"}. $
The main question we are interested in is: what is the size of $r_3([N])$?


In 1953, Roth proved that that dense enough sets $A subset.eq [N]$ must
contain 3-AP, for density threshold $ delta approx frac(1,log log N)$. 


In the late 1980's, this was improved by
Heath--Brown and Szemerédi to $delta approx 1/ (log N)^c$, for some small $c>0$. 
This bound was further refined in the works of Bourgain in 1999 and 2008, and Sanders in 2012 where it is shown that one can take $c = 1 slash 2$, $c = 2 slash 3$, and then $c = 3 slash 4$. 
In 2011, Sanders then obtained a density-threshold of the form $delta approx frac((log log N)^6,log N)$.
In 2016, this was further sharpened by a factor $(log log N)^2$
by Bloom and then in 2020 again by another factor $log log N$ by Schoen.
A bit later, Bloom and Sisask showed that a set $A subset.eq [N]$ with no
3-progressions must have density
$ delta = O (frac(1,(log N)^(1+c))) $ 

for some small $c>0$. 


== Behrend's construction
In the other direction, it was shown by Behrend in 1946
that for infinitely many values $N$ there are indeed subsets $A subset.eq [N]$ of density roughly $delta approx 2^(-sqrt(log N))$ which are 3-AP free.

Behrend's major idea is that if we were looking for a progression-free sets in $RR^d$, then we could use spheres. So, consider an $d$-dimensional cube $[0,n]^d sect ZZ^d$  and family of spheres $x_1^2+x_2^2+...+x_d^2 = t$ for $t=1,...,d n^2$. 
Each point in the cube is contained in one of the spheres, and so at least one of the spheres contains $n^d slash (d n^2)$ lattice points. Let us call this set $A$. 

Since spheres do not contain arithmetic progressions, $A$ does not contain any progressions either. 
Now let $f$ be a Freiman isomorphism from $A$ to a subset of $ZZ$ defined as follows. 
If $x = (x_1,x_2,...,x_d)$ is a point of $A$, then $f(x) = x_1 + x_2 (2 n) + x_3 (2 n)^2 + ... + x_d (2 n)^(d-1)$ 
That is, we treat $x_i$ as $i$'th digit of $f(x)$ in base $2 n$. 
Observe that this base was chosen so that $f$ is a Freiman isomorphism of order 2.

Note that $f(A) subset.eq {1,2,...,N = (2 n)^d}$ and that $f(A)$ is a progression-free set of size at least $n^d slash (d n^2)$.
Moreover, the density of $f(A)$ in the interval $[1,N]$ is at least 

$ frac(n^d, d n^2 N) = frac(1, d 2^(d) n^2) approx frac(1, 2^d n^2) approx frac(1,2^d N^(2/d)). $
The last approximation follows from the fact that $N = (2 n)^d$. 
the expression $2^d N^(2/d)$ is minimized when $d = sqrt(log N)$, and so we get that the density of $f(A)$ is at least $2^(-Omega(sqrt(log N))).$

In a major breakthrough, Kelley and Meka showed that Behrend's construction is essentially optimal. More precisely, they proved the following theorem.

#theorem[
  Let $N$ be a large integer. Then, there exists a subset $A subset.eq [N]$ of size at least $N e^(-(log N)^(1/11))$ which has no nontrivial 3-progressions.
]<kelley-meka>

== A bit of discrete Fourier analysis 
Let $G$ be a finite abelian group and let $A subset.eq G$ be an arbitrary subset. Define the indicator function of $A$ as

$ 1_A = cases(1 "if" x in A, , 0 "otherwise".) $

We denote by $L_2(G)$ the space of complex-valued functions on $G$ with the usual inner product, namely 
$ angle.l f,g angle.r = frac(1,|G|) sum_(x in G) f(x) overline(g(x)) = EE_(x in G) f(x) overline(g(x)). $
Observe that $L_2(G)$ is a $CC$-vector space of dimension $|G|$.

The *Physical space basis* is the set of functions $delta_z: G -> CC$ defined by 

$ delta_z (x) = cases(1 "if" x in A, , 0 "otherwise".) $

#definition[
  A character of $G$ is a group homomorphism $chi: G -> CC^*$. In other words, a character is a function $chi$ such that $chi(x+y) = chi(x) chi(y)$ for all $x,y in G$.
]

The set of characters also defines a group, called the *dual group* of $G$ and denoted by $hat(G)$.
A special character is the identity function $chi_0(x) = 1$ for all $x in G$.
Now, our next goal is to prove the following theorem.

#theorem[
  The set of characters of $G$ forms an orthonormal basis of $L_2(G)$.
]<characters-basis>

The first step is to show that the characters are indeed orthonormal is to prove the following lemma.

#lemma[
  Let $chi eq.not chi_0$ be a character of $G$. Then, 
  
  $ EE_(x in G) chi(x) = 0. $
]<characters-orthonormal>


#proof[
  Let $chi$ be a character of $G$ different from $chi_0$. As $chi eq.not chi_0$, there exists $y in G$ such that $chi(y) eq.not 1$.
  Then, we have
  $ EE_(x in G) chi(x) = EE_(x in G) chi(x+y)  = chi(y) dot EE_(x in G) chi(x). $
  Since $chi(y) eq.not 1$, we conclude that $EE_(x in G) chi(x) = 0$.
]

Now we are ready to prove @characters-basis.

#block[#emph[Proof of @characters-basis .] First, we observe that all characters have norm 1, since

$ angle.l chi,chi angle.r = EE_(x in G) chi(x) overline(chi(x)) = EE_(x in G) |chi(x)|^2 = 1. $
Now, we show that they form an orthonormal set. Let $chi,chi'$ be two characters of $G$. If $chi eq.not chi'$, then we have]




#v(5cm)






