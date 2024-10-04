%%
%% This is file `fsuthesis.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% fsuthesis.dtx  (with options: `class')
%% 
%% This is a generated file.
%% 
%% Copyright (c) 2010-2013 by Bret Whissel
%% 
%% This file may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either
%% version 1.2 of this license or (at your option) any later
%% version.  The latest version of this license is in:
%% 
%%    http://www.latex-project.org/lppl.txt
%% 
%% and version 1.2 or later is part of all distributions of
%% LaTeX version 1999/12/01 or later.
%% 

\NeedsTeXFormat{LaTeX2e}[2005/09/16]
\ProvidesClass{fsuthesis}
  [2022/03/25 v4.3.0
    (FSU LaTeX document class for Theses/Dissertations
     maintained by Bret Whissel, bwhissel@fsu.edu)]
\newif\if@hardcopy
\newif\if@expanded
\newif\ifch@pleaders
\newif\ifc@pyright
\DeclareOption{hardcopy}{\@hardcopytrue}
\DeclareOption{expanded}{\@expandedtrue}
\DeclareOption{chapterleaders}{\ch@pleaderstrue}
\DeclareOption{copyright}{\c@pyrighttrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions \relax
\LoadClass{report}
\RequirePackage{ifpdf}
\setlength{\headheight}{\topskip}
\setlength{\headsep}{1.5\baselineskip}
\setlength{\topmargin}{-\headheight}
\addtolength{\topmargin}{-\headsep}

\setlength{\@tempdima}{\paperheight}
\addtolength{\@tempdima}{-2.075in} % 2in plus a little fudge
\divide\@tempdima\baselineskip
\@tempcnta=\@tempdima
\setlength\textheight{\@tempcnta\baselineskip}
\setlength{\footskip}{\paperheight}
\addtolength{\footskip}{-1.8in} %  0.75in with a little fudge
\addtolength{\footskip}{-\textheight}
\setlength{\textwidth}{6.5in}
\setlength{\@tempdima}{\paperwidth}
\addtolength{\@tempdima}{-2in}
\addtolength{\@tempdima}{-\textwidth}
\divide\@tempdima by2
\setlength{\oddsidemargin}{\@tempdima}
\setlength{\evensidemargin}{\@tempdima}
\newlength{\evenoddoffset}
\setlength{\evenoddoffset}{0.25in}
\if@hardcopy%
  \AtBeginDocument{\addtolength{\textwidth}{-\evenoddoffset}%
    \addtolength{\oddsidemargin}{\evenoddoffset}}
  \if@twoside\@openrighttrue%
    \AtBeginDocument{\addtolength{\evensidemargin}{-\evenoddoffset}}
  \else
    \AtBeginDocument{\addtolength{\evensidemargin}{\evenoddoffset}}\fi
\fi
\ifch@pleaders
  \renewcommand*\l@chapter[2]{%
    \ifnum \c@tocdepth >\m@ne
      \addpenalty{-\@highpenalty}%
      \vskip 1.0em \@plus\p@
      {\@dottedtocline{0}{0pt}{1.5em}{\bfseries#1}{\bfseries#2}}
    \fi}
\fi
\if@expanded
  \newlength{\adjbaselineskip}%
  \setlength{\adjbaselineskip}{0.5\baselineskip}%
  \def\blstretchiness{0pt plus.4pt minus.3pt}
  \def\smblstretchiness{0pt plus.3pt minus.2pt}
  \newlength{\listbaselineskip}%
  \@tempdima=\baselineskip\advance\@tempdima by\adjbaselineskip
  \setlength{\listbaselineskip}{0.8\@tempdima}
  \let\FSU@onormalsize=\normalsize%
  \newcommand{\expandspacing}{\FSU@onormalsize%
     \addtolength{\baselineskip}{\adjbaselineskip}%
     \addtolength{\baselineskip}{\blstretchiness}}%
  \let\normalsize=\expandspacing%
  \newcommand{\afterheadadj}{\addvspace{-\adjbaselineskip}}%
  \let\f@olist=\list
  \def\list#1#2{%
    \f@olist{#1}{#2}
    \ifnum\@listdepth=1
      \setlength{\baselineskip}{\listbaselineskip}
      \addtolength{\baselineskip}{\smblstretchiness}
    \fi
  }
  \let\f@oendlist=\endlist
  \def\endlist{%
    \f@oendlist
    \ifnum\@listdepth=0 \normalsize \fi
  }
  \let\f@overbat=\verbatim
  \expandafter\let\expandafter\f@overbats
    \expandafter=\csname endverbatim*\endcsname
  \let\f@oendverb=\endverbatim
  \def\verbatim{\par\FSU@onormalsize\f@overbat}
  \def\endverbatim{\f@oendverb\afterheadadj}
  \@namedef{verbatim*}{\par\FSU@onormalsize\@verbatim\@sxverbatim}
  \expandafter\let\csname endverbatim*\endcsname =\endverbatim
\else
  \let\expandspacing=\relax
  \let\FSU@onormalsize=\relax
  \let\afterheadadj=\relax
  \let\f@olist=\list
  \let\f@oendlist=\endlist
\fi
\FSU@onormalsize
\newenvironment{singlespaced}
  {\par\if@expanded\FSU@onormalsize\addvspace{\adjbaselineskip}\fi}{\par}
\newif\if@hyperloaded
\AtBeginDocument{\@ifpackageloaded{hyperref}
  {\@hyperloadedtrue}{\@hyperloadedfalse}}
\gdef\@degree{\ClassError{fsuthesis}%
  {No \protect\degree\space given}%
  {You must provide a \protect\degree{Degree Name}%
   \space command}}
\gdef\@department{\ClassError{fsuthesis}%
  {No \protect\department\space given}%
  {You must provide a \protect\department{Name of Department}%
   \space command}}
\gdef\@college{\ClassError{fsuthesis}%
  {No \protect\college\space given}%
  {You must provide a \protect\college{My College or School}%
   \space command}}
\gdef\@degreeyear{\ClassError{fsuthesis}%
  {No \protect\degreeyear\space given}%
  {You must provide a \protect\degreeyear{20NN}\space command}}
\gdef\@defensedate{\ClassError{fsuthesis}%
  {No \protect\defensedate\space given}%
  {You must provide a \protect\defensedate{Month dd, 20NN}%
   \space command}}
\gdef\@manuscripttype{\ClassError{fsuthesis}%
  {No \protect\manuscripttype\space given}%
  {You must provide a \protect\manuscripttype{Dissertation}%
   \space command}}
\newif\if@department
\newcommand*{\degree}[1]{\gdef\@degree{#1}}
\newcommand*{\department}[1]{\gdef\@department{#1}\@departmenttrue}
\newcommand*{\college}[1]{\gdef\@college{#1}}
\newcommand*{\degreeyear}[1]{\gdef\@degreeyear{#1}}
\newcommand*{\defensedate}[1]{\gdef\@defensedate{#1}}
\newcommand*{\manuscripttype}[1]{\gdef\@manuscripttype{#1}}
\newcommand*{\semester}[1]{}
\renewcommand{\maketitle}{\begin{titlepage}%
\ifpdf\if@hyperloaded\pdfbookmark[0]{Title Page}{MainTitlePage}\fi\fi%
\setlength{\@tempdima}{\paperheight}%
\addtolength{\@tempdima}{-2.075in}% 2in plus a little fudge
\addtolength{\@tempdima}{-\textheight}%
\enlargethispage{\@tempdima}%
\begin{center}%
\FSU@onormalsize FLORIDA STATE UNIVERSITY
\vskip\baselineskip
\MakeUppercase{\@college}%
\vfill
\vskip-\baselineskip
{\addtolength{\baselineskip}{\baselineskip}%
\MakeUppercase{\@title}\vfill}
By
\vskip\baselineskip
\MakeUppercase{\@author}
\vfill
A \@manuscripttype{} submitted to the\\
\if@department\@department\else\@college\fi\\
in partial fulfillment of the\\
requirements for the degree of\\
\@degree
\vfill
\@degreeyear%
\vfill
\ifc@pyright%
  Copyright \copyright\ \@degreeyear\ \@author. All Rights Reserved.\fi%
\pagebreak[4]
\end{center}
\end{titlepage}
}
\newlength{\commwidth}
\setlength{\commwidth}{4in}
\newlength{\commskip}
\setlength{\commskip}{0.5in plus0.25fil minus.3in}
\gdef\@thecmems{}
\newcommand{\committeeperson}[2]{%
  \expandafter\gdef\expandafter\@thecmems\expandafter{%
    \@thecmems\vskip\commskip\makebox[\commwidth][l]{#1}\\
      \makebox[\commwidth][l]{#2}}}
\newcommand{\makecommitteepage}{\FSU@onormalsize\setcounter{page}{2}%
\if@openright\cleardoublepage\else\clearpage\fi%
\addtolength{\baselineskip}{0.4\baselineskip}
\setbox\@tempboxa=\hbox{\@author{} defended this
  \MakeLowercase{\@manuscripttype} on \mbox{\@defensedate}.}
\ifdim\wd\@tempboxa>\textwidth\raggedright\noindent\unhbox\@tempboxa{}
  \else\noindent\unhbox\@tempboxa\par\noindent\fi
The members of the supervisory committee were:\par
\vfil\begin{flushright}\vskip-\commskip%
  %\addtolength{\baselineskip}{0.4\baselineskip}
  \@thecmems\end{flushright}\vfil
\vskip\baselineskip
{%\addtolength{\baselineskip}{0.5\baselineskip}
\noindent
The Graduate School has verified and approved the
above-named committee members, and certifies that the
\MakeLowercase{\@manuscripttype} has been approved in accordance
with university requirements.\par}\vfil\pagebreak[4]}
\gdef\@subject{}
\gdef\@keywords{}
\newif\if@subject
\newif\if@keywords
\newcommand*{\subject}[1]{\gdef\@subject{#1}\@subjecttrue}
\newcommand*{\keywords}[1]{\gdef\@keywords{#1}\@keywordstrue}
\def\@pdfmetadata{{\def\protect{}\def\\{ }%
  \edef\@litstr{/Title (\@title) /Author (\@author)}%
  \if@subject\edef\@litstr{\@litstr /Subject (\@subject)}\fi%
  \if@keywords\edef\@litstr{\@litstr /Keywords (\@keywords)}\fi%
  \expandafter\pdfinfo\expandafter{\@litstr}}}
\def\@hypermetadata{{\def\\{ }\edef\@nt{\@title}%
  \hypersetup{pdftitle={\@nt},pdfauthor={\@author}}%
  \if@subject\hypersetup{pdfsubject={\@subject}}\fi%
  \if@keywords\hypersetup{pdfkeywords={\@keywords}}\fi}}
\AtBeginDocument{\ifpdf\if@hyperloaded\@hypermetadata\else\@pdfmetadata\fi\fi}
\newcommand{\frontmatter}{\pagenumbering{roman}}
\newcommand{\mainmatter}{%
  \if@openright\cleardoublepage\else\clearpage\fi%
  \expandspacing\pagenumbering{arabic}}
\newcommand*{\acknowledgename}{Acknowledgments}
\newcommand*{\biosketchname}{Biographical Sketch}
\renewcommand*{\contentsname}{Table of Contents}
\newcommand*{\listabbrevname}{List of Abbreviations}
\newcommand*{\listmusexname}{List of Musical Examples}
\newcommand*{\listsymname}{List of Symbols}
\newcommand*{\musexname}{Example}
\newcommand*{\appendixtocname}{Appendix}
\newenvironment{dedication}%
  {\if@openright\cleardoublepage\else\clearpage\fi\mbox{}\vfill}
  {\vfill\mbox{}\pagebreak[4]}
\newenvironment{acknowledgments}%
  {\chapter*{\acknowledgename}\normalsize\afterheadadj}
  {\clearpage\FSU@onormalsize}
\newenvironment{listofsymbols}
  {\chapter*{\listsymname}\FSU@onormalsize%
   \addcontentsline{toc}{frontmatter}{\listsymname}}
  {\clearpage}
\newenvironment{listofabbrevs}
  {\chapter*{\listabbrevname}\FSU@onormalsize%
   \addcontentsline{toc}{frontmatter}{\listabbrevname}}
  {\clearpage}
\renewenvironment{abstract}%
  {\chapter*{\abstractname}\normalsize\afterheadadj%
   \addcontentsline{toc}{frontmatter}{\abstractname}}
  {\clearpage\FSU@onormalsize}
\newcount\listspenalty
\listspenalty=200
\def\@dottedtocline#1#2#3#4#5{%
  \ifnum #1>\c@tocdepth \else
    \vskip \z@ \@plus.2\p@
    {\leftskip #2\relax \rightskip \@tocrmarg \parfillskip -\rightskip
     \parindent #2\relax\@afterindenttrue
     \interlinepenalty=\listspenalty
     \leavevmode \@tempdima #3\relax
     \advance\leftskip \@tempdima \null\nobreak\hskip -\leftskip
     {#4}\nobreak \leaders\hbox{$\m@th
        \mkern \@dotsep mu\hbox{.}\mkern \@dotsep
        mu$}\hfill \nobreak%
     \setbox\@tempboxa=\hbox{\normalfont\begingroup\normalcolor #5\endgroup}%
     \ifdim\@pnumwidth<\wd\@tempboxa \hbox{\normalfont\begingroup\normalcolor #5\endgroup}%
       \else \hb@xt@\@pnumwidth{\hfil\normalfont\begingroup\normalcolor #5\endgroup}\fi%
     \setbox\@tempboxa\null
     \par}%
  \fi}
\renewcommand{\tableofcontents}{
  \if@twocolumn\@restonecoltrue\onecolumn\else\@restonecolfalse\fi
  \chapter*{\contentsname
    \@mkboth{\MakeUppercase\contentsname}{\MakeUppercase\contentsname}}%
  \ifpdf\if@hyperloaded\pdfbookmark[0]{Table of Contents}{contents}\fi\fi
  {\listspenalty=10000\@starttoc{toc}\if@restonecol\twocolumn\fi}%
}
\newif\iffront@dded
\newcommand*\l@frontmatter{%
  \iffront@dded\addvspace{1ex \@plus\p@}\else\front@ddedtrue\fi
  \@dottedtocline{0}{0pt}{0pt}}
\def\toclevel@frontmatter{1}
\newif\ifb@ckadded
\newcommand*\l@backmatter{%
  \ifb@ckadded\addpenalty{\@highpenalty}\addvspace{1ex \@plus\p@}%
    \addpenalty{\@highpenalty}%
  \else\b@ckaddedtrue\addpenalty{0}\addvspace{1em \@plus\p@}\fi%
  \@dottedtocline{0}{0pt}{0pt}}
\def\toclevel@backmatter{0}
\renewcommand*\l@figure{%
  \addvspace{10pt}%
  \@dottedtocline{0}{0pt}{3.2em}}
\let\l@table\l@figure
\newcommand{\FSU@lofsomething}[2]{\FSU@onormalsize%
  \if@twocolumn\@restonecoltrue\onecolumn\else\@restonecolfalse\fi
  \chapter*{#1}%
  \addvspace{-10pt}
  \addcontentsline{toc}{frontmatter}{#1}%
  \@mkboth{\MakeUppercase{#1}}{\MakeUppercase{#1}}
  \@starttoc{#2}%
  \if@restonecol\twocolumn\fi
}
\renewcommand{\listoftables}{%
  \FSU@lofsomething{\listtablename}{lot}}
\renewcommand{\listoffigures}{%
  \FSU@lofsomething{\listfigurename}{lof}}
\newcommand{\listofmusex}{%
  \FSU@lofsomething{\listmusexname}{lom}}
\let\l@musex\l@figure
\newcounter{musex}[chapter]
\renewcommand{\themusex}%
  {\ifnum\c@chapter>\z@\thechapter.\fi\@arabic\c@musex}
\newcommand{\theHmusex}%
  {\ifnum\c@chapter>\z@\thechapter.\fi\@arabic\c@musex}
\def\fps@musex{tbp}
\def\ftype@musex{1}
\def\ext@musex{lom}
\def\fnum@musex{\musexname\nobreakspace\themusex}
\newenvironment{musex}%
  {\@float{musex}}
  {\end@float}
\newenvironment{musex*}%
  {\@dblfloat{musex}}
  {\end@dblfloat}
\newskip{\refitemsep}
\newskip{\refindent}
{\FSU@onormalsize%
\global\setlength{\refitemsep}{\baselineskip}
\global\addtolength{\refitemsep}{0pt plus3pt minus0.2pt}}
\setlength{\refindent}{2.5em}
\newenvironment{references}
  {\chapter*{\bibname}\FSU@onormalsize%
   \interlinepenalty=10000\sloppy
   \addvspace{-\baselineskip} \@afterindenttrue%
   \addcontentsline{toc}{backmatter}{\bibname}%
   \setlength{\leftskip}{\refindent}%
   \setlength{\parindent}{-\refindent}%
   \setlength{\parskip}{\refitemsep}}
  {\clearpage}
\renewenvironment{thebibliography}[1]
     {\chapter*{\bibname}\FSU@onormalsize%
      \addcontentsline{toc}{backmatter}{\bibname}%
      \@mkboth{\MakeUppercase\bibname}{\MakeUppercase\bibname}%
      \f@olist{\@biblabel{\@arabic\c@enumiv}}%
         {\settowidth\labelwidth{\@biblabel{#1}}%
          \leftmargin\labelwidth
          \advance\leftmargin\labelsep
          \@openbib@code
          \usecounter{enumiv}%
          \let\p@enumiv\@empty
          \setlength{\itemsep}{\refitemsep}
          \setlength{\parsep}{0pt}
          \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \interlinepenalty=10000
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \f@oendlist}
\def\f@plainnat{%
  \setlength{\bibsep}{\refitemsep}
  \setlength{\bibhang}{\refindent}
  \renewcommand\bibsection{\chapter*{\bibname}\FSU@onormalsize%
     \addcontentsline{toc}{backmatter}{\bibname}%
     \let\f@oldpre=\bibpreamble\let\f@oldpost=\bibpostamble%
     \renewcommand\bibpreamble{\f@oldpre\interlinepenalty=10000
       \if@expanded\let\f@savenlist=\list\let\list=\f@olist\fi}%
     \renewcommand\bibpostamble{%
       \if@expanded\let\list=\f@savenlist\fi\f@oldpost}}}
\def\f@apacite{%
  \renewcommand{\bibliographytypesize}{\FSU@onormalsize%
     \interlinepenalty=10000
     \if@expanded\let\f@savenlist=\list\let\list=\f@olist\fi}%
  \@ifpackageloaded{natbib}%
    {\renewcommand\bibsection{\chapter*{\bibname}
       \addcontentsline{toc}{backmatter}{\bibname}}
     \setlength{\bibsep}{\refitemsep}%
     \setlength{\bibhang}{\refindent}}%
    {\setlength{\bibitemsep}{\refitemsep}%
     \setlength{\bibleftmargin}{\refindent}%
     \setlength{\bibindent}{-\refindent}%
     \renewcommand{\st@rtbibchapter}{\chapter*{\bibname}%
         \addcontentsline{toc}{backmatter}{\bibname}}}}
\def\f@biblatex{%
  \AtBeginBibliography{%
    \FSU@onormalsize \interlinepenalty=10000%
    \addcontentsline{toc}{backmatter}{\bibname}}
  \setlength{\bibitemsep}{\refitemsep}%
  \setlength{\bibhang}{\refindent}%
  }

\AtBeginDocument{%
  \@ifpackageloaded{biblatex}{\f@biblatex}%
  {\@ifpackageloaded{apacite}{\f@apacite}%
  {\@ifpackageloaded{natbib}{\f@plainnat}{}}}}
\newenvironment{biosketch}
  {\chapter*{\biosketchname}\normalsize\afterheadadj%
   \addcontentsline{toc}{backmatter}{\biosketchname}}
  {\clearpage\FSU@onormalsize}
\newlength{\chapheadskip}
\sbox\@tempboxa{\LARGE\bfseries CHAPTER}
\setlength{\chapheadskip}{0in}
\addtolength{\chapheadskip}{-\ht\@tempboxa}
\def\@makechapterhead#1{%
  \hrule height0pt depth0pt width0pt\vskip\chapheadskip%
  {\centering\parindent=0pt\LARGE\bfseries%
   \ifnum\c@secnumdepth >\m@ne%
     \MakeUppercase{\@chapapp}\space\thechapter\par
     \nobreak\vskip20pt\fi%
   \interlinepenalty\@M%
   \MakeUppercase{#1}\par\nobreak\addvspace{40pt}
  }
}
\def\@makeschapterhead#1{%
  \hrule height0pt depth0pt width0pt\vskip\chapheadskip%
  {\centering\parindent=0pt\LARGE\bfseries%
   \interlinepenalty\@M%
   \MakeUppercase{#1}\par\nobreak\addvspace{40pt}
  }
}
\renewcommand{\section}{\@startsection{section}{1}{0pt}%
  {4.0ex plus1ex minus0.3ex}%
  {2.0ex plus0.3ex minus0.2ex}%
  {\normalfont\centering\let\@hangfrom=\relax\Large\bfseries}}
\renewcommand{\subsection}{\@startsection{subsection}{2}{0pt}%
  {3ex plus.8ex minus0.1ex}%
  {1.25ex plus0.1ex minus.1ex}%
  {\normalfont\raggedright\large\bfseries}}
\renewcommand{\subsubsection}[1]%
  {\@startsection{subsubsection}{3}{\parindent}%
    {1ex plus.5ex minus0.1ex}%
    {-1em}%
    {\normalfont\bfseries}{#1.}}
\renewcommand{\paragraph}[1]%
  {\@startsection{paragraph}{4}{\parindent}%
    {1ex plus0.5ex minus0.1ex}%
    {-0.75em}%
    {\normalfont\sffamily\slshape}{#1.}}
\renewcommand{\subparagraph}[1]%
  {\@startsection{subparagraph}{5}{\parindent}%
    {0pt}{-0.5em}{\normalfont\itshape}{#1.}}
\let\f@ldappendix=\appendix
\gdef\appendix{\f@ldappendix
  \if@hyperloaded\def\@currentHref{appendix.A}\fi
  \addcontentsline{toc}{appendix}{\appendixtocname}}
\newcommand*\l@appendix[2]{%
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-2000}\vskip 1.0em \@plus\p@%
    \setlength\@tempdima{1.5em}%
    \begingroup
      \parindent \z@ \leavevmode \bfseries
      \advance\leftskip\@tempdima \hskip -\leftskip
      #1\nobreak\hfil \par
      \penalty\@highpenalty\vskip -0.35em\penalty\@highpenalty
    \endgroup
  \fi}
\def\toclevel@appendix{0}

\newlength{\fcapindent}
\setlength{\fcapindent}{2em}
\setlength{\belowcaptionskip}{10\p@}
\long\def\@makecaption#1#2{%
  \vskip\abovecaptionskip%
  \sbox\@tempboxa{#1: #2}%
  \ifdim \wd\@tempboxa >\hsize
    {\advance\leftskip\fcapindent \rightskip=\leftskip\relax%
     \FSU@onormalsize%
     #1: #2\par}
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip}
\endinput
%%
%% End of file `fsuthesis.cls'.
