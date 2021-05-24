\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{sbtshistread}[2019/08/28 SBTS paper for history reading assignments]

% Pass options to article class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

\ProcessOptions\relax

\LoadClass[12pt]{article}

% fontspec package, sets up use of OpenType fonts
\RequirePackage{fontspec}

% setup standard page
\RequirePackage[
  letterpaper,
  portrait,
  left=1.0in,
  right=1.0in,
  top=1.0in,
  bottom=1.0in,
  headheight=14.5pt
]{geometry}

% Set font
\RequirePackage{fontspec}
\setmainfont{Times New Roman}

% setup for left justification, no justification at right margin
% \RequirePackage{ragged2e}
% \setlength{\RaggedRightParindent}{0.0in}
% \setlength{\parindent}{0.0in}
% \setlength{\parskip}{\baselineskip}
% \RaggedRight
\raggedright
\setlength{\parindent}{0.0in}
\setlength{\parskip}{\baselineskip}

% fonts for greek and hebrew
\usepackage{polyglossia}

%% Turn off Hebrew typesetting for now. Seems to cause some issues, can work
%% them out when I need it!
\setmainlanguage{english}
% \setotherlanguage{hebrew}
\setotherlanguage[variant=ancient]{greek}
% \newfontfamily\hebrewfont{SBL BibLit}
\newfontfamily\greekfont{SBL BibLit}

% leading
\RequirePackage{leading}
\leading{12pt}

%% Make command for adding extra gap at top of first page of main content and
%% first page of bibliography
%% Modified version of command from drdrang's drangreport class:
%% https://github.com/drdrang/drangreport/blob/master/drangreport.sty
\newcommand{\pagedrop}{%
\vspace*{1.0in}%
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

    \begin{textblock*}{5in}[0,1](\fromleft{0.5\paperwidth-2.5in},\fromtop{2in})
      \centering
      \MakeUppercase{\@title}
    \end{textblock*}

    \begin{textblock*}{\paperwidth}(\fromleft{0in},\fromtop{3.0in})
      \centering
      \leading{24pt}
      \rule{1.5in}{0.4pt}\\
      \vspace{0.3in}
      A \papertype\\
      Presented to\\
      \prof\\
      The Southern Baptist Theological Seminary\\
      \vspace{0.3in}
      \rule{1.5in}{0.4pt}\\
      \vspace{0.3in}
      In Partial Fulfillment\\
      of the Requirements for \courseno
    \end{textblock*}

    \begin{textblock*}{5in}(\fromleft{0.5\paperwidth-2.5in},\fromtop{7.0in})
      \centering
      \leading{24pt}
      \rule{1.5in}{0.4pt}\\
      \vspace{0.2in}
      by\\
      \@author\\
      \email\\
      \today\\
      \vspace{0.3in}
      On my honor, I have neither given nor taken improper assistance in
      completing this assignment.
    \end{textblock*}
  \end{titlepage}

  % \framebox[\textwidth]{\normalfont\bfseries\@title}
}

%% set up different sections for this class
%% lecture, question, subquestion
\RequirePackage{titlesec}
%% \titleclass{\lecture}{straight}
%% \titleformat{\lecture}[block]{\normalfont\bfseries}{}{0pt}{}
%% \titleclass{\question}{straight}
%% \titleclass{\subquestion}{straight}
% \titleformat{\section}[block]{\normalfont\bfseries}{}{0em}{}
\newcounter{lecture}[part]
\titleclass{\lecture}{straight}[\part]
\titleformat{\lecture}[block]{\normalsize\normalfont\bfseries\leading{12pt}}{}{0pt}{\filcenter\framebox[\textwidth]}
\titlespacing*{\lecture}{0pt}{0ex plus 1ex minus .2ex}{0 ex plus .2ex}
\renewcommand{\thelecture}{\arabic{lecture}}

\newcounter{question}[lecture]
\titleclass{\question}{straight}[\lecture]
\titleformat{\question}[hang]{\normalfont}{\thequestion.}{1ex}{}
\titlespacing*{\question}{1.0em}{0ex plus 1ex minus .2ex}{0 ex plus .2ex}[2.5em]
\renewcommand{\thequestion}{\arabic{question}}

\newcounter{subquestion}[question]
\titleclass{\subquestion}{straight}[\question]
\titleformat{\subquestion}[hang]{\normalfont}{\thesubquestion.}{1ex}{}
\titlespacing*{\subquestion}{2.25em}{0ex plus 1ex minus .2ex}{0 ex plus .2ex}[2.5em]
\renewcommand{\thesubquestion}{\alph{subquestion}}

% extra config of footnotes
\setlength{\footnotesep}{\baselineskip}

\usepackage{scrextend}
\deffootnote[0.7in]{0em}{0.7in}{\textsuperscript{\thefootnotemark}\leading{10pt}\setlength{\parskip}{10pt}}
\setkomafont{footnote}{\leading{10pt}}

% use csquotes package for quotations, inline and block
% use quoting package for block quotes, which allows formatting of the block
% style
\RequirePackage[indentfirst=false, leftmargin=0.35in, rightmargin=0in]{quoting}
\RequirePackage[autopunct=true, threshold=5, thresholdtype=lines,
  parthreshold=true]{csquotes}
\SetBlockEnvironment{quoting}
\renewcommand*{\quotingfont}{\leading{12pt}}

% bibliography setup
\RequirePackage[backend=biber, style=verbose]{biblatex}

%% fancyhdr set up
\RequirePackage{fancyhdr}
\pagestyle{fancy}
%\fancyh{}
\fancyhead[R]{\@author}
\fancyhead[L]{\shortpapertitle}
\renewcommand{\headrulewidth}{0pt}

% hyperref package. Defines meetadata, as well as hyperlinks for references.
% Make sure this comes last in config!
\RequirePackage[hidelinks]{hyperref}

% ******************************************************************
% ****************************** TODO ******************************
% ******************************************************************
