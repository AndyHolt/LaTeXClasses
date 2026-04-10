\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{adhcv}[2023/08/07 v0.1 LaTeX Class for CV]

%% Preliminary Declarations - load packages needed for class file

%% Options - handle options to adhhandout class

% pass other options to article class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

\ProcessOptions\relax

%% Class definitions and set up

\LoadClass{article}
% \fontsize{11pt}{14pt}\selectfont

\RequirePackage[paper=a4paper, bottom=1in]{geometry}

% font set up
% all of this font configuration borrows very heavily from
% dr drang (https://github.com/drdrang/drangreport)
\newcommand{\titlefamily}{}

\RequirePackage{fontspec}
\RequirePackage{polyglossia}
\setmainlanguage[variant=british]{english}
\defaultfontfeatures{Ligatures=TeX}
\setmainfont{Iowan Old Style}
% \setmainfont[Ligatures=TeX,
%              UprightFont={Raleway Regular},
%              ItalicFont={Raleway Italic},
%              BoldFont={Raleway SemiBold},
%              BoldItalicFont={Raleway SemiBold Italic}]
%              {Raleway}
% Need to use Avenir Next and not Avenir for small caps
% \setsansfont{Avenir Next}
% \setotherlanguage[variant=ancient]{greek}
% \newfontfamily\greekfont{Gentium Plus}[Scale=MatchLowercase]
% \newfontfamily\greekfontsf{GFS Neohellenic}[Scale=MatchLowercase]
\renewcommand{\titlefamily}{\rmfamily}
\newfontfamily\symbolfont{Noto Sans Symbols 2}[Scale=MatchLowercase]

% set up content for header
\newcommand{\@name}{}
\newcommand{\name}[1]{\gdef\@name{#1}}
\newcommand{\@address}{}
\newcommand{\address}[1]{\gdef\@address{#1}}
\newcommand{\@phone}{}
\newcommand{\phone}[1]{\gdef\@phone{#1}}
\newcommand{\@email}{}
\newcommand{\email}[1]{\gdef\@email{#1}}

% packages to provide extra symbols
\RequirePackage{adhsymbols}

% load titlesec here as needs to be loaded before Hebrew font and bidi setup
\RequirePackage{titlesec}

% paragraph spacing
\setlength{\parskip}{\baselineskip}
\setlength{\parindent}{0pt}

\newcommand{\@minipagerestore}{\setlength{\parskip}{\baselineskip}}

% remove spacing around lists
\RequirePackage{enumitem}
% % \setlist[itemize]{topsep=0pt}
\setlist{nosep}
% \setlist{topsep=-\baselineskip, itemsep=0pt, parsep=0pt}
\setlist[itemize,1]{label=\textbullet}
\setlist[itemize,2]{label=--}
\setlist[itemize,3]{label=$\circ$}
\setlist[itemize,4]{label=$\triangleright$}

\RequirePackage{microtype}

% table packages
\RequirePackage{longtable}
\RequirePackage{booktabs}
\setlength{\tabcolsep}{0pt}

% image packages
\RequirePackage{graphicx}

% Define headers and footers
\RequirePackage{lastpage}
\RequirePackage{fancyhdr}
\pagestyle{fancy}
\fancyhf{}
\fancyfoot[C]{Page \thepage\ of \pageref{LastPage}}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}

% multi col package for using multiple columns (especially useful for lists)
\RequirePackage{multicol}

% Hyperref package
% only use coloured links if electronic option, not if paper.
% must come last in class file as it redefines commands which may be changed by
% other packages.
\RequirePackage[hidelinks]{hyperref}

% Set up main title and section headers according to selected style
% For some reason, yet unknown to me, loading hebrew as a language overrides the
% maketitle macro, so place this afterwards
% N.B. FOR EDITING: PACKAGE LOADING MUST BE DONE *BEFORE* HEBREW AND BIDI SET
% UP, THOUGH REDEFINING AND SETTING MACROS MAY BE DONE AFTERWARDS WITH CARE
% \titleformat*{\section}{\normalfont\titlefamily\bfseries\large}
\titleformat{\section}[hang]%
{\normalfont\titlefamily\bfseries\Large\MakeUppercase}{}{0pt}{}[\hrule]
\titlespacing*{\section}{0pt}{0.2ex plus 0.0ex minus .0ex}{0.0ex plus .1ex}

% \titleformat*{\subsection}{\normalfont\titlefamily\bfseries\large}
\titleformat{\subsection}[hang]
{\normalfont\titlefamily\bfseries\normalsize}{}{0pt}{}[]
\titlespacing*{\subsection}{0pt}{0.0ex plus 0.2ex minus 0.2ex}{-1.5ex plus .2ex minus 0.2ex}

% % \titleformat*{\subsubsection}{\normalfont\titlefamily\bfseries\normalsize}
% \titleformat{\subsubsection}[hang]
% {\normalfont\titlefamily\normalsize}{\thesubsubsection}{0.5em}{}[\hrule]
% \titlespacing*{\subsubsection}{1.5ex}{0.5ex plus 0.5ex minus .2ex}{0.2ex plus .2ex}

% \titleformat*{\paragraph}{\normalfont\titlefamily\bfseries\normalsize}

% \titleformat*{\subparagraph}{\normalfont\titlefamily\itshape\normalsize}

%   \iftoggle{afoursize}{
%     \renewcommand{\maketitle}{
%       \begin{center}
%         {\normalfont\titlefamily\bfseries\huge\centering\@title}

%         {\normalfont\titlefamily\bfseries\large\@author}

%         {\normalfont\titlefamily\bfseries\large\@date}
%       \end{center}
%     }
%   }{
%     \renewcommand{\maketitle}{
%       \begin{center}
%         \begin{tabular}{lr}
%           \multicolumn{2}{l}{\normalfont\titlefamily\bfseries\huge\@title}
%           \vspace{1ex}\\
%           {\normalfont\titlefamily\bfseries\large\@author} &
%           {\normalfont\titlefamily\bfseries\large\@date}\\
%         \end{tabular}
%       \end{center}
%     }
%   }
% }{}
\renewcommand{\maketitle}{
  \begin{center}
    {\normalfont\titlefamily\bfseries\huge\MakeUppercase{\@name}}\\
    \vspace{1ex}
    {\normalfont\titlefamily\normalsize{\@address~|~\@phone~|~\@email}}
  \end{center}
  %\vspace{-2.5ex}
}

% create a macro for an education block
% format: \education{Institution}{Programme}{Dates}{Grade}{Details}
\newcommand{\education}[5]{%
  \begin{tabular}{lr}
    {\large\bfseries\MakeUppercase{#1}} & {#3}\\
    {\bfseries{#2}}\quad{\itshape{#4}} & \\
    \multicolumn{2}{p{\textwidth}}{%
    \vspace{-0.5\baselineskip}
    {#5}
    \vspace{0pt}}\\
  \end{tabular}
  \vspace{-0.4\baselineskip}
}

% create a macro for a work experience block
% format: \workexperience{organisation}{title}{dates}{description}
\newcommand{\workexperience}[4]{%
  \begin{tabular}{lr}
    {\large\bfseries\MakeUppercase{#1}} & {#3}\\
    {\bfseries{#2}} & \\
    \multicolumn{2}{p{\textwidth}}{%
    \vspace{-0.5\baselineskip}
    {#4}
    \vspace{0pt}}\\
  \end{tabular}
  \vspace{-0.4\baselineskip}
}
