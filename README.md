# Typst fullpage AMS template
This repository contains a customization of [Typst's standard AMS template](https://github.com/typst/templates/blob/2b629bdc1eb0edb91375b5b873725290d3bba0d7/ams/template.typ) so that it looks like TeX's `amsart` using the `fullpage` package.
We created this to match the common $\LaTeX$ format we use in our clique of colleagues, so it also features other changes.

## Example
```typst
#import "template.typ": *

#let log = $upright(log)$

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

In 1953, Roth proved that that dense enough sets $A subset.eq [N]$ must contain 3-AP, for density threshold $ delta approx frac(1,log log N)$. 

In the late 1980's, this was improved by Heath--Brown and Szemerédi to $delta approx 1/ (log N)^c$, for some small $c>0$. 
This bound was further refined in the works of Bourgain in 1999 and 2008, and Sanders in 2012 where it is shown that one can take $c = 1 slash 2$, $c = 2 slash 3$, and then $c = 3 slash 4$. 
In 2011, Sanders then obtained a density-threshold of the form $delta approx frac((log log N)^6,log N)$.
In 2016, this was further sharpened by a factor $(log log N)^2$ by Bloom and then in 2020 again by another factor $log log N$ by Schoen.
A bit later, Bloom and Sisask showed that a set $A subset.eq [N]$ with no 3-progressions must have density
$ delta = O (frac(1,(log N)^(1+c))) $ 
for some small $c>0$.
```

This compiles to
![image](https://github.com/gdahia/typst-ams-fullpage-template/assets/13017652/c6f05743-02b2-41e6-ba89-100df8922407)

This example is, in its entirety, in `example.typ`.

## Known limitations

There is a slight problem with equations, where the subsequent paragraph is not indented.
To amend this, you can add a `$zws$ #v(-15pt)` after it.
Moreover, operators and greek letters are by default italicized inside theorems, lemmas and propositions.
To fix that (in this example, the $\log$ operator), you should add
```typst
#let log = $upright(log)$
```
to force it to be look like $\LaTeX$.
