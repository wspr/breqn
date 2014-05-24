# The BREQN packages

This is the latest repository for the breqn package, originally developed by Michael J. Downes and later taken over by Morten Høgholm.

The version of the package here will be used as the source for current CTAN releases.

Internal updates are planned but no major development is expected. Contributors welcome --- if you dare.

Feedback should be directed to the Issue Tracker at:  
  <https://github.com/wspr/breqn/issues>

## Installation

Running TeX on each dtx file extracts the runtime files. See the dtx
files for details.

## The code

### breqn

The breqn package facilitates automatic line-breaking of displayed
math expressions. The package was originally developed by Michael
J. Downes.

### flexisym

This package turns math symbols into macros.
Is is required by breqn so that breqn can make intelligent decisions
with respect to line-breaking and other details.

### mathstyle

Ensures uniform syntax for math subscript (_) and superscript (^)
operations so that they always take exactly one argument.
Grants access to the current mathstyle which eases several tasks such
as avoiding the many pitfalls of \mathchoice and \mathpalette.
This package is used by flexisym.

