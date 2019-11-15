\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{adhdoc}[2015/12/10 General document class]

%% Preliminary declarations

%% Option handling

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

\ProcessOptions\relax

\LoadClass{article}

\RequirePackage[pass]{geometry}

%% Other declarations
\RequirePackage[utf8]{inputenc}
\RequirePackage[british]{babel}
\RequirePackage{fullpage}

\RequirePackage{helvet}
\RequirePackage[sc,osf]{mathpazo}
\renewcommand{\baselinestretch}{1.1}
%\newcommand{\titlefamily}
%\renewcommand{\titlefamily}{\sffamily}

\setlength{\parskip}{\baselineskip}
\setlength{\parindent}{0pt}

% reduce spacing around headings!
\RequirePackage{titlesec}
\titlespacing*{\section}{0pt}{1ex plus 1ex}{0pt}
\titlespacing*{\subsection}{0pt}{1ex plus 1ex}{0pt}
\titlespacing*{\subsubsection}{0pt}{1ex plus 1ex}{0pt}

% redefine title command
\renewcommand{\maketitle}{
  \begin{tabular}{@{}lr}
    \multicolumn{2}{@{} p{\textwidth} }{
      {\normalfont\bfseries\Huge\@title}
    }
    \vspace{0.1in}\\
    {\normalfont\bfseries\Large\@author} &
    {\normalfont\bfseries\Large\@date}\\
  \end{tabular}
  % \vspace{2em}
}

% table packages
\RequirePackage{longtable}
\RequirePackage{booktabs}

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
% \RequirePackage{bibleref-parse}

% useful symbols, abbrevs etc
\RequirePackage{adhsymbols}

\RequirePackage[hidelinks=true]{hyperref}
