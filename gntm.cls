\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{gntm}[2020/01/29 Manuscript for GNT study and translation]

\DeclareOption*{\PassOptionToClass{\CurrentOption}{article}}

\ProcessOptions\relax

\LoadClass[10pt]{article}

\RequirePackage[letterpaper,landscape,
  left=1.5in,
  right=5.5in,
  top=1.0in,
  bottom=1.0in
]{geometry}

\RequirePackage{polyglossia}
\setmainlanguage[variant=ancient]{greek}
\defaultfontfeatures{Ligatures=TeX}
\setotherlanguage[variant=british]{english}

\RequirePackage{fontspec}

\setmainfont{Times New Roman}
\setsansfont{Helvetica}
\newfontfamily\greekfont{SBL BibLit}
\newfontfamily\greekfontsf{SBL BibLit}

\setlength{\parindent}{0pt}

\RequirePackage{leading}
\leading{40pt}

\makeatletter
\renewcommand{\maketitle}{
  \begin{center}
    \normalfont\bfseries\@title
  \end{center}
}
\makeatother

\RequirePackage[vnsuper,cndrop]{paratext}
