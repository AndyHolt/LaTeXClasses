\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{adharticle}[2014/12/24 Custom LaTeX article class]

%% Preliminary Declarations - set up packages needed for class file
\RequirePackage{etoolbox}

%% Options - handle options to adharticle class
% [todo] - add code for document class options

% set up toggle to use/not use fullpage
\providetoggle{usefullpageoption}
\togglefalse{usefullpageoption}

% declare fullpage option
\DeclareOption{fullpage}{
  \toggletrue{usefullpageoption}
}

\ProcessOptions\relax

% NB: fullpage package must be called *after* paper size is specified (which
% occurs when article class is loaded). The processing of fullpage option is
% handled after \LoadClass command for that reason.

%% Other declarations

\LoadClass[a4paper]{article}

% require fullpage package if option is set
\iftoggle{usefullpageoption}{
  \typeout{Fullpage option set}
  \RequirePackage{fullpage}
}{
  \typeout{Fullpage option not set}
}
% [todo] - add support for `minted' package
%   package for syntax highlighting source code. Uses pygments (python package)
%   for syntax highlighting (http://pygments.org/).
% [todo] - solarized themes for minted?
% [todo] - add support for fancyvrb package
%   More powerful verbatim.
% [todo] - subfig or subcaption package
% [todo] - microtype package
%   For much better typography using microtypographical extensions.
