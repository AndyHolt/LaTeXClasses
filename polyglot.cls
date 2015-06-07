\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{polyglot}[2014/06/04 Layout parallel translations]

% define any options here

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

\ProcessOptions\relax

\LoadClass[a3paper,12pt]{article}

\RequirePackage[a3paper,landscape]{geometry}

% allow unicode symbols to be used
\RequirePackage[utf8]{inputenc}

% babel package for correct hyphenation etc
\RequirePackage[greek,british]{babel}

% fonts - use times and helvetica
\RequirePackage{txfonts}
\RequirePackage{helvet}

% use space between paragraphs instead of indented first line
\setlength{\parskip}{\baselineskip}
\setlength{\parindent}{0pt}

% use double line spacing
\RequirePackage{setspace}
\doublespacing

% package for typesetting parallel texts
\RequirePackage{paracol}
\setcolumnwidth{50pt/20pt,50pt/20pt,50pt}

% redefine title to use much less space
\renewcommand{\maketitle}{
  \begin{center}
    {\centering\normalfont\bfseries\LARGE\@title}
  \end{center}
}

% micro-typography (especially useful due to narrow columns)
\RequirePackage[
  protrusion=true,
  expansion=true,
  tracking=true,
  spacing=true,
  babel=true
]{microtype}
