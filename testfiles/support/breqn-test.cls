
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

