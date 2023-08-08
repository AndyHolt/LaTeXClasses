\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{adhcompnotes}[2023/07/19 Compact printed notes v0.1]

% Define options
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

\ProcessOptions\relax

\LoadClass[a5paper, 10pt]{article}

\RequirePackage[a5paper, hmargin={2cm, 2cm}, vmargin={2cm,2cm}]{geometry}

\RequirePackage{fontspec}

\RequirePackage{polyglossia}
\setmainlanguage[variant=british]{english}
\defaultfontfeatures{Ligatures=TeX}
\setmainfont{Iowan Old Style}
\setsansfont{Avenir}
%\renewcommand{\familydefault}{\sfdefault}
\newcommand{\titlefamily}{\sffamily}

% Print 2 A5 pages side by side on a single landscape A4 page
\RequirePackage{pgfpages}
\pgfpagesuselayout{2 on 1}[a4paper, landscape]

%% Use biblatex package
\RequirePackage[backend=biber, style=verbose]{biblatex}

% reduce spacing around headings!
\RequirePackage[sf]{titlesec}
%% \usepackage[small,sf,bf]{titlesec}
\titlespacing*{\section}{0pt}{1ex plus 1ex}{0pt}
\titlespacing*{\subsection}{0pt}{1ex plus 1ex}{0pt}
\titlespacing*{\subsubsection}{0pt}{1ex plus 1ex}{0pt}

% left justify text
\raggedright
\setlength{\parskip}{\baselineskip}
\setlength{\parindent}{0pt}
\setlength{\hangindent}{0.7mm}
% one-and-a-half line spacing
% \RequirePackage{setspace}
% \onehalfspacing

% set up sermon title
% \renewcommand{\maketitle}{
%   \begin{center}
%     \begin{tabular}[t]{c}
%       \parbox[c]{\textwidth}
%       {\centering\normalfont\titlefamily\LARGE\@title}
%       \vspace{.1in}\\
%       {\centering\normalfont\titlefamily\passage}\\
%       \begin{minipage}{2.5in}
%         \begin{center}
%           \normalfont\normalsize
%           \begin{tabular}[t]{c}
%             {\centering\normalfont\titlefamily\@author}
%           \end{tabular}
%         \end{center}
%       \end{minipage}\\
%       {\centering\normalfont\titlefamily\@date}\\
%     \end{tabular}
%   \end{center}
% }
\renewcommand{\maketitle}{
  \begin{center}
    {\normalfont\titlefamily\normalsize\MakeUppercase{\@title}}\\
    {\normalfont\titlefamily\footnotesize\passage\quad -- \quad \@date}
  \end{center}
  %\bigskip
}

% micro-typography
\RequirePackage{microtype}

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
