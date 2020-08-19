\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{adhsernotes}[2019/05/28 Sermon notes class v0.2]
%% Log: v0.1 was used for several years with slight modifications, set up for
%%           pdfLaTeX compilation
%%      v0.2 begun 28/05/2019, primarily because of shift from writing sermon
%%           notes in markdown to writing in org mode and exporting directly.
%%           For this, I'm using XeLaTeX instead of pdfLaTeX, so need to change
%%           some settings, especially how fonts are handled. Set up using
%%           ifxetex package, which should automatically choose the right
%%           settings for different compilers.


% Define any options here
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

\ProcessOptions\relax

\RequirePackage{ifxetex}

\LoadClass[a5paper, 12pt]{article}

% allow unicode symbols to be used (only needed for pdfLaTeX)
\ifxetex
  \RequirePackage{fontspec}

  \RequirePackage{polyglossia}
  \setmainlanguage[variant=british]{english}

  \defaultfontfeatures{Ligatures=TeX}
  \setmainfont{Iowan Old Style}
  \setsansfont{Avenir}
  %\renewcommand{\familydefault}{\sfdefault}
  \newcommand{\titlefamily}{\sffamily}
\else
   \RequirePackage[utf8]{inputenc}   

   % [review] - font selection - is it readable enough?
   % set default font to sans serif
   \RequirePackage{helvet}
   \renewcommand{\familydefault}{\sfdefault}
   \newcommand{\titlefamily}{\sffamily}

   % Babel package provides correct hyphenation etc
   \RequirePackage[greek,british]{babel}
\fi


% reduce margin sizes
\RequirePackage{fullpage}

\RequirePackage{pgfpages}
\pgfpagesuselayout{2 on 1}[a4paper, landscape]

%% Use biblatex package
\RequirePackage[style=authortitle, autocite=footnote]{biblatex}

% reduce spacing around headings!
\RequirePackage[sf,bf]{titlesec}
%% \usepackage[small,sf,bf]{titlesec}
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
      {\centering\normalfont\titlefamily\LARGE\@title}
      \vspace{.1in}\\
      {\centering\normalfont\titlefamily\passage}\\
      \begin{minipage}{2.5in}
        \begin{center}
          \normalfont\normalsize
          \begin{tabular}[t]{c}
            {\centering\normalfont\titlefamily\@author}
          \end{tabular}
        \end{center}
      \end{minipage}\\
      {\centering\normalfont\titlefamily\@date}\\
    \end{tabular}
  \end{center}
}

% micro-typography
\ifxetex
  \typeout{No microtypography with xetex.}
\else
  \RequirePackage[
    protrusion=true,
    expansion=true,
    tracking=true,
    spacing=true,
    babel=true
  ]{microtype}
\fi

%% block quotes
\RequirePackage[indentfirst=false]{quoting}
\RequirePackage[autopunct=true, threshold=2, thresholdtype=lines,
  parthreshold=true]{csquotes}
\SetBlockEnvironment{quoting}
\SetCiteCommand{\autocite}
% \renewcommand*{\quotingfont}{\leading{12pt}}

% bible referencing
% [todo] - separate package for bible refs
\RequirePackage{bibleref-parse}

\RequirePackage{adhsymbols}

\RequirePackage[hidelinks]{hyperref}
