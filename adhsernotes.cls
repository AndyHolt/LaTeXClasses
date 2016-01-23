\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{adhsernotes}[2015/06/01 Sermon notes class v0.1]

% Define any options here

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

\ProcessOptions\relax

\LoadClass[a5paper, 12pt]{article}

% allow unicode symbols to be used
\RequirePackage[utf8]{inputenc}

% Babel package provides correct hyphenation etc
\RequirePackage[greek,british]{babel}

% reduce margin sizes
\RequirePackage{fullpage}

\RequirePackage{pgfpages}
\pgfpagesuselayout{2 on 1}[a4paper, landscape]

% [review] - font selection - is it readable enough?
% set default font to sans serif
\RequirePackage{helvet}
\renewcommand{\familydefault}{\sfdefault}
\newcommand{\titlefamily}{\sffamily}

% reduce spacing around headings!
\RequirePackage{titlesec}
\titlespacing*{\section}{0pt}{1ex plus 1ex}{0pt}
\titlespacing*{\subsection}{0pt}{1ex plus 1ex}{0pt}
\titlespacing*{\subsubsection}{0pt}{1ex plus 1ex}{0pt}

% [review] - use different indents on consecutive lines? Might make it easier to
% track where I am in a sentence.
% left justify text
\raggedright
\setlength{\parskip}{\baselineskip}
\setlength{\parindent}{0pt}
\setlength{\hangindent}{0.7mm}
% one-and-a-half line spacing
\RequirePackage{setspace}
\onehalfspacing

% set up sermon title
\renewcommand{\maketitle}{
  \begin{center}
    \begin{tabular}[t]{c}
      \parbox[c]{\textwidth}
      {\centering\normalfont\titlefamily\bfseries\LARGE\@title}
      \vspace{.1in}\\
      {\centering\normalfont\titlefamily\bfseries\passage}\\
      \begin{minipage}{2.5in}
        \begin{center}
          \normalfont\normalsize
          \begin{tabular}[t]{c}
            {\centering\normalfont\titlefamily\bfseries\@author}
          \end{tabular}
        \end{center}
      \end{minipage}\\
      {\centering\normalfont\titlefamily\bfseries\@date}\\
    \end{tabular}
  \end{center}
}

% micro-typography
\RequirePackage[
  protrusion=true,
  expansion=true,
  tracking=true,
  spacing=true,
  babel=true
]{microtype}

% bible referencing
% [todo] - separate package for bible refs
\RequirePackage{bibleref-parse}

\RequirePackage{adhsymbols}
