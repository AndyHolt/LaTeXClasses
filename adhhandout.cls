\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{adhhandout}[2022/10/28 v1.2 LaTeX Class for handouts]

%% Preliminary Declarations - load packages needed for class file

\RequirePackage{etoolbox}
\RequirePackage{xcolor}
\RequirePackage{iftex}

%% Options - handle options to adhhandout class

% Option for paper/electronic document
\providetoggle{forpaperoption}
\togglefalse{forpaperoption}

\DeclareOption{printed}{
  \toggletrue{forpaperoption}
}
\DeclareOption{electronic}{
  \togglefalse{forpaperoption}
}

% Option for paper size: A4 or A5 type of handout
\newtoggle{afoursize}
\togglefalse{afoursize}

\DeclareOption{a5size}{
  \togglefalse{afoursize}
}
\DeclareOption{a4size}{
  \toggletrue{afoursize}
}

% Options for leaders notes inclusion/suppression
% no leaders notes means text does not appear in output
% standard leaders notes are greyed out and in sans font
% full leaders notes are not greyed out, but in sans font
% merge leaders notes are included and not distinguished from main text
\providetoggle{useleadersnotes}
\togglefalse{useleadersnotes}
\providetoggle{usefullleadersnotes}
\togglefalse{usefullleadersnotes}
\providetoggle{usemergeleadersnotes}
\togglefalse{usemergeleadersnotes}

\DeclareOption{leadersnotes}{
  \toggletrue{useleadersnotes}
  \togglefalse{usefullleadersnotes}
  \togglefalse{usemergeleadersnotes}
}
\DeclareOption{noleadersnotes}{
  \togglefalse{useleadersnotes}
  \togglefalse{usefullleadersnotes}
  \togglefalse{usemergeleadersnotes}
}
\DeclareOption{fullleadersnotes}{
  \toggletrue{useleadersnotes}
  \toggletrue{usefullleadersnotes}
  \togglefalse{usemergeleadersnotes}
}
\DeclareOption{mergeleadersnotes}{
  \toggletrue{useleadersnotes}
  \toggletrue{usefullleadersnotes}
  \toggletrue{usemergeleadersnotes}
}

% Options for section styles
\providetoggle{uselinestyle}
\toggletrue{uselinestyle}
\providetoggle{useblockstyle}
\togglefalse{useblockstyle}

\DeclareOption{blockstyle}{
  \togglefalse{uselinestyle}
  \toggletrue{useblockstyle}
}
\DeclareOption{linestyle}{
  \togglefalse{useblockstyle}
  \toggletrue{uselinestyle}
}

% Options for fonts, for non-XeTeX/fontspec use

% toggles for different font sets
\providetoggle{cmfont}
\providetoggle{timesfont}
\providetoggle{palatinofont}
\providetoggle{palahelvfont}
\providetoggle{timesoptfont}

% default to palatino
\togglefalse{cmfont}
\togglefalse{timesfont}
\togglefalse{palatinofont}
\toggletrue{palahelvfont}
\togglefalse{timesoptfont}

\DeclareOption{cm}{
\toggletrue{cmfont}
\togglefalse{timesfont}
\togglefalse{palatinofont}
\togglefalse{palahelvfont}
\togglefalse{timesoptfont}
}
\DeclareOption{times}{
\togglefalse{cmfont}
\toggletrue{timesfont}
\togglefalse{palatinofont}
\togglefalse{palahelvfont}
\togglefalse{timesoptfont}
}
\DeclareOption{palatino}{
\togglefalse{cmfont}
\togglefalse{timesfont}
\toggletrue{palatinofont}
\togglefalse{palahelvfont}
\togglefalse{timesoptfont}
}
\DeclareOption{palahelv}{
\togglefalse{cmfont}
\togglefalse{timesfont}
\togglefalse{palatinofont}
\toggletrue{palahelvfont}
\togglefalse{timesoptfont}
}
\DeclareOption{timesopt}{
\togglefalse{cmfont}
\togglefalse{timesfont}
\togglefalse{palatinofont}
\togglefalse{palahelvfont}
\toggletrue{timesoptfont}
}

% pass other options to article class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

\ProcessOptions\relax

%% Class definitions and set up

\LoadClass{article}
\fontsize{11pt}{14pt}\selectfont

\iftoggle{afoursize}{
  \typeout{A4 page size option selected}
  \RequirePackage[paper=a4paper]{geometry}
}{
  \typeout{A4 page size option not selected, use A5 size}
  % NB if headers specified, may need to use `includeheadfoot=true' instead of
  % `includefoot=true' to create space for header
  \RequirePackage[a5paper, margin={1cm,1cm}, includefoot=true]{geometry}
}

