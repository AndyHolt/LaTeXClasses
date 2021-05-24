\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{adharticle}[2014/12/24 Custom LaTeX article class]

% [todo] - ensure compatibility with different compilers
%   Check with:
%     - latex
%     - pdflatex
%     - xelatex

% [todo] - read up on common mistakes
%   http://mirror.ox.ac.uk/sites/ctan.org/info/l2tabu/english/l2tabuen.pdf

% [todo] - investigate for margin size changes
% ``These classes have been made with a European point of view on typography in
%   mind. You can also use typearea.sty which is part of KOMA -Script with any
%   other document class.''

% [todo] - add series editor field to BibLaTeX

%% Preliminary Declarations - set up packages needed for class file
\RequirePackage{etoolbox}
% allows a workaround for amsmath and txfonts both defining `\iint' etc
\RequirePackage{savesym}
% Allow defining code for XeLaTeX different to if compiling with pdfLaTeX
\RequirePackage{ifxetex}

%% Options - handle options to adharticle class

% set up toggle to use/not use fullpage
\providetoggle{usefullpageoption}
\togglefalse{usefullpageoption}

% declare fullpage option
\DeclareOption{fullpage}{
  \toggletrue{usefullpageoption}
}

% set up toggle for paper/electronic document type
\providetoggle{forpaperoption}
\togglefalse{forpaperoption}

% declare paper and electronic options
\DeclareOption{paper}{
  \toggletrue{forpaperoption}
}
\DeclareOption{electronic}{
  \togglefalse{forpaperoption}
}

% font setting options
% toggles for different font sets
% \providetoggle{cmfont}
% \providetoggle{timesfont}
% \providetoggle{palatinofont}
% \providetoggle{timesoptfont}

% default to computer modern
% \toggletrue{cmfont}
% \togglefalse{timesfont}
% \togglefalse{palatinofont}
% \togglefalse{timesoptfont}

% \DeclareOption{cm}{
%   \toggletrue{cmfont}
% }
% \DeclareOption{times}{
%   \togglefalse{cmfont}
%   \toggletrue{timesfont}
% }
% \DeclareOption{palatino}{
%   \togglefalse{cmfont}
%   \toggletrue{palatinofont}
%   }
% \DeclareOption{timesopt}{
%   \togglefalse{cmfont}
%   \toggletrue{timesoptfont}
% }

% option to include page headers
\providetoggle{useheaders}
\togglefalse{useheaders}
\DeclareOption{headers}{
  \toggletrue{useheaders}
}

% pass other options to article class (e.g. font sizes)
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

\ProcessOptions\relax

%% Other declarations

\LoadClass[a4paper]{article}

\ifxetex
  \RequirePackage{fontspec}

  \RequirePackage{polyglossia}
  \setmainlanguage[variant=british]{english}
  \defaultfontfeatures{Ligatures=TeX}
  \setmainfont{Iowan Old Style}
  \setsansfont{Avenir}
\else
  % allow unicode symbols to be used
  \RequirePackage[utf8]{inputenc}

  % Babel package provides correct hyphenation etc
  \RequirePackage[greek,british]{babel}
\fi

% packages to include extra symbols
\RequirePackage{amssymb,amsmath}
\RequirePackage{adhsymbols}
% provides various extra TeX related logos, such as \XeLaTeX
% \RequirePackage{dtk-logos}

% require fullpage package if option is set
\iftoggle{usefullpageoption}{
  \typeout{Fullpage option set}
  \RequirePackage{fullpage}
}{
  \typeout{Fullpage option not set}
}

% specific settings for paper or electronic documents
\iftoggle{forpaperoption}{
  \typeout{Paper option set}
}{
  \typeout{Electronic (not paper) option set}
}

% font set up
% All of this font configuration borrows very heavily from
% Dr Drang (https://github.com/drdrang/drangreport)
\newcommand{\titlefamily}{\sffamily}

% \iftoggle{cmfont}{
%   \typeout{Computer Modern font used}
% }{}
% \iftoggle{timesfont}{
%   \typeout{Times font used}
%   \ifxetex
%     \setmainfont{Times New Roman}
%   \else
%     \savesymbol{iint}
%     \RequirePackage{txfonts}
%     \restoresymbol{TXF}{iint}
%   \fi
%   \renewcommand{\titlefamily}{\sffamily}
%   }{}
% \iftoggle{palatinofont}{
%   \typeout{Palatino font used}
%   \ifxetex
%     \setmainfont{Palatino}
%   \else
%     \RequirePackage[sc,osf]{mathpazo}
%     \RequirePackage{classico}
%   \fi
%   \renewcommand{\baselinestretch}{1.1}
%   \renewcommand{\titlefamily}{\sffamily}
% }{}
% \iftoggle{timesoptfont}{
%   \typeout{Times and Optima fonts used}
%   \ifxetex
%     \setmainfont{Times New Roman}
%     \setsansfont{Optima}
%   \else
%     \savesymbol{iint}
%     \RequirePackage{txfonts}
%     \restoresymbol{TXF}{iint}
%     \RequirePackage{classico}
%   \fi
%   \renewcommand{\titlefamily}{\sffamily}
% }{}

% % change (sub)section and (sub)paragraph fonts to sans serif
\RequirePackage{titlesec}

\titleformat*{\section}{\normalfont\titlefamily\bfseries\Large}
\titleformat*{\subsection}{\normalfont\titlefamily\bfseries\large}
\titleformat*{\subsubsection}{\normalfont\titlefamily\bfseries\normalsize}
\titleformat*{\paragraph}{\normalfont\titlefamily\bfseries\normalsize}
\titleformat*{\subparagraph}{\normalfont\titlefamily\itshape\normalsize}

% redefine title to use \titlefamily font
% [todo] - make robust to having a title page
%   See drang report
% \renewcommand{\maketitle}{
%   \renewcommand{\and}
%     {\end{tabular} \begin{tabular}[t]{c}\vspace{.5ex}\\}
%   \begin{center}
%     \begin{tabular}[t]{c}
%       \parbox[c][.5in][c]{0.8\textwidth}
%         {\centering\normalfont\titlefamily\bfseries\LARGE\@title}\\
%       \begin{minipage}{0.3\textwidth}
%         \begin{center}
%           \normalfont\normalsize
%           \begin{tabular}[t]{c}
%             \vspace{.25in}\\
%             {\centering\normalfont\titlefamily\bfseries\@author}
%           \end{tabular}
%         \end{center}
%       \end{minipage}
%       \vspace{.25in}\\
%       {\centering\normalfont\titlefamily\bfseries\@date}
%       \vspace{.25in}\\
%     \end{tabular}
%   \end{center}
% }

% packages for handling graphics
% [review] - use xcolor instead of color package?
\RequirePackage{color}
\RequirePackage{graphicx}
\RequirePackage{placeins}

% tikz package for drawing figures/diagrams
% [todo] - add tikz to documentation file.
\RequirePackage{tikz}

% packages for tables
\RequirePackage{longtable}
\RequirePackage{booktabs}
\RequirePackage{ctable}
\setupctable{
  bgopacity=1,
  botcap,
  center,
  footerwidth,
  mincapwidth=0.3\textwidth,
  nonotespar,
  table
 }

% packages for source code formatting
\RequirePackage{minted}
\usemintedstyle{solarizedlight}
\definecolor{solarizedlightbg}{rgb}{0.933,0.910, 0.835}
% [review] - use inconsolata/monaco font in minted? (can this be done?)
% [todo] - format minted line numbers to match solarized theme
\newminted{latex}{
  bgcolor=solarizedlightbg,
  gobble=2,
  linenos=true,
  numberblanklines=true,
  obeytabs=false,
  showspaces=false,
  stepnumber=1,
  tabsize=4
}
\newmint{latex}{
  bgcolor=solarizedlightbg,
  gobble=0,
  linenos=false,
  obeytabs=false,
  showspaces=false,
  tabsize=4
}

% fancyvrb - more powerful verbatim environments
% [todo] - setup default fancyvrb settings
\RequirePackage{fancyvrb}

% micro-typography
% not compatible with xetex, so don't load if not xetex
\ifxetex
  \typeout{Can't use microtype with xetex}
\else
  \typeout{Not using xetex, enable microtype}
  \RequirePackage[
    protrusion=true,
    expansion=true,
    % tracking=true
    spacing=true,
    babel=true
  ]{microtype}
\fi

% subcaption package
% [todo] - add  subcaption to documentation file
\RequirePackage{subcaption}

%   [todo] - Implement fancyhdr set up
\iftoggle{useheaders}{
  \typeout{Using page headers.}
  \RequirePackage{fancyhdr}
  \pagestyle{fancy}
  \renewcommand{\sectionmark}[1]{\markright{\thesection.\ #1}}
  \fancyhead{}
  \fancyhead[R]{\rightmark}
  \fancyfoot{}
  \fancyfoot[C]{\thepage}
}{
  \typeout{Not using page headers.}
}

% bible referencing
% [todo] - separate package for bible refs                     
\RequirePackage{bibleref-parse}
\newcommand{\bv}[1]{(\pbibleverse{#1})}
\newcommand{\bvnc}[1]{\pbibleverse{#1}}

% drop cap support
\RequirePackage{lettrine}
\newcommand{\dropcap}[2]{
  \lettrine[lines=3]{#1}{#2}
}

% Hyperref package
% Only colourise links if electronic document, not paper
%   must come last in class file as it redefines commands which may be changed
%   by other packages
\iftoggle{forpaperoption}{
  \typeout{Paper option set - no coloured links}
  \RequirePackage{hyperref}
  \hypersetup{
    colorlinks=false,
    hidelinks
  }
}{
  \typeout{Electronic document - use coloured links}
  \RequirePackage{hyperref}
  \hypersetup{
    colorlinks=true,
    linkcolor=red,
    urlcolor=blue,
    citecolor=blue
  }
  \RequirePackage{footnotebackref}
}
