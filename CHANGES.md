# Release notes for the `breqn` packages

## v0.98h (2019/10/15)

  * No longer redefine LaTeX2e's `\\@ifstar` command, use a custom prefix instead.
    This fixes a bizarre conflict with a combination of the `thm-restate` and `cleveref` packages.
  * Use a prefix for `\\@optarg`, similar chance of potential conflict.
  * Fix bug in `\\genfrac`.
  * Allow `mathtools` to be loaded after `breqn` (by preloading `graphicx` always).


## v0.98g (2019/10/15)

  * Fix for robustness change in LaTeX 2019.


## v0.98f (2018/09/14)

  * Insert `\nolinenumbers` inside maths environments if the `lineno` package is loaded.
    It would be better to insert a line number, but at least with this the document still compiles!


## v0.98e (2017/01/27)

  * Fix in `\mathchoice` to allow use under recent versions of LuaTeX
