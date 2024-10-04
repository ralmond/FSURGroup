\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{FSUEPLSletter}[2004/01/07 v1.0 FSU EPLS letterhead]

\LoadClass{letter}
\RequirePackage{graphicx}
\RequirePackage{hyperref}

\newcommand*{\fax}[1]{\def\faxnum{#1}}
\newcommand*{\email}[1]{\def\emailurl{\href{mailto:#1}{#1}}}
\newcommand*{\webpage}[1]{\def\homeurl{\url{#1}}}



\newlength{\fsuepls@width}
\setlength{\fsuepls@width}{\paperwidth}
\addtolength{\fsuepls@width}{-1.26truein}
\newsavebox{\FSUEPLS@lheadhead}%
\sbox{\FSUEPLS@lheadhead}{%
        \begin{minipage}{\fsuepls@width}
          \vspace*{-1in}
          \includegraphics[width=\fsuepls@width]{EPLSLetterhead} \\
          \vspace*{6pt}
          1114 W. Call St., Tallahassee, FL 32306, USA\\
          Phone: 1 (850) 644-5203 \quad
          FAX: 1 (850) 644-8776 \quad
          Email: \texttt{ralmond@fsu.edu} \quad 
          Homepage: \texttt{http://ralmond.net/} \\
          \smallskip
          \hrule
          \medskip
        \end{minipage}
  }%

\def\fsueplslogo{%
\setlength{\fsuepls@width}{\paperwidth}
\addtolength{\fsuepls@width}{-\textwidth}
\hspace*{-0.5\fsuepls@width}%
\hspace*{0.63truein}%
\usebox{\FSUEPLS@lheadhead}\hfill
}

\addtolength{\textwidth}{1truein}
\addtolength{\oddsidemargin}{-.5truein}
\addtolength{\evensidemargin}{-.5truein}


\def\ps@fsueplsfirstpage{%
     \let\@oddhead\fsueplslogo
     \def\@oddfoot{\raisebox{-5\p@}[\z@]{%
        \hb@xt@\textwidth{\hspace*{100\p@}%
          \ifcase \@ptsize\relax
             \normalsize
          \or
             \small
          \or
             \footnotesize
          \fi
        \fromlocation}}\hss}}

\def\ps@fsueplsletterhead{%
      \let\@oddhead\fsueplslogo
      \def\@oddfoot{\normalfont\hfil\thepage\hfil}
      \def\@evenfoot{\normalfont\hfil-\thepage-\hfil}
      }

\renewcommand*{\opening}[1]{
  \thispagestyle{fsueplsfirstpage}%
  \vspace{\parskip}%
  {\raggedleft\@date\par}%
  \vspace{2\parskip}%
  {\raggedright \toname \\ \toaddress \par}%
  \vspace{2\parskip}%
  #1\par\nobreak}

\setlength\topmargin{27\p@}
\setlength\headsep{57\p@}

\renewcommand{\closing}[1]{\par\nobreak\vspace{\parskip}%
  \stopbreaks
  \noindent
  \ifx\@empty\fromaddress\else
  \hspace*{\longindentation}\fi
  \parbox{\indentedwidth}{\raggedright
       \ignorespaces #1\\[\medskipamount]%
       \includegraphics[width=.3\textwidth]{SIG2}\\[\medskipamount]%
       \ifx\@empty\fromsig
           \fromname
       \else \fromsig \fi\strut}%
   \par}
