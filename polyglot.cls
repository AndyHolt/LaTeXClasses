\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{polyglot}[2014/06/04 Layout parallel translations]

\RequirePackage{xpatch}

% define any options here

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

\ProcessOptions\relax

\LoadClass[a4paper]{article}

\RequirePackage[a4paper,landscape]{geometry}

% allow unicode symbols to be used
\RequirePackage[utf8]{inputenc}
% set unicode nonbreaking space to LaTeX nonbreaking space
\DeclareUnicodeCharacter{00A0}{~}

% babel package for correct hyphenation etc
\RequirePackage[greek,british]{babel}

% use adhsymbols definitions
\RequirePackage{adhsymbols}

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
    {\centering\normalfont\bfseries\@title}
  \end{center}
}

% package for typesetting paratext, such as chapter and verse numbers
\RequirePackage{paratext}

% don't leave a gap when starting a verse environment
\xpatchcmd{\verse}{\itemsep}{\advance\topsep-\parskip\itemsep}{}{}

% micro-typography (especially useful due to narrow columns)
\RequirePackage[
  protrusion=true,
  expansion=true,
  % tracking=true,              
  spacing=true,
  babel=true
]{microtype}
