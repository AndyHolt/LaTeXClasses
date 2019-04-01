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
\RequirePackage[multiple]{footmisc}
\setlength{\footnotesep}{\baselineskip}
\renewcommand{\footnotelayout}{\leading{10pt}\setlength{\parskip}{10pt}}

% use csquotes package, keeps biblatex happy
\RequirePackage{csquotes}

% bibliography setup
\RequirePackage[backend = biber]{biblatex}

% hyperref package. Defines meetadata, as well as hyperlinks for references.
% Make sure this comes last in config!
\RequirePackage[hidelinks=true]{hyperref}

