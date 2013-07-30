%            Latex Thesis Template
%                    for
% Hong Kong University of Science and Technology 
% Please report any problems to houdao@ust.hk
%
\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{HKUSTthesis}[2013/07/23 v1.0 HKUSTthesis document class]

%%%Begin "HKUSTthesis.cls"
\newif\ifhkust@AM\hkust@AMfalse
\newif\ifhkust@MS\hkust@MSfalse
\newif\ifhkust@MPh\hkust@MPhfalse
\newif\ifhkust@PhD\hkust@PhDfalse

%% Begin Options
\DeclareOption{AM}{\hkust@AMtrue}
\DeclareOption{MS}{\hkust@MStrue}
\DeclareOption{MPh}{\hkust@MPhtrue}
\DeclareOption{PhD}{\hkust@PhDtrue}
%% End Options

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions
\LoadClass[a4paper,12pt]{report}

\ifhkust@AM\relax\else
    \ifhkust@MS\relax\else
        \ifhkust@MPh\relax\else
            \ifhkust@PhD\relax\else
                \ClassError{HKUSTthesis}%
                {You have to specify one of thesis options: AM, MS, MPh or PhD.}{}
            \fi
        \fi
    \fi
\fi

%% Begin RequirePackage ``*.sty''
\RequirePackage[margin=25mm,textheight=247mm,textwidth=145mm]{geometry}
\RequirePackage{amsmath,amssymb,bm}
\RequirePackage{titlesec,titletoc}
\RequirePackage{epsfig,epsf}
\RequirePackage[center]{subfigure}
\RequirePackage{color,graphicx}
\RequirePackage[backend=biber]{biblatex}
%% End RequirePackage ``*.sty''

