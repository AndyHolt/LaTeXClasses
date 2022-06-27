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

\RequirePackage[vnsuper,cnplain]{paratext}

\RequirePackage{fancyhdr}
\RequirePackage{lastpage}
\pagestyle{fancy}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}
\fancyfoot{}
\newcommand{\chverref}{
  \IfMarksEqualTF{chap}{top}{last}
    {\IfMarksEqualTF{verse}{top}{last}          % chap number unchanged
      {\TopMark{chap}:\TopMark{verse}}          % chap & verse number unchanged
      {\TopMark{chap}:\TopMark{verse}--\LastMark{verse}}} % chap unchanged, verse changed
    {\TopMark{chap}:\TopMark{verse}--\LastMark{chap}:\LastMark{verse}} % chap changed
}
\fancyhead[L]{\chverref}
\fancyhead[C]{\@title}
\fancyhead[R]{{\thepage} of \pageref{LastPage}}

\newcommand{\chverreffirst}{
  \IfMarksEqualTF{chap}{first}{last}
    {\IfMarksEqualTF{verse}{first}{last}          % chap number unchanged on page
      {\FirstMark{chap}:\FirstMark{verse}}        % chap & verse numbers unchanged
      {\FirstMark{chap}:\FirstMark{verse}--\LastMark{verse}}}  % chap unchanged, verse changed
    {\FirstMark{chap}:\FirstMark{verse}--LastMark{chap}:\LastMark{verse}} % chap changed
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

\raggedright
