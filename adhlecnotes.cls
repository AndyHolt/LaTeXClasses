\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{adhlecnotes}[2016/11/16 Class for lecture notes]

% for use with XeLaTeX

%% Preliminary declarations - load packages needed for class file

\RequirePackage{etoolbox}
\RequirePackage{xcolor}

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

% Babel package provides correct hyphenation etc
\RequirePackage[greek,british]{babel}

\RequirePackage{titlesec}
\RequirePackage{titling}
\RequirePackage{fontspec}

% Set fonts for XeLaTeX
\setromanfont{Baskerville}
\setsansfont{Gill Sans}
\newfontfamily\headingfont[]{Gill Sans}
\titleformat*{\section}{\LARGE\headingfont}
\titleformat*{\subsection}{\Large\headingfont}
\titleformat*{\subsubsection}{\large\headingfont}
\renewcommand{\maketitlehooka}{\headingfont}

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

% paragraph spacing
\setlength{\parskip}{\baselineskip}
\setlength{\parindent}{0pt}

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

% micro-typography
\RequirePackage[
protrusion=true,
%expansion=true,
% tracking=true
%spacing=true,
babel=true
]{microtype}

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
