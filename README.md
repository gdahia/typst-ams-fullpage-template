# Typst fullpage AMS template
This repository contains a customization of [Typst's standard AMS template](https://github.com/typst/templates/blob/2b629bdc1eb0edb91375b5b873725290d3bba0d7/ams/template.typ) so that it looks like TeX's `amsart` using the `fullpage` package.
We created this to match the common $\LaTeX$ format we use in our clique of colleagues, so it also features other changes.

## Example
```typst
#import "amsart.typ": *

#show: ams-article.with(
  title: "On discrete Fourier analysis 
  and applications",
  authors: (
    (
      name: "Letícia Mattos",
      organization: [IMPA],
      location: [Rio de Janeiro, RJ, Brasil],
      email: "leticiadmat@gmail.com"
   ),
  ),
  abstract: [In this short note we introduce a few tools in discrete Fourier analysis and prove Meshulam and Roth's theorem.
These notes are based on a minicourse given by Victor Souza at IMPA, summer 2024.],
  bibliography-file: "refs.bib",
)

#show: ams-stmt-rules
#show: ams-general-rules

= Lecture 1: Fourier analysis and arithmetic progressions
<introduction>

The goal of this lecture is to introduce the definitions and ideas required to prove
#citeauthor[@Me95]'s theorem @Me95, the analogue of the theorem by #citet[@Ro53] for finite fields $FF_q^n$.

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
```

This compiles to
![image](https://github.com/gdahia/typst-ams-fullpage-template/assets/13017652/8138f4d4-1c75-45a7-8c35-fb02e4235947)

You can find a more detailed example in `example.typ`.

## Known limitations

There is a slight problem with equations, where the subsequent paragraph is not indented.
To amend this, you can add a `$zws$ #v(-15pt)` after it.
Moreover, operators and greek letters are by default italicized inside theorems, lemmas and propositions.
To fix that (in this example, the $\log$ operator), you should add
```typst
#let log = $upright(log)$
```
to force it to look like $\LaTeX$.
