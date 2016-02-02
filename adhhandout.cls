\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{adhhandout}[2015/11/30 Class for producing handouts]

%% Preliminary Declarations - load packages needed for class file

\RequirePackage{etoolbox}
\RequirePackage{xcolor}

%% Options - handle options to adhhandout class

% Option for paper/electronic document
\providetoggle{forpaperoption}
\togglefalse{forpaperoption}

\DeclareOption{paper}{
  \toggletrue{forpaperoption}
}
\DeclareOption{electronic}{
  \togglefalse{forpaperoption}
}

% Options for fonts

% toggles for different font sets
\providetoggle{cmfont}
\providetoggle{timesfont}
\providetoggle{palatinofont}
\providetoggle{palahelvfont}
\providetoggle{timesoptfont}

% default to palatino
\togglefalse{cmfont}
\togglefalse{timesfont}
\togglefalse{palatinofont}
\toggletrue{palahelvfont}
\togglefalse{timesoptfont}

\DeclareOption{cm}{
\toggletrue{cmfont}
\togglefalse{timesfont}
\togglefalse{palatinofont}
\togglefalse{palahelvfont}
\togglefalse{timesoptfont}
}
\DeclareOption{times}{
\togglefalse{cmfont}
\toggletrue{timesfont}
\togglefalse{palatinofont}
\togglefalse{palahelvfont}
\togglefalse{timesoptfont}
}
\DeclareOption{palatino}{
\togglefalse{cmfont}
\togglefalse{timesfont}
\toggletrue{palatinofont}
\togglefalse{palahelvfont}
\togglefalse{timesoptfont}
}
\DeclareOption{palahelv}{
\togglefalse{cmfont}
\togglefalse{timesfont}
\togglefalse{palatinofont}
\toggletrue{palahelvfont}
\togglefalse{timesoptfont}
}
\DeclareOption{timesopt}{
\togglefalse{cmfont}
\togglefalse{timesfont}
\togglefalse{palatinofont}
\togglefalse{palahelvfont}
\toggletrue{timesoptfont}
}

% pass other options to article class
\DeclareOption*{\PassOptionToClass{\CurrentOption}{article}}

\ProcessOptions\relax

%% Class definitions and set up

% [todo] - add a4/a5 as option, not set default
\LoadClass[a5paper]{article}
\RequirePackage[pass]{geometry}

% allow unicode symbols
\RequirePackage[utf8]{inputenc}

% babel package for correct hyphenation etc
\RequirePackage[greek,british]{babel}

% packages to provide extra symbols
\RequirePackage{adhsymbols}

% use fullpage package to reduce margin sizes
\RequirePackage[cm]{fullpage}

% specific settings for paper or electronic documents
\iftoggle{forpaperoption}{
  \typeout{Paper option set}
}{
  \typeout{Electronic option set}
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
\iftoggle{palahelvfont}{
  \typeout{Palatino and Helvetica fonts used}
  \RequirePackage[sc,osf]{mathpazo}
  \RequirePackage{helvet}
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

% [todo] - clean up section formatting, make work for numebred sections

% \titleformat*{\section}{\normalfont\titlefamily\bfseries\Large}
\titleformat{\section}[hang]
{\normalfont\titlefamily\bfseries\large}{\thesection}{\quad}{\colorblacksection}

% \titleformat*{\subsection}{\normalfont\titlefamily\bfseries\large}
\titleformat{\subsection}[hang]
{\normalfont\titlefamily\bfseries\normalsize}{\thesection}{\quad}{\colorgreysection}

% \titleformat*{\subsubsection}{\normalfont\titlefamily\bfseries\normalsize}
\titleformat{\subsubsection}[hang]
{\normalfont\titlefamily\normalsize}{\thesection}{\quad}{\boxsection}

\titleformat*{\paragraph}{\normalfont\titlefamily\bfseries\normalsize}

\titleformat*{\subparagraph}{\normalfont\titlefamily\itshape\normalsize}

\newcommand{\colorblacksection}[1]{%
  \colorbox{black}{\color{white}\parbox{\textwidth}{#1}}}

\newcommand{\colorgreysection}[1]{%
  \colorbox{gray}{\color{white}\parbox{\textwidth}{#1}}}

\newcommand{\boxsection}[1]{%
  \framebox{\parbox{\textwidth}{#1}}}

% redefine title for handouts
\renewcommand{\maketitle}{
  {\centering
    \colorbox{black}{
      \color{white}
      \begin{tabular}{lr}
        \multicolumn{2}{l}{
          % [todo] - space this properly (this is a bodge!)
          \begin{minipage}{0.95\textwidth}
            {\normalfont\titlefamily\bfseries\Huge\@title}
          \end{minipage}
        }
        \vspace{0.1in}\\
        {\normalfont\titlefamily\bfseries\Large\@author} &
        {\normalfont\titlefamily\bfseries\Large\@date}\\
      \end{tabular}
    }
  }
}

% paragraph spacing
\setlength{\parskip}{\baselineskip}
\setlength{\parindent}{0pt}

\newcommand{\@minipagerestore}{\setlength{\parskip}{\baselineskip}}

\RequirePackage[
  protrusion=true,
  expansion=true,
  spacing=true,
  babel=true
]{microtype}

% bible referencing
% [todo] - separate package for bible refs

\RequirePackage{bibleref-parse}
\newcommand{\bv}[1]{(pbibleverse{#1})}
\newcommand{\bvnc}[1]{pbibleverse{#1}}

% table packages
\RequirePackage{longtable}
\RequirePackage{booktabs}

% image pacakges
\RequirePackage{graphicx}

% Hyperref package
% only load if document is electronic
% must come last in class file as it redefines commands which may be changed by
% other packages.
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
