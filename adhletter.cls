\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{adhletter}[2023/05/22 v0.1 LaTeX Class for letters]

%% Preliminary declarations - load packages needed for class file

%% Options - handle options to adhhandout class

% pass other options to scrlttr2 class
\DeclareOption*{\PassOptionToClass{\CurrentOption}{scrlttr2}}

\ProcessOptions\relax

%% Class definitions and set up

\LoadClass[foldmarks=false,%
           fromalign=right,%
           fromrule=afteraddress,%
           fromphone,%
           fromemail,%
           subject=beforeopening,%
           subject=titled,%
           subject=left,%
           enlargefirstpage=true,%
           firstfoot=false,%
           version=last%
           ]{scrlttr2}

% set up sender information
% todo - make multiple contexts (e.g. personal, work, etc) available with class
% options
\RequirePackage{adhlettinfopersonal}

% Other letter formatting
\setplength{sigindent}{0mm}
\renewcommand*{\raggedsignature}{\raggedright}

% font set up
\RequirePackage{fontspec}
\RequirePackage{polyglossia}
\setmainlanguage[variant=british]{english}
\defaultfontfeatures{Ligatures=TeX}
\setmainfont{Iowan Old Style}
\setsansfont{Avenir Next}
% \setotherlanguage[variant=ancient]{greek}
% \newfontfamily\greekfont{Gentium Plus}[Scale=MatchLowercase]
% \newfontfamily\greekfontsf{GFS Neohellenic}[Scale=MatchLowercase]
\newfontfamily\symbolfont{Symbola}[Scale=MatchLowercase]

% packages to provide extra symbols
\RequirePackage{adhsymbols}

% paragraph spacing and indentation
\setlength{\parindent}{2em}


\RequirePackage{microtype}

\RequirePackage[hidelinks]{hyperref}
