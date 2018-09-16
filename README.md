
# The BREQN packages

This is the latest repository for the breqn package, originally developed by
Michael J. Downes and later taken over by Morten Høgholm.
Will Robertson currently manages the code but without time for major development.

* CTAN URL: <https://ctan.org/pkg/breqn>
* Feedback/bugs: <https://github.com/wspr/breqn/issues>
* Change history: [CHANGES.md](./CHANGES.md)

## Installation

The `breqn` packages are distributed in the major TeX distributions so manual installation
is only necessary if you wish to install pre-release versions or contribute to the development
of the package.

Individually, running `pdftex` on each dtx file extracts the runtime files.
As a package, `l3build install` will extract the needed files and install them locally.



# The code

## breqn

The breqn package facilitates automatic line-breaking of displayed
math expressions.

## flexisym

This package turns math symbols into macros.
It is required by breqn so that breqn can make intelligent decisions
with respect to line-breaking and other details.

## mathstyle

Ensures uniform syntax for math subscript (_) and superscript (^)
operations so that they always take exactly one argument.
Grants access to the current mathstyle which eases several tasks such
as avoiding the many pitfalls of \mathchoice and \mathpalette.
This package is used by flexisym.


