
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{breqn-test}[2014/06/01 Class for breqn test files]
\LoadClassWithOptions{article}

\RequirePackage{atveryend}
\AfterLastShipout{\OMIT}

\RequirePackage[a5paper,margin=2cm]{geometry}
\pagestyle{empty}

\providecommand\AUTHOR[1]{\typeout{Author: #1}}

\def\abc{a+b+c+d+e+f+g+h+i+j+k+l+m+n+o+p+q+r+s+t+u+v+w+x+y+z}
\def\laplace{\int_0^\infty f(t)e^{-st} dt}

\tracingoutput=1\relax

\newcommand\SETBOX[2]{%
  \setbox#1=\hbox to 0pt{#2}%
  \ht#1=0pt \dp#1=0pt \wd#1=0pt
}

\newcommand\SHIPOUT[2][12]{%
  \OMIT
  \SETBOX{#1}{#2}%
  \TIMO
  \shipout\box#1\relax
  \OMIT
}
