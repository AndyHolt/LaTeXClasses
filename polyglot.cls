\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{polyglot}[2014/06/04 Layout parallel translations]

%% Preliminary declarations - set up packages needed for class definition
\RequirePackage{xpatch}
\RequirePackage{ifxetex}
\RequirePackage{ifluatex}

% define any options here
\providetoggle{useuslettersize}
\DeclareOption{lettersize}{
  \toggletrue{useuslettersize}
}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

\ProcessOptions\relax

\LoadClass{article}

\iftoggle{useuslettersize}{
  \typeout{US Letter paper size selected}
  \RequirePackage[letterpaper,landscape]{geometry}
}{
  \typeout{Using A4 paper size}
  \RequirePackage[a4paper,landscape]{geometry}
}

\ifxetex
  \RequirePackage{fontspec}

  \RequirePackage{polyglossia}
  \setmainlanguage[variant=british]{english}
  \defaultfontfeatures{Ligatures=TeX}
  \setotherlanguage[variant=ancient]{greek}

  \setmainfont{Times New Roman}
  \setsansfont{Helvetica}
  \newfontfamily\greekfont{SBL BibLit}
\else
  \ifluatex
    \RequirePackage{fontspec}

    \RequirePackage{polyglossia}
    \setmainlanguage[variant=british]{english}
    \defaultfontfeatures{Ligatures=TeX}
    \setotherlanguage[variant=ancient]{greek}

    \setmainfont{Times New Roman}
    \setsansfont{Helvetica}
    \newfontfamily\greekfont{SBL BibLit}
  \else
    % allow unicode symbols to be used
    \RequirePackage[utf8]{inputenc}
    % set unicode nonbreaking space to LaTeX nonbreaking space
    \DeclareUnicodeCharacter{00A0}{~}

    % babel package for correct hyphenation etc
    \RequirePackage[greek,british]{babel}

    % fonts - use times and helvetica
    \RequirePackage{txfonts}
    \RequirePackage{helvet}
  \fi
\fi

% use adhsymbols definitions
\RequirePackage{adhsymbols}

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
\RequirePackage[vnsuper,cndrop]{paratext}

% don't leave a gap when starting a verse environment
\xpatchcmd{\verse}{\itemsep}{\advance\topsep-\parskip\itemsep}{}{}

\ifxetex
  % can't use microtype in xelatex
\else
  \ifluatex
    \RequirePackage[
      protrusion=true,
      expansion=true,
      % tracking=true,
      % spacing=true,
      babel=true
    ]{microtype}
  \else
  % micro-typography (especially useful due to narrow columns)
  \RequirePackage[
    protrusion=true,
    expansion=true,
    % tracking=true,
    spacing=true,
    babel=true
  ]{microtype}
  \fi
\fi
