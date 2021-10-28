# Release notes for the `breqn` packages


## v0.98l (2021/10/28)

  * Prevent new LaTeX paragraph hooks from running and interfering unnecessarily with breqn internals (thanks Frank)


## v0.98k (2020/09/24)

  * Update patch code for new 2e kernel (thanks Ulrike)


## v0.98j (2020/04/19)

  * Remove `color` and `background` options from the documentation, as they have never done anything!
    (Todo: make them do something...)
  * Fix spacing bug in `dseries` with arbitrary fonts.
  * Really fix `\\genfrac` this time, making it backwards compatible with amsmath definition.
  * Revamp of `mathstyle` code for setting `\mathstyle` to ensure consistency between
    LuaTeX and other engines.
    (This was originally just a quick fix of the value of `\\mathstyle` within double
    subscripts or superscripts)


## v0.98i (2020/02/18)

  * Fix clash with new version of `babel` around use of the generic `\\@elt` command.


## v0.98h (2020/02/16)

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
