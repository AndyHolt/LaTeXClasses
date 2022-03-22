\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{hbms}[2020/11/05 Manuscript for Hebrew Bible study and translation]

\DeclareOption*{\PassOptionToClass{\CurrentOption}{article}}

\ProcessOptions\relax

\LoadClass[10pt]{article}

\RequirePackage[a4paper,landscape,
  left=5.5in,
  right=1.5in,
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
      {\@ensure@LTR{\firstxmark:\rightmark}}                      % if verse number unchanged
      {\@ensure@LTR{\firstxmark:\rightmark--\leftmark}}}           % if verse number changed
    {\@ensure@LTR{\firstxmark:\rightmark--\lastxmark:\leftmark}}  % chap number changed
}
\fancyhead[L]{\@ensure@LTR{\chverref}}
\fancyhead[C]{\LR{\@title}}
\fancyhead[R]{\LR{{\thepage} of \pageref{LastPage}}}

\newcommand{\chverreffirst}{
  \ifthenelse{\equal{\firstxmark}{\lastxmark}}    
    {\ifthenelse{\equal{\rightmark}{\leftmark}}     % if chap number unchanged
      {\firstxmark:\rightmark}                      % if verse number unchanged
      {\firstxmark:\rightmark--\leftmark}}           % if verse number changed
    {\firstxmark:\rightmark--\lastxmark:\leftmark}  % chap number changed
}
\fancypagestyle{firstpagestyle}{
  \fancyfoot{}
  \fancyhead[L]{\LR{\chverreffirst}}
  \fancyhead[C]{}
  \fancyhead[R]{\LR{{\thepage} of \pageref{LastPage}}}
}


\RequirePackage{lettrine}

\RequirePackage[vnsuper,cnplain,usebidi]{paratext}

\RequirePackage{polyglossia}
\setmainlanguage{hebrew}
\defaultfontfeatures{Ligatures=TeX}
\setotherlanguage[variant=british]{english}

\RequirePackage{fontspec}

\setmainfont{Iowan Old Style}
\setsansfont{Avenir}
\newfontfamily\hebrewfont[Script=Hebrew]{SBL BibLit}[Scale=1.3]
\newfontfamily\hebrewfontsf[Script=Hebrew]{SBL BibLit}[Scale=1.3]
\newfontfamily\englishfont{Iowan Old Style}
\newfontfamily\englishfontsf{Avenir}

\setlength{\parindent}{0pt}

\RequirePackage{leading}
\leading{50pt}

% \makeatletter
% \renewcommand{\maketitle}{
%   \begin{center}
%       \textlang{english}{\@title}
%   \end{center}
% }
% \makeatother

\renewcommand{\maketitle}{
  \thispagestyle{firstpagestyle}
  \begin{center}
    \LR{\normalfont\bfseries\@title}
  \end{center}
}

\RequirePackage[]{bidi}
