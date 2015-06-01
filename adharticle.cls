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
\providetoggle{cmfont}
\providetoggle{timesfont}
\providetoggle{palatinofont}
\providetoggle{timesoptfont}

% default to computer modern
\toggletrue{cmfont}
\togglefalse{timesfont}
\togglefalse{palatinofont}
\togglefalse{timesoptfont}

\DeclareOption{cm}{
  \toggletrue{cmfont}
}
\DeclareOption{times}{
  \togglefalse{cmfont}
  \toggletrue{timesfont}
}
\DeclareOption{palatino}{
  \togglefalse{cmfont}
  \toggletrue{palatinofont}
  }
\DeclareOption{timesopt}{
  \togglefalse{cmfont}
  \toggletrue{timesoptfont}
}

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

% allow unicode symbols to be used
\RequirePackage[utf8]{inputenc}

% Babel package provides correct hyphenation etc
\RequirePackage[greek,british]{babel}

% packages to include extra symbols
\RequirePackage{amssymb,amsmath}
\RequirePackage{adhsymbols}
% provides various extra TeX related logos, such as \XeLaTeX
\RequirePackage{dtklogos}

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
\newcommand{\titlefamily}{}

\iftoggle{cmfont}{
  \typeout{Computer Modern font used}
}{}
\iftoggle{timesfont}{
  \typeout{Times font used}
  \savesymbol{iint}
  \RequirePackage{txfonts}
  \restoresymbol{TXF}{iint}
  \renewcommand{\titlefamily}{\sffamily}
  }{}
\iftoggle{palatinofont}{
  \typeout{Palatino font used}
  \RequirePackage[sc,osf]{mathpazo}
  \RequirePackage{classico}
  \renewcommand{\baselinestretch}{1.1}
  \renewcommand{\titlefamily}{\sffamily}
}{}
\iftoggle{timesoptfont}{
  \typeout{Times and Optima fonts used}
  \savesymbol{iint}
  \RequirePackage{txfonts}
  \restoresymbol{TXF}{iint}
  \RequirePackage{classico}
  \renewcommand{\titlefamily}{\sffamily}
}{}

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
\renewcommand{\maketitle}{
  \renewcommand{\and}
    {\end{tabular} \begin{tabular}[t]{c}\vspace{.5ex}\\}
  \begin{center}
    \begin{tabular}[t]{c}
      \parbox[c][.5in][c]{5in}
        {\centering\normalfont\titlefamily\bfseries\LARGE\@title}\\
      \begin{minipage}{5in}
        \begin{center}
          \normalfont\normalsize
          \begin{tabular}[t]{c}
            \vspace{.25in}\\
            {\centering\normalfont\titlefamily\bfseries\@author}
          \end{tabular}
        \end{center}
      \end{minipage}
      \vspace{.25in}\\
      {\centering\normalfont\titlefamily\bfseries\@date}
      \vspace{.25in}\\
    \end{tabular}
  \end{center}
}

% packages for handling graphics
% [review] - use xcolor instead of color package?
\RequirePackage{color}
\RequirePackage{graphicx}
\RequirePackage{placeins}

% packages for tables
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
\RequirePackage[
protrusion=true,
expansion=true,
tracking=true
spacing=true,
babel=true
]{microtype}

% subcaption package
% [todo] - add  subcaption to documentation file
\RequirePackage{subcaption}

% tikz package for drawing figures/diagrams
% [todo] - add tikz to documentation file.
\RequirePackage{tikz}

% [todo] - make adhsymbols package which defines some custom commands

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
\RequirePackage{bibleref-parse}
\newcommand{\bv}[1]{(\pbibleverse{#1})}
\newcommand{\bvnc}[1]{\pbibleverse{#1}}

% Hyperref package
%   should only be loaded if document type is electronic
%   must come last in class file as it redefines commands which may be changed
%   by other packages
\iftoggle{forpaperoption}{
  \typeout{Not using hyperref - paper option set}
}{
  \typeout{enabling hyperref - electronic document}
  \RequirePackage{hyperref}
  \hypersetup{
    colorlinks=true,
    linkcolor=red,
    urlcolor=blue,
    citecolor=blue
  }
  \RequirePackage{footnotebackref}
}
