\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{sbtshistread}[2019/08/28 SBTS paper for history reading assignments]

% Pass options to article class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

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
\setlength{\RaggedRightParindent}{0.0in}
\setlength{\parindent}{0.0in}
\setlength{\parskip}{\baselineskip}
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
% \leading{24pt}

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
  \framebox[\textwidth]{\@title}
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
\titleformat{\lecture}[block]{\normalfont\bfseries}{Lecture \thelecture:}{1ex}{}
\titlespacing*{\lecture}{0pt}{0ex plus 1ex minus .2ex}{0 ex plus .2ex}
\renewcommand{\thelecture}{\arabic{lecture}}

\newcounter{question}[lecture]
\titleclass{\question}{straight}[\lecture]
\titleformat{\question}[hang]{\normalfont}{\thequestion.}{1ex}{}
\titlespacing*{\question}{1.0em}{0ex plus 1ex minus .2ex}{0 ex plus .2ex}
\renewcommand{\thequestion}{\arabic{question}}

\newcounter{subquestion}[question]
\titleclass{\subquestion}{straight}[\question]
\titleformat{\subquestion}[hang]{\normalfont}{\thesubquestion.}{1ex}{}
\titlespacing*{\subquestion}{2.25em}{0ex plus 1ex minus .2ex}{0 ex plus .2ex}
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
