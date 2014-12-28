\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{adharticle}[2014/12/24 Custom LaTeX article class]

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
\RequirePackage{color}
\RequirePackage{graphicx}
\RequirePackage{placeins}

% packages to include extra symbols
\RequirePackage{amssymb,amsmath}

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

% [todo] - add support for `minted' package
%   package for syntax highlighting source code. Uses pygments (python package)
%   for syntax highlighting (http://pygments.org/).
% [todo] - add solarized themes for minted?
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
