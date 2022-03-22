\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{gntm}[2020/01/29 Manuscript for GNT study and translation]

\DeclareOption*{\PassOptionToClass{\CurrentOption}{article}}

\ProcessOptions\relax

\LoadClass[10pt]{article}

\RequirePackage[a4paper,landscape,
  left=1.5in,
  right=5.5in,
  top=1.0in,
  bottom=1.0in
]{geometry}

\RequirePackage{fancyhdr}
\RequirePackage{extramarks}
\RequirePackage{lastpage}
\RequirePackage{ifthen}
\pagestyle{fancy}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}
\fancyfoot{}
\newcommand{\chverref}{
  \ifthenelse{\equal{\firstxmark}{\lastxmark}}    
    {\ifthenelse{\equal{\rightmark}{\leftmark}}     % if chap number unchanged
      {\firstxmark:\rightmark}                      % if verse number unchanged
      {\firstxmark:\rightmark--\leftmark}}           % if verse number changed
    {\firstxmark:\rightmark--\lastxmark:\leftmark}  % chap number changed
}
\fancyhead[L]{\chverref}
\fancyhead[C]{\@title}
\fancyhead[R]{{\thepage} of \pageref{LastPage}}

\newcommand{\chverreffirst}{
  \ifthenelse{\equal{\firstxmark}{\lastxmark}}    
    {\ifthenelse{\equal{\rightmark}{\leftmark}}     % if chap number unchanged
      {\firstxmark:\rightmark}                      % if verse number unchanged
      {\firstxmark:\rightmark--\leftmark}}           % if verse number changed
    {\firstxmark:\rightmark--\lastxmark:\leftmark}  % chap number changed
}
\fancypagestyle{firstpagestyle}{
  \fancyfoot{}
  \fancyhead[L]{\chverreffirst}
  \fancyhead[C]{}
  \fancyhead[R]{{\thepage} of \pageref{LastPage}}
}

\RequirePackage{polyglossia}
\setmainlanguage[variant=ancient]{greek}
\defaultfontfeatures{Ligatures=TeX}
\setotherlanguage[variant=british]{english}

\RequirePackage{fontspec}

\setmainfont{Iowan Old Style}
\setsansfont{Avenir}
\newfontfamily\greekfont{Gentium Plus}[Scale=MatchLowercase]
\newfontfamily\greekfontsf{GFS Neohellenic}[Scale=MatchLowercase]

\setlength{\parindent}{0pt}

\RequirePackage{leading}
\leading{50pt}

\renewcommand{\maketitle}{
  \thispagestyle{firstpagestyle}
  \begin{center}
    \normalfont\bfseries\@title
  \end{center}
}

\RequirePackage[vnsuper,cnplain]{paratext}

\raggedright
