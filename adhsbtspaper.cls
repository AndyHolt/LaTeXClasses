\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{adhsbtspaper}[2019/03/19 SBTS paper class]

% Pass options to article class
\DeclareOption*{\PassOptionToClass{\CurrentOption}{article}}

\ProcessOptions\relax

\LoadClass[12pt]{article}

% allow unicode symbols
\RequirePackage[utf8]{inputenc}

% setup standard page
\RequirePackage[letterpaper, portrait, left=1.0in, right=1.0in, top=1.0in,
bottom=1.0in]{geometry}

% bibliography setup
\RequirePackage[backend = biber]{biblatex}

% hypersetup for metadata
\RequirePackage{hyperref}

% Set font
\RequirePackage{fontspec}
\setmainfont{Times New Roman}

% fonts for greek and hebrew
\usepackage{polyglossia}

\setmainlanguage[variant=british]{english}
\setotherlanguage{hebrew}
\setotherlanguage[variant=ancient]{greek}
\newfontfamily\hebrewfont{SBL BibLit}
\newfontfamily\greekfont{SBL BibLit}