% font set up
% all of this font configuration borrows very heavily from
% dr drang (https://github.com/drdrang/drangreport)
\newcommand{\titlefamily}{}

% \ifxetex
  % \typeout{XeTeX engine used: set up external fonts for XeTeX}
  \RequirePackage{fontspec}
  \RequirePackage{polyglossia}
  \setmainlanguage[variant=british]{english}
  \defaultfontfeatures{Ligatures=TeX}
  \setmainfont{Iowan Old Style}
  % Need to use Avenir Next and not Avenir for small caps
  \setsansfont{Avenir Next}
  \setotherlanguage[variant=ancient]{greek}
  \newfontfamily\greekfont{Gentium Plus}[Scale=MatchLowercase]
  \newfontfamily\greekfontsf{GFS Neohellenic}[Scale=MatchLowercase]
  \renewcommand{\titlefamily}{\rmfamily}
  \newfontfamily\symbolfont{Symbola}[Scale=MatchLowercase]
% \else
%   \typoeout{XeTeX engine not used, configure LaTeX fonts}
%   % allow unicode symbols to be used
%   \RequirePackage[utf8]{inputenc}

%   % babel package provides correct hyphenation etc
%   \RequirePackage[greek,british]{babel}
%   \iftoggle{cmfont}{
%     \typeout{computer modern font used}
%   }{}
%   \iftoggle{timesfont}{
%     \typeout{times font used}
%     \savesymbol{iint}
%     \RequirePackage{txfonts}
%     \restoresymbol{txf}{iint}
%     \renewcommand{\titlefamily}{\sffamily}
%     }{}
%   \iftoggle{palatinofont}{
%     \typeout{palatino font used}
%     \RequirePackage[sc,osf]{mathpazo}
%     \RequirePackage{classico}
%     \renewcommand{\baselinestretch}{1.1}
%     \renewcommand{\titlefamily}{\sffamily}
%   }{}
%   \iftoggle{palahelvfont}{
%     \typeout{palatino and helvetica fonts used}
%     \RequirePackage[sc,osf]{mathpazo}
%     \RequirePackage{helvet}
%     \renewcommand{\baselinestretch}{1.1}
%     \renewcommand{\titlefamily}{\sffamily}
%   }{}
%   \iftoggle{timesoptfont}{
%     \typeout{times and optima fonts used}
%     \savesymbol{iint}
%     \RequirePackage{txfonts}
%     \restoresymbol{txf}{iint}
%     \RequirePackage{classico}
%     \renewcommand{\titlefamily}{\sffamily}
%   }{}
% \fi

% packages to provide extra symbols
\RequirePackage{adhsymbols}

% float package for [H] exact float placement
\RequirePackage{float}
\RequirePackage[margin=10pt, skip=-8pt, font=footnotesize]{caption}

% load titlesec here as needs to be loaded before Hebrew font and bidi setup
\RequirePackage{titlesec}
% settings for table of contents
\RequirePackage{titletoc}

% paragraph spacing
\setlength{\parskip}{\baselineskip}
\setlength{\parindent}{0pt}

\newcommand{\@minipagerestore}{\setlength{\parskip}{\baselineskip}}

% remove spacing around lists
\RequirePackage{enumitem}
% \setlist[itemize]{topsep=0pt}
\setlist{nosep}
\setlist{topsep=-\baselineskip, itemsep=0pt, parsep=0pt}
\setlist[itemize,1]{label=\textbullet}
\setlist[itemize,2]{label=--}
\setlist[itemize,3]{label=$\circ$}
\setlist[itemize,4]{label=$\triangleright$}

% multicol package for multiple-column layout
\RequirePackage{multicol}

% define some boxed environments for exercises, examples, discussion prompts,
% etc
\RequirePackage[most]{tcolorbox}
\newtcolorbox{adh-box}[2][]{enhanced,
    fonttitle=\rmfamily\itshape\small,
    boxrule=0.4pt,
    colframe=black,
    sharp corners,
    no shadow,
    colback=white,
    colbacktitle=white,
    coltitle=black,
    boxed title style={colframe=white},
    attach boxed title to top left={xshift=1em,yshift=-\tcboxedtitleheight/2}, 
    title=#2,#1}

\newenvironment{discussion}{%
  \begin{adh-box}{Discuss}}{%
  \end{adh-box}}

\newenvironment{reflection}{%
  \begin{adh-box}{Reflect}}{%
  \end{adh-box}}

\newenvironment{exercise}{%
  \begin{adh-box}{Have a go!}}{%
  \end{adh-box}}

% Put footnotes at bottom of the page, not floating up to text
\RequirePackage[bottom]{footmisc}

% microtype set up  
% \ifxetex
\RequirePackage{microtype}
% \else
%   \RequirePackage[
%     protrusion=true,
%     expansion=true,
%     spacing=true,
%     babel=true
%   ]{microtype}
% \fi

% bible referencing
% [todo] - separate package for bible refs
\RequirePackage{bibleref-parse}
\newcommand{\bv}[1]{(pbibleverse{#1})}
\newcommand{\bvnc}[1]{pbibleverse{#1}}

\RequirePackage[vnsuper,cnplain]{paratext}

% bibliography set up (occasionally used)
\RequirePackage[style=verbose-ibid, natbib=true]{biblatex}

% didasko package specifies handout gap/boxes etc
% \RequirePackage{didasko}

% Create environment for leaders notes
\RequirePackage{environ}
\iftoggle{useleadersnotes}{
  \typeout{Leaders Notes included, in some form}
  \iftoggle{usefullleadersnotes}{
    \typeout{Leaders Notes included in full form}
    \iftoggle{usemergeleadersnotes}{%
      \typeout{Leaders Notes included in full, merged form}
      \NewEnviron{leadersnote}
      {\BODY}
      {}}{%
      \typeout{Leaders Notes included in full, unmerged form}
      \NewEnviron{leadersnote}
      {\sffamily\BODY}
      {}}}{%
    \typeout{Leaders Notes included in greyed, sans font}
  \NewEnviron{leadersnote}
  {\sffamily\color{gray}\BODY}
  {}}
}{
  \typeout{Leaders Notes not included}
  \NewEnviron{leadersnote}
  {\@gobble{\BODY}}
  {}
}

% table packages
\RequirePackage{longtable}
\RequirePackage{booktabs}

% image packages
\RequirePackage{graphicx}

% Define headers and footers
\RequirePackage{fancyhdr}
\pagestyle{plain}
\fancypagestyle{cr}{%
  \fancyhf{}%
  \fancyfoot[L]{\footnotesize \license}
  \fancyfoot[C]{\thepage}
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0pt}
}
\RequirePackage{ccicons}


% Hyperref package
% only use coloured links if electronic option, not if paper.
% must come last in class file as it redefines commands which may be changed by
% other packages.
\RequirePackage{hyperref}
\iftoggle{forpaperoption}{
  \typeout{Paper option set: no coloured links}
  \hypersetup{
    hidelinks
  }
}{
  \typeout{Electronic options set: colour links}
  \hypersetup{
    colorlinks=true,
    linkcolor=red,
    urlcolor=blue,
    citecolor=blue
  }
  \RequirePackage{footnotebackref}
}


\ifxetex
  \setotherlanguage{hebrew}
  \newfontfamily\hebrewfont[Script=Hebrew]{SBL BibLit}
\else
  \typeout{XeTeX not used, not loading Hebrew fonts!}
\fi

\RequirePackage{bidi}

% Set up main title and section headers according to selected style
% For some reason, yet unknown to me, loading hebrew as a language overrides the
% maketitle macro, so place this afterwards
% N.B. FOR EDITING: PACKAGE LOADING MUST BE DONE *BEFORE* HEBREW AND BIDI SET
% UP, THOUGH REDEFINING AND SETTING MACROS MAY BE DONE AFTERWARDS WITH CARE
\iftoggle{uselinestyle}{
  % \titleformat*{\section}{\normalfont\titlefamily\bfseries\large}
  \titleformat{\section}[hang]
  {\normalfont\titlefamily\bfseries\large}{\thesection.}{0.5em}{}[\hrule]
  \titlespacing*{\section}{1.5ex}{0.2ex plus 0.0ex minus .0ex}{0.0ex plus .1ex}

  % \titleformat*{\subsection}{\normalfont\titlefamily\bfseries\large}
  \titleformat{\subsection}[hang]
  {\normalfont\titlefamily\bfseries\normalsize}{\thesubsection}{0.5em}{}[\hrule]
  \titlespacing*{\subsection}{1.5ex}{0.5ex plus 0.5ex minus 0.5ex}{0.2ex plus .2ex minus 0.2ex}

  % \titleformat*{\subsubsection}{\normalfont\titlefamily\bfseries\normalsize}
  \titleformat{\subsubsection}[hang]
  {\normalfont\titlefamily\normalsize}{\thesubsubsection}{0.5em}{}[\hrule]
  \titlespacing*{\subsubsection}{1.5ex}{0.5ex plus 0.5ex minus .2ex}{0.2ex plus .2ex}

  \titleformat*{\paragraph}{\normalfont\titlefamily\bfseries\normalsize}

  \titleformat*{\subparagraph}{\normalfont\titlefamily\itshape\normalsize}

  \iftoggle{afoursize}{
    \renewcommand{\maketitle}{
      \begin{center}
        {\normalfont\titlefamily\bfseries\huge\centering\@title}
      
        {\normalfont\titlefamily\bfseries\large\@author}
      
        {\normalfont\titlefamily\bfseries\large\@date}
      \end{center}
    }
  }{
    \renewcommand{\maketitle}{
      \begin{center}
        \begin{tabular}{lr}
          \multicolumn{2}{l}{\normalfont\titlefamily\bfseries\huge\@title}
          \vspace{1ex}\\
          {\normalfont\titlefamily\bfseries\large\@author} &
          {\normalfont\titlefamily\bfseries\large\@date}\\
        \end{tabular}
      \end{center}
    }
  }
}{}

\iftoggle{useblockstyle}{
  \newcommand{\colorblacksection}[1]{%
    \colorbox{black}{\color{white}\parbox{\textwidth}{\hspace{0.5ex}#1}}}

  \newcommand{\colorgreysection}[1]{%
    \colorbox{gray}{\color{white}\parbox{\textwidth}{#1}}}

  \newcommand{\boxsection}[1]{%
    \framebox{\parbox{\textwidth}{#1}}}

  % \titleformat*{\section}{\normalfont\titlefamily\bfseries\Large}
  \titleformat{\section}[hang]
  {\normalfont\titlefamily\bfseries\large}{\colorbox{black}{\color{white}\parbox{1.5em}{\thesection}}}{0em}{\colorblacksection}
  \titlespacing*{\section}{0pt}{0.2ex plus 0.0ex minus .0ex}{0.1ex plus .1ex}

  % \titleformat*{\subsection}{\normalfont\titlefamily\bfseries\large}
  \titleformat{\subsection}[hang]
  {\normalfont\titlefamily\bfseries\normalsize}{\thesection}{0.5em}{\colorgreysection}
  \titlespacing*{\subsection}{0pt}{0.5ex plus 0.5ex minus .2ex}{0.2ex plus .2ex}

  % \titleformat*{\subsubsection}{\normalfont\titlefamily\bfseries\normalsize}
  \titleformat{\subsubsection}[hang]
  {\normalfont\titlefamily\normalsize}{\thesection}{0.5em}{\boxsection}
  \titlespacing*{\subsubsection}{0pt}{0.5ex plus 0.5ex minus .2ex}{0.2ex plus .2ex}

  \titleformat*{\paragraph}{\normalfont\titlefamily\bfseries\normalsize}

  \titleformat*{\subparagraph}{\normalfont\titlefamily\itshape\normalsize}

  \iftoggle{afoursize}{
    \renewcommand{\maketitle}{
      \begin{center}
        {\normalfont\titlefamily\bfseries\huge\centering\@title}
      
        {\normalfont\titlefamily\bfseries\large\@author}
      
        {\normalfont\titlefamily\bfseries\large\@date}
      \end{center}
    }
  }{
    \renewcommand{\maketitle}{
      \colorbox{black}{
        \color{white}
        \begin{tabular}{lr}
          \multicolumn{2}{c}{
            % [todo] - space this properly (this is a bodge!)
            % See changes made to adhdoc title setting, which I think will work
            % the same here!
          \begin{minipage}{0.95\textwidth}
            \vspace{-1.0ex}{\normalfont\titlefamily\bfseries\huge\@title}
          \end{minipage}
          }
          \vspace{0.1in}\\
          {\normalfont\titlefamily\bfseries\large\@author} &
          {\normalfont\titlefamily\bfseries\large\@date}\\
        \end{tabular}
      }
    }
  }
}{}

\dottedcontents{section}[3.8em]{\vspace{-6pt}}{2.3em}{1pc}
\dottedcontents{subsection}[6.1em]{\vspace{-6pt}\small}{2.3em}{1pc}
\dottedcontents{subsubsection}[8.4em]{\vspace{-6pt}\small}{3.2em}{1pc}
