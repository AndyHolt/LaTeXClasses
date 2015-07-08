\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{adhoutline}[2015/07/08 Talk outline class v0.1]

% Define any options here

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

\ProcessOptions\relax

\LoadClass[a4paper, 11pt]{article}

% allow unicode
\RequirePackage[utf8]{inputenc}

% Babel package provides correct hyphenation etc
\RequirePackage[british]{babel}

% reduce margin sizes
\RequirePackage{fullpage}

% font selection
% try helvetica for now
\RequirePackage{helvet}
\renewcommand{\familydefault}{\sfdefault}
\newcommand{\titlefamily}{\sffamily}

% paragraph spacing - better for notes format
\setlength{\parskip}{\baselineskip}
\setlength{\parindent}{0pt}

% set up title to include passage
\renewcommand{\maketitle}{
  \begin{center}
    \begin{tabular}[t]{c}
      \parbox[c][.25in][c]{2.5in}
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

