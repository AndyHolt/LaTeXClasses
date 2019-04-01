\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{adhsbtspaper}[2019/03/19 SBTS paper class]

% Pass options to article class
\DeclareOption*{\PassOptionToClass{\CurrentOption}{article}}

\ProcessOptions\relax

\LoadClass[12pt]{article}

% fontspec package, sets up use of OpenType fonts
\RequirePackage{fontspec}

% setup standard page
\RequirePackage[letterpaper, portrait, left=1.0in, right=1.0in, top=1.0in,
bottom=1.0in]{geometry}

% Set font
\RequirePackage{fontspec}
\setmainfont{Times New Roman}

% setup for left justification, no justification at right margin
\RequirePackage{ragged2e}
\setlength{\RaggedRightParindent}{0.7in}
\setlength{\parindent}{0.7in}
\RaggedRight

% fonts for greek and hebrew
\usepackage{polyglossia}

\setmainlanguage[variant=british]{english}
\setotherlanguage{hebrew}
\setotherlanguage[variant=ancient]{greek}
\newfontfamily\hebrewfont{SBL BibLit}
\newfontfamily\greekfont{SBL BibLit}

% leading
\RequirePackage{leading}
\leading{24pt}

% extra config of footnotes
\setlength{\footnotesep}{\baselineskip}

\usepackage{scrextend}
\deffootnote[0.7in]{0em}{0.7in}{\textsuperscript{\thefootnotemark}\leading{10pt}\setlength{\parskip}{10pt}}
\setkomafont{footnote}{\leading{10pt}}

% use csquotes package for quotations, inline and block
% use quoting package for block quotes, which allows formatting of the block
% style
\RequirePackage[indentfirst=false, leftmargin=0.35in, rightmargin=0in]{quoting}
\RequirePackage[autopunct=true, threshold=5, thresholdtype=lines,
  partthreshold=true]{csquotes}
\SetBlockEnvironment{quoting}
\renewcommand*{\quotingfont}{\leading{12pt}}

% bibliography setup
\RequirePackage[backend = biber]{biblatex}

% hyperref package. Defines meetadata, as well as hyperlinks for references.
% Make sure this comes last in config!
\RequirePackage[hidelinks=true]{hyperref}

% ******************************************************************
% ****************************** TODO ******************************
% ******************************************************************
% - Set up cover page
% - Setup top margin of first main page to use a 2 inch margin