%% Begin Define Terms
\def\hkust@define@term#1{
    \expandafter\gdef\csname #1\endcsname##1{%
    \expandafter\gdef\csname hkust@#1\endcsname{##1}}
    \csname #1\endcsname{}
}
\hkust@define@term{degree}
\hkust@define@term{advisor}
\hkust@define@term{subject}
\hkust@define@term{department}
\hkust@define@term{departmenthead}
\hkust@define@term{submitdate}
\renewcommand\title[1]{\def\hkust@title{#1}}
\renewcommand\author[1]{\def\hkust@author{#1}}
%% End Define Terms

%% Begin FONTS
\newfont{\Lbi}{cmbx10 scaled\magstep3}   
\newfont{\lbi}{cmbx10 scaled\magstep2}   
\newfont{\nbi}{cmbx10 scaled\magstep1}
%
\def\@normalsize{
    \@setsize\normalsize{14.5pt}\xiipt\@xiipt
    \abovedisplayskip 12pt plus3pt minus7pt%
    \belowdisplayskip \abovedisplayskip
    \abovedisplayshortskip  \z@ plus3pt%
    \belowdisplayshortskip  6.5pt plus3.5pt minus3pt
}
\def\small{
    \@setsize\small{13.6pt}\xipt\@xipt
    \abovedisplayskip 11pt plus3pt minus6pt%
    \belowdisplayskip \abovedisplayskip
    \abovedisplayshortskip  \z@ plus3pt%
    \belowdisplayshortskip  6.5pt plus3.5pt minus3pt
}
\def\footnotesize{
    \@setsize\footnotesize{12pt}\xpt\@xpt
    \abovedisplayskip 10pt plus2pt minus5pt%
    \belowdisplayskip \abovedisplayskip
    \abovedisplayshortskip  \z@ plus3pt%
    \belowdisplayshortskip  6pt plus3pt minus3pt
}
\def\scriptsize{\@setsize\scriptsize{9.5pt}\viiipt\@viiipt}
\def\tiny{\@setsize\tiny{7pt}\vipt\@vipt}
\def\large{\@setsize\large{18pt}\xivpt\@xivpt}
\def\Large{\@setsize\Large{22pt}\xviipt\@xviipt}
\def\LARGE{\@setsize\LARGE{25pt}\xxpt\@xxpt}
\def\huge{\@setsize\huge{30pt}\xxvpt\@xxvpt}
\let\Huge=\huge
\normalsize  
%% End FONTS

%% Begin PAGE LAYOUT
\def\cleardoublepage{\clearpage\if@twoside \ifodd\c@page\else
    \thispagestyle{empty}%
    \hbox{}\newpage\if@twocolumn\hbox{}\newpage\fi\fi\fi}
\def\textspace{\openup 2\jot\relax}  % Begin double spaced text (default)
\def\textspaceundo{\openup -2\jot\relax}  % Resume single spacing
\def\versiontag{}                    % Default is NO tag
%% End PAGE LAYOUT

%% Begin Paragraphing
\parskip 6pt plus 1pt minus 1pt    % Extra vertical space between paragraphs.
\parindent 1.5em                   % Width of paragraph indentation.
\topsep 10pt plus 4pt minus 6pt    % Extra vertical space, in addition to
                                   % \parskip, added above and below list and
                                   % paragraphing environments.
\partopsep 3pt plus 2pt minus 2pt  % Extra vertical space, in addition to
                                   % \parskip and \topsep, added when user
                                   % leaves blank line before environment.
\itemsep 5pt plus 2.5pt minus 1pt  % Extra vertical space, in addition to
                                   % \parskip, added between list items.
%% End Paragraphing

%% Beging CHAPTERS AND SECTIONS
\def\thechapter       {\arabic{chapter}}
\def\thesection       {\thechapter.\arabic{section}}
\def\thesubsection    {\thesection.\arabic{subsection}}
\def\thesubsubsection {\thesubsection .\arabic{subsubsection}}
\def\theparagraph     {\thesubsubsection.\arabic{paragraph}}
\def\thesubparagraph  {\theparagraph.\arabic{subparagraph}}

\newcounter {chpappx}
\def\thechpappx       {\Alph{chpappx}}
\def\@chapapp{CHAPTER}
\def\@makechapterhead#1{                     % Heading for \chapter command
    \vspace*{0pt}{                           % Space at top of text page.
        \begin{center}
            \ifnum \c@secnumdepth >\m@ne     % IF secnumdepth > -1 THEN
  			\ifINAPPENDIX
                    {\Lbi \@chapapp~\thechpappx} % Print 'Chapter' and number.
			    \else
                    {\Lbi \@chapapp~\thechapter} % Print 'Chapter' and number.
				\fi
                \par
                \vskip 20pt                  % Space between number and title.
		    \fi                  
            {\Lbi\uppercase{#1}}             % Chapter title
        \end{center}
        \nobreak                             % TeX penalty to prevent page break.
    }
    \pagegoal\@colht                   % let TeX in on what's happening
}
\def\@makeschapterhead#1{              % Heading for \chapter* command
    \vspace*{0pt}{                     % Space at top of page.
        \begin{center}
            {\Lbi\uppercase{#1}\par}   % Chapter* title
        \end{center}
        \nobreak                       % TeX penalty to prevent page break.
    } 
    \pagegoal\@colht                   % let TeX in on what's happening
}
\def\chapter{
    \clearpage                   % Starts new page.
    \thispagestyle{headings}     % Page style of chapter page is 'headings'
    \global\@topnum\z@           % Prevents figures from going at top of page.
    \@afterindentfalse           % Suppresses indent in first paragraph.  Change
    \secdef\@chapter\@schapter   % to \@afterindenttrue to have indent.
}
\def\@chapter[#1]#2{%
    \ifnum \c@secnumdepth >\m@ne
        \ifINAPPENDIX
            \refstepcounter{chpappx}
            \addcontentsline{toc}{chapter}{Appendix \protect\numberline{\thechpappx}#1}
		\else
            \refstepcounter{chapter}
            \addcontentsline{toc}{chapter}{Chapter \protect\numberline{\thechapter}#1}
        \fi
    \else
        \ifINAPPENDIX
            \refstepcounter{chpappx}
            \addcontentsline{toc}{chapter}{Appendix \protect\numberline{\thechpappx}#1}
		\else
            \refstepcounter{chapter}
            \addcontentsline{toc}{chapter}{Chapter #1}
		\fi
    \fi
    \chaptermark{#1}
    \addtocontents{lof}{\protect\addvspace{1pt}} %Adds between-chapter space
    \addtocontents{lot}{\protect\addvspace{1pt}} %to lists of figs & tables.
    \@makechapterhead{#2}
    \@afterheading         % Routine called after chapter and section heading.
}
\def\@schapter#1{
   \@makeschapterhead{#1} 
   \@afterheading          % Routine called after chapter and section heading.
}
\def\pchapter#1{
    \chapter*{#1}
    \addcontentsline{toc}{chapter}{#1}
    \typeout{#1}
}
\setcounter{secnumdepth}{3}
\def\chaptermark#1{}
%% End CHAPTERS AND SECTIONS

%% Begin COPYRIGHT
\def\Copyright{
    \typeout{Copyright}
    \begin{center}
        {Copyright \copyright\ by \hkust@author~\number \year}
    \end{center}
}
%% End COPYRIGHT

%% Begin Authorization Page
\newlength{\AuthorNameLength}
\def\candidate#1{%
    \settowidth{\AuthorNameLength}{\uppercase\expandafter{#1}}
    \addtolength{\AuthorNameLength}{2cm}
    \raisebox{-12pt}[0pt][17pt]{\rule{\AuthorNameLength}{.5pt}}\par
    \raisebox{0pt}[0pt][0pt]{\uppercase\expandafter{#1}}\par
    \raisebox{-10pt}[0pt][0pt]{\hkust@submitdate}\par
}
\def\authorize{
    \addcontentsline{toc}{chapter}{Authorization Page}
    \begin{center}
        \underline{\Lbi Authorization}
    \end{center}
    \vspace{1cm}\textspace\mbox{}\par\indent
    {I hereby declare that I am the sole author of the thesis.}
    \par\vspace{1cm}\indent
    {I authorize the Hong Kong University of Science and Technology to lend
this thesis to other institutions or individuals for the purpose of scholarly
research.}
    \par\vspace{1cm}\indent
    {I further authorize the Hong Kong University of Science and Technology
to reproduce the thesis by photocopying or by other means, in total or in part,
at the request of other institutions or individuals for the purpose of
scholarly research.}
	\par\vspace{4cm}
        \begin{center}
            \candidate{\hkust@author}
        \end{center}
	\textspace
}
%% End Authorization Page

%% Begin Acknowledgement Page
\def\acknowledgements{
    \pchapter{Acknowledgements}
    \textspace
}
\def\endacknowledgements{
    \par\textspaceundo
}
%% End Acknowledgement Page

%% Begin Glossory
\def\glossory{
    \pchapter{Abbreviated Glossory}
    \textspace
}
\def\endglossory{
    \par\textspaceundo
}
%% End Glossory

%% Begin Publication List
\def\publicationlist{
    \pchapter{Publication List}
    \textspace
}
\def\endpublicationlist{
    \par\textspaceundo
}
%% End Publication List

%% Begin Abstract Page
\def\abstract{
    \newpage
    \textspace
    \addcontentsline{toc}{chapter}{Abstract}
    \null\parskip=0pt
    \mbox{} \vglue 6ex 
    \begin{center}
        {\Lbi \uppercase\expandafter{\hkust@title} \par}
        \vglue 4ex
        {\lbi by \par}
        \vglue 2ex
        {\lbi \uppercase\expandafter{\hkust@author} \par}
        \vglue 4ex
        {\normalsize \hkust@department\par}
        \vglue 2ex
        {\normalsize The Hong Kong University of Science and Technology \par}
        \vglue 10ex
        {\Lbi ABSTRACT \par\par\normalsize}
    \end{center}
}
\def\endabstract{
    \par\textspaceundo
    \setcounter{footnote}{0}
}
%% End Abstract Page

%% Begin Dedication
\def\dedication{
    \pchapter{Dedication}
    \textspace
}
\def\enddedication{
    \par\textspace
}
%% End Dedication

%% Begin BIOGRAPHY
\def\biography{
    \pchapter{Biography}
    \textspace
}
\def\endbiography{
    \textspace
}
%% End BIOGRAPHY

%% Begin CHAPTERS
\def\chapters{
    \newpage
    \parskip 6pt plus 1 pt minus 1pt
    \textspace
    \renewcommand{\thepage}{\arabic{page}}
    \pagenumbering{arabic}
}
\def\endchapters{
    \textspace
    \parskip=0pt
}
%% End CHAPTERS

%% Begin APPENDIX
\newif\ifINAPPENDIX\INAPPENDIXfalse

\def\appendix{
    \INAPPENDIXtrue
    \par\parskip 6pt plus 1pt minus 1pt
    \setcounter{chpappx}{0}
	\setcounter{section}{0}
	\def\thesection{\thechpappx.\arabic{section}}
    \def\@chapapp{APPENDIX}
}
\def\endappendix{
    \textspace
	\INAPPENDIXfalse
    \def\@chapapp{CHAPTER}
	\def\thesection{\thechapter.\arabic{section}}
    \parskip=0pt
}
%% End APPENDIX

%% Begin OTHER ENVIRONMENTS
\def\@begintheorem#1#2{\it \trivlist \item[\hskip \labelsep{\bf #1\ #2}]}
\def\@endtheorem{\endtrivlist}
%% End OTHER ENVIRONMENTS

%% Begin TITLEPAGE
\def\titlepage{
    \newpage
    \thispagestyle{empty}
    \c@page\z@
}
\def\endtitlepage{
    \newpage
}
%% End TITLEPAGE

%%Begin TABLE OF CONTENTS, ETC.
\begingroup \catcode `|=0 \catcode `[=1
\catcode`]=2 \catcode`\{=12 \catcode `\}=12
\catcode`\\=12 |gdef|@xcode#1\end{code}[#1|end[code]]
|endgroup
\def\code{\par\list{}{\parskip 0pt plus 1pt\normalbaselines\interlinepenalty=150}\item[]\@verbatim\frenchspacing\@vobeyspaces\@xcode}
\def\endcode{\endtrivlist\endlist}
%In case long title name in toc/lof/lot
\def\@undottedtocline#1#2#3#4#5{
    \ifnum #1>\c@tocdepth 
	\else
        \vskip \z@ plus.2\p@{
        \leftskip #2\relax \rightskip \@tocrmarg \parfillskip -\rightskip
        \parindent #2\relax\@afterindenttrue
        \interlinepenalty\@M\leavevmode
        \@tempdima #3\relax \advance\leftskip \@tempdima \hbox{} \hskip -\leftskip
        #4\hfill \nobreak
        \hbox to\@pnumwidth{\hfil\reset@font\rm #5}\par}
	\fi
}
\let\@dottedtocline\@undottedtocline
% TABLEOFCONTENTS
\def\tableofcontents{
    \normalbaselines
    \chapter*{Table of Contents}
    \addcontentsline{toc}{chapter}{Table of Contents} 
    \markboth{CONTENTS}{CONTENTS}
    \@starttoc{toc}
}
\def\l@chapter#1#2{
	\pagebreak[3]
    \vskip 1.0em plus 1pt  % space above chapter line
    \@tempdima 1.5em       % width of box holding chapter number
    \begingroup
        \parindent \z@ \rightskip \@pnumwidth
        \parfillskip -\@pnumwidth
        \bf                  % Boldface.
        \leavevmode          % TeX command to enter horizontal mode.
        #1\hfil \hbox to\@pnumwidth{\hss #2}\par
    \endgroup
}
\def\l@section{\@undottedtocline{1}{1.5em}{1.7em}}
\def\l@subsection{\@undottedtocline{2}{3.8em}{3.2em}}
\def\l@subsubsection{\@undottedtocline{3}{7.0em}{4.1em}}
\def\l@paragraph{\@undottedtocline{4}{10em}{5em}}
\def\l@subparagraph{\@undottedtocline{5}{12em}{6em}}
% LIST OF FIGURES
\def\listoffigures{
    \normalbaselines
    \pchapter{List of Figures}
    \markboth{LIST OF FIGURES}{LIST OF FIGURES}
    \@starttoc{lof}
}
\def\l@figure{\@undottedtocline{1}{1.5em}{2.3em}}
% LIST OF TABLES
\def\listoftables{
    \normalbaselines
    \pchapter{List of Tables}
    \markboth{LIST OF TABLES}{LIST OF TABLES}
    \@starttoc{lot}
}
\let\l@table\l@figure
%%End TABLE OF CONTENTS, ETC.

%%Begin BIBLIOGRAPHY
\defbibheading{bibliography}[REFERENCES]{%
	\chapter*{#1}%
	\addcontentsline{toc}{chapter}{References}
	\markboth{#1}{#1}
}
%%End BIBLIOGRAPHY

%%Begin Title Page
\def\maketitle{     
    \begin{titlepage}
        \textspace
        \setcounter{page}{1}
%Begin Page i
        \null
        \parskip=0pt
        \begin{center}
            {\Lbi \uppercase\expandafter{\hkust@title} \par}
            \vglue 20ex
            {\large\uppercase {by} \par}
            \vglue 4ex
            {\large\bf \uppercase\expandafter{\hkust@author} \par\par}
            \vglue 20ex
            {\normalsize A Thesis Submitted to\par}
            {\normalsize The Hong Kong University of Science and Technology\par}
            {\normalsize in Partial Fulfillment of the Requirements for\par}
            {\normalsize the Degree of \hkust@degree\par}
            {\normalsize in \hkust@department\par}
            \vglue 12ex
            {\normalsize \space\mon\space\number\year, Hong Kong\par}    
            \vglue 4ex plus 1fill
            {\normalsize \Copyright}
        \end{center}
        \addcontentsline{toc}{chapter}{Title Page}
        \cleardoublepage
%End Page i

%Begin Page ii
        \authorize
        \cleardoublepage
%End Page ii

%Begin Page iii
        \null
        \parskip=0pt
        \begin{center}
            {\Lbi \uppercase\expandafter{\hkust@title} \par}
            \vglue 4ex       
            {\large BY \par}
            \vglue 4ex       
            {\large\bf \uppercase\expandafter{\hkust@author} \par}
            \vglue 6ex
            {This is to certify that I have examined the above PhD thesis \par
             and have found that it is complete and satisfactory in all respects,\par
             and that any and all revisions required by\par
             the thesis examination committee have been made.}
             \vglue 8ex
            {\rule{10cm}{.5pt}}
             \par\vspace{-0.5cm}
            {\hkust@advisor, Supervisor}
             \vglue 6ex
            {\rule{10cm}{.5pt}}
             \par\vspace{-0.5cm}
            {\hkust@departmenthead, Program Director}
             \vglue 2ex
            {\normalsize \hkust@department\par}
            {\normalsize \hkust@submitdate\par}  
            \addcontentsline{toc}{chapter}{Signature Page}
        \end{center}
        \cleardoublepage
        \textspaceundo
%End Page iii
    \end{titlepage}
%% End TitlePage
    \setcounter{footnote}{0} % Footnotes start at zero again.
    \let\maketitle\relax     % only ONCE!?
}


%%Begin PAGE STYLES
\mark{{}{}}   % Initializes TeX's marks
\def\ps@empty{%
    \def\@oddhead{\versiontag\hfil} \def\@oddfoot{}
    \def\@evenhead{\versiontag\hfil}\def\@evenfoot{}
}
\def\ps@plain{%
    \def\@oddhead{}
    \def\@oddfoot{\hfil\thepage\hfil}
    \let\@evenhead\@oddhead
    \let\@evenfoot\@oddfoot
}
\def\ps@headings{%
    \def\@oddfoot{\hfil\rm\thepage\hfil}%  centered page number
    \let\@evenfoot\@oddfoot
    \def\@oddhead{\versiontag\hfil}
    \let\@evenhead\@oddhead
    \def\chaptermark##1{
	    \markright{
		    \uppercase{
			    \ifnum \c@secnumdepth >\m@ne
                    \@chapapp\ \thechapter. \ 
				\fi ##1
			}
		}
	}
}
%%End PAGE STYLES

%% Begin MISCELLANEOUS
\def\mon{
	\ifcase\month
		\or January\or February\or March\or April\or May\or June\or
        July\or August\or September\or October\or November\or December
	\fi
}
\def\today{
    \number\day\space\mon\space\number\year
}
%% End MISCELLANEOUS

%% Begin INITIALIZATION 
\ps@plain                   % plain page style
\pagenumbering{roman}       % roman page numbers
\renewcommand{\thepage}{\roman{page}}
\onecolumn                  % Single-column
\raggedbottom               % Ragged bottom     

\newtheorem{definition}{Definition}[section]
\newtheorem{theorem}{Theorem}[section]
\newtheorem{lemma}{Lemma}[section]
\newtheorem{algo}{Algorithm}[section]
\newtheorem{conjecture}{Conjecture}[section]

\def\defi#1{Definition~\ref{#1}}
\def\theo#1{Theorem~\ref{#1}}
\def\algo#1{Algorithm~\ref{#1}}
%% End INITIALIZATION

%%%End "HKUSTTHESIS.cls"
