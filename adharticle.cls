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
\usepackage[utf8]{inputenc}

% Babel package provides correct hyphenation etc
\usepackage[greek,english]{babel}

% [todo] - add support for graphicx package
% [todo] - add support for placeins
%   Allows use of \FloatBarrier command
% [todo] - add support for amsmath package
%   improved maths and formula typesetting
% [todo] - add ctable support
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

% [todo] - make adhsymbols package which defines some custom commands
%   \providecommand{\e}[1]{\ensuremath{\times10^{#1}}}
%   \providecommand{\degrees}{\ensuremath{^{\circ}}}
