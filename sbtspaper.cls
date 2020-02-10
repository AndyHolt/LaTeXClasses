\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{sbtspaper}[2019/03/19 SBTS paper class]

% Pass options to article class
\DeclareOption*{\PassOptionToClass{\CurrentOption}{article}}

\ProcessOptions\relax

\LoadClass[12pt]{article}

% fontspec package, sets up use of OpenType fonts
\RequirePackage{fontspec}

% setup standard page
\RequirePackage[letterpaper, portrait, left=1.0in, right=1.0in, top=1.0in,
bottom=1.0in]{geometry}

% Set font
\RequirePackage{fontspec}
\setmainfont{Times New Roman}

% setup for left justification, no justification at right margin
\RequirePackage{ragged2e}
\setlength{\RaggedRightParindent}{0.7in}
\setlength{\parindent}{0.7in}
\RaggedRight

% fonts for greek and hebrew
\usepackage{polyglossia}

%% Turn off Hebrew typesetting for now. Seems to cause some issues, can work
%% them out when I need it!
\setmainlanguage[variant=british]{english}
% \setotherlanguage{hebrew}
\setotherlanguage[variant=ancient]{greek}
% \newfontfamily\hebrewfont{SBL BibLit}
\newfontfamily\greekfont{SBL BibLit}

% leading
\RequirePackage{leading}
\leading{24pt}

%% Make command for adding extra gap at top of first page of main content and
%% first page of bibliography
%% Modified version of command from drdrang's drangreport class:
%% https://github.com/drdrang/drangreport/blob/master/drangreport.sty
\newcommand{\pagedrop}{%
\vspace*{0.7in}%
}

%% Set up package to position text on title page
\RequirePackage{textpos}

\newcommand{\fromtop}[1]{%
  \dimexpr-1in-\topskip-\topmargin-\headheight-\headsep+#1\relax
}
\newcommand{\fromleft}[1]{%
  \dimexpr-1in-\oddsidemargin+#1\relax
}

%% setup title
\renewcommand{\maketitle}{
  \begin{titlepage}
    \setlength{\parindent}{0pt}

    \begin{textblock*}{5in}(\fromleft{0.5\paperwidth-2.5in},\fromtop{2in})
      \centering
      \MakeUppercase{\@title}
    \end{textblock*}

    \begin{textblock*}{\paperwidth}(\fromleft{0in},\fromtop{3.0in})
      \centering
      \leading{24pt}
      \rule{1.5in}{0.4pt}\\
      \vspace{0.2in}
      A \papertype\\
      Presented to\\
      \prof\\
      The Southern Baptist Theological Seminary\\
      \vspace{0.2in}
      \rule{1.5in}{0.4pt}\\
      \vspace{0.2in}
      In Partial Fulfillment\\
      of the Requirements for \courseno
    \end{textblock*}

    \begin{textblock*}{\paperwidth}(\fromleft{0in},\fromtop{7.0in})
      \centering
      \leading{24pt}
      \rule{1.5in}{0.4pt}\\
      \vspace{0.2in}
      by\\
      \@author\\
      \email\\
      \@date\\
      \vspace{0.3in}
      Word Count: \wordcount\\
      \vspace{0.2in}
      I affirm the honour code.
    \end{textblock*}
  \end{titlepage}

  \pagedrop

  {\centering
  \MakeUppercase{\@title}\\[\baselineskip]}
}

%% Set up section heading formats
\RequirePackage{titlesec}

\titleformat{\section}[block]
            {\normalfont\bfseries\normalsize\filcenter}
            {\thesection}
            {1em}
            {\leading{12pt}}
            [\leading{24pt}]
\titlespacing{\section}{1.25in}{24pt}{0pt}[1.25in]

\titleformat{\subsection}[block]
            {\normalfont\bfseries\normalsize\filright}
            {\thesubsection}
            {1ex}
            {\leading{12pt}}
            [\leading{24pt}]
\titlespacing{\subsection}{0pt}{24pt}{0pt}[3.5in]

\titleformat{\subsubsection}[runin]
            {\normalfont\bfseries\normalsize\filright}
            {\thesubsubsection}
            {1ex}
            {\hspace{0.7in}}
            []
\titlespacing{\subsubsection}{0in}{12pt}{\wordsep}[0in]

% bibliography setup
%\RequirePackage[backend=biber, style=verbose]{biblatex}
\RequirePackage[ibidtracker=false]{biblatex-chicago}
\DefineBibliographyStrings{english}{%
  bibliography = {BIBLIOGRAPHY},
  references   = {BIBLIOGRAPHY}
}
\defbibheading{bibliography}[BIBLIOGRAPHY]{\newpage\pagedrop\centering{#1}}
%\newcommand{\sbts-printbibliography}{\newpage\pagedrop\printbibliography}

% extra config of footnotes
\setlength{\footnotesep}{\baselineskip}

\usepackage{scrextend}
\deffootnote[0.7in]{0em}{0.7in}{\textsuperscript{\thefootnotemark\hspace{1ex}}\leading{10pt}\setlength{\parskip}{10pt}}
\setkomafont{footnote}{\leading{10pt}}


% use csquotes package for quotations, inline and block
% use quoting package for block quotes, which allows formatting of the block
% style
\RequirePackage[indentfirst=false, leftmargin=0.35in, rightmargin=0in]{quoting}
\RequirePackage[autopunct=true, threshold=4, thresholdtype=lines,
  parthreshold=true]{csquotes}
\SetBlockEnvironment{quoting}
\renewcommand*{\quotingfont}{\leading{12pt}}
\SetCiteCommand{\autocite}

% hyperref package. Defines meetadata, as well as hyperlinks for references.
% Make sure this comes last in config!
\RequirePackage[hidelinks=true]{hyperref}

% ******************************************************************
% ****************************** TODO ******************************
% ******************************************************************
