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

% [todo] - set up font selection - probably use sanserif throughout (Helvetica?)

% [todo] - set paragraph spacing to format for easy reading at a glance

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

