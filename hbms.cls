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

\RequirePackage[vnsuper,cnplain,usebidi]{paratext}

\RequirePackage{fancyhdr}
\RequirePackage{lastpage}
\pagestyle{fancy}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}
\fancyfoot{}
\newcommand{\chverref}{
  \IfMarksEqualTF{chap}{top}{last}
    {\IfMarksEqualTF{verse}{top}{last}          % chap number unchanged
      {\@ensure@LTR{\TopMark{chap}:\TopMark{verse}}}          % chap & verse number unchanged
      {\@ensure@LTR{\TopMark{chap}:\TopMark{verse}--\LastMark{verse}}}} % chap unchanged, verse changed
    {\@ensure@LTR{\TopMark{chap}:\TopMark{verse}--\LastMark{chap}:\LastMark{verse}}} % chap changed
}
\fancyhead[L]{\textenglish{\@ensure@LTR{\chverref}}}
\fancyhead[C]{\LR{\@title}}
\fancyhead[R]{\textenglish{\LR{{\thepage} of \pageref{LastPage}}}}

\newcommand{\chverreffirst}{
  \IfMarksEqualTF{chap}{first}{last}
    {\IfMarksEqualTF{verse}{first}{last}          % chap number unchanged on page
      {\@ensure@LTR{\FirstMark{chap}:\FirstMark{verse}}}        % chap & verse numbers unchanged
      {\@ensure@LTR{\FirstMark{chap}:\FirstMark{verse}--\LastMark{verse}}}}  % chap unchanged, verse changed
    {\@ensure@LTR{\FirstMark{chap}:\FirstMark{verse}--LastMark{chap}:\LastMark{verse}}} % chap changed
}
\fancypagestyle{firstpagestyle}{
  \fancyfoot{}
  \fancyhead[L]{\textenglish{\LR{\chverreffirst}}}
  \fancyhead[C]{}
  \fancyhead[R]{\textenglish{\LR{{\thepage} of \pageref{LastPage}}}}
}


\RequirePackage{lettrine}

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

% Definitions of commands useful for layout and setting of Hebrew text in
% particular (spin out into a standalone package if it is needed by other
% classes)

% hemistich space (dividing a colon, i.e. line, in two)
\newcommand{\hem}{\hspace{2ex}}

\RequirePackage[]{bidi}
