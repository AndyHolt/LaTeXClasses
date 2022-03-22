\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{adhsernotes}[2021/12/06 Sermon transcript class v0.1]
%% Log: v0.1: Document class for sermon transcript.

% Define any options here
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

\ProcessOptions\relax

\RequirePackage{ifxetex}

\LoadClass[a4paper, 12pt]{article}

% allow unicode symbols to be used (only needed for pdfLaTeX)
\ifxetex
  \RequirePackage{fontspec}

  \RequirePackage{polyglossia}
  \setmainlanguage[variant=british]{english}

  \defaultfontfeatures{Ligatures=TeX}
  \setmainfont{Iowan Old Style}
  \setsansfont{Avenir}[Scale=MatchLowercase]
  \setmonofont{Menlo}[Scale=MatchLowercase]
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


%% Use biblatex package
\RequirePackage[style=verbose, autocite=footnote]{biblatex}

% reduce spacing around headings!
\RequirePackage[sf,bf]{titlesec}
%% \usepackage[small,sf,bf]{titlesec}
\titlespacing*{\section}{0pt}{1ex plus 1ex}{0pt}
\titlespacing*{\subsection}{0pt}{1ex plus 1ex}{0pt}
\titlespacing*{\subsubsection}{0pt}{1ex plus 1ex}{0pt}

% [review] - use different indents on consecutive lines? Might make it easier to
% track where I am in a sentence.
% left justify text
% \raggedright
\setlength{\parskip}{0pt plus1pt}
\setlength{\parindent}{2em}

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

