\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{adharticle}[2014/12/24 Custom LaTeX article class]

% [todo] - ensure compatibility with different compilers
%   Check with:
%     - latex
%     - pdflatex
%     - xelatex

%% Preliminary Declarations - set up packages needed for class file
\RequirePackage{etoolbox}

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

% pass other options to article class (e.g. font sizes)
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

\ProcessOptions\relax

%% Other declarations

\LoadClass[a4paper]{article}

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

% allow unicode symbols to be used
\RequirePackage[utf8]{inputenc}

% Babel package provides correct hyphenation etc
\RequirePackage[greek,english]{babel}

% packages for handling graphics
% [review] - use xcolor instead of color package?
\RequirePackage{color}
\RequirePackage{graphicx}
\RequirePackage{placeins}

% packages to include extra symbols
\RequirePackage{amssymb,amsmath}
% provides various extra TeX related logos, such as \XeLaTeX
\RequirePackage{dtklogos}

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
\usepackage{minted}
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

% [todo] - add support for fancyvrb package
%   More powerful verbatim.
% [todo] - add support for subfig or subcaption package
% [todo] - add support and config for microtype package
%   For much better typography using microtypographical extensions.
% [todo] - add support for hyperref package
%   Probably only to be used for electronic documents (not paper).
% [todo] - add support for tikz/pgf for drawings etc

% [todo] - make adhsymbols package which defines some custom commands
%   \providecommand{\e}[1]{\ensuremath{\times10^{#1}}}
%   \providecommand{\degrees}{\ensuremath{^{\circ}}}
