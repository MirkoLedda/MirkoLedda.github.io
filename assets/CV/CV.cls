%----------------------------------------------------------------------------------------
%   PACKAGES AND OTHER DOCUMENT CONFIGURATIONS
%----------------------------------------------------------------------------------------

% Here a useful reminder for custom commands:
% ====================================
% education		\edu{year}{degree}{school}
%
% experience		\experience{year}{position}{location}
% Two experience	\experienceDouble{year}{position}{location1}{location2}
%
% Published articles \pubArticle{year}{authors}{title}{journal}{issue}{doi}
% Submitted articles	\pubSub{year}{authors}{title}{journal}
% In-prep articles	\pubPrep{year}{authors}{title}{journal}
% In-review articles \pubRev{year}{authors}{title}{journal}
% Patents			\pubPatent{year}{authors}{title}{office}{patent ID}{issue date}
% Talks and Posters	\pubTalk{year}{authors}{title}{conference}{venue + date}{comments}
%
% Prof experience	\professional{year}{position}{location}{comments}
% Teaching		\teaching{year}{position}{class}{comments}
% Outreach		\outreach{year}{event}{location}{comments}
% Awards			\award{year}{title}{location}{comments}
% Membership		\member{year}{society}{comments}

\LoadClass{article}

% ---------- REQUIRED PACKAGES ----------
\usepackage{amstext,multicol,enumitem,tabto}

% ---------- DOCUMENT LAYOUT ----------
\usepackage{geometry} 
\geometry{a4paper, textwidth=6in, textheight=10in, marginparsep=7pt, marginparwidth=1in}
\setlength\parindent{0in} % remove auto indent

% Comments
\newcommand{\comment}[1]{\footnotesize{#1}\normalsize}

% Header
\usepackage{fancyhdr}
\pagestyle{fancy}
\renewcommand{\headrulewidth}{0pt}

% Footer
\usepackage{lastpage}
\lfoot{Mirko Ledda - CV - \today\ }
\cfoot{}
\rfoot{Page \thepage\ / \pageref*{LastPage}}

% Multi-column
\setlength{\multicolsep}{2.0pt plus 2.0pt minus 1.5pt}

% ---------- FONTS ----------
\usepackage{bera}
\renewcommand{\familydefault}{\sfdefault}
\usepackage[dvipsnames]{xcolor}

% ---------- RULERS ----------
\newcommand{\HRule}[1]{\par
  \vspace*{\dimexpr-\parskip-\baselineskip+5pt}
  \noindent\rule{\linewidth}{#1}\par
  \vspace*{\dimexpr-\parskip-.5\baselineskip+5pt}}

% ------ SECTION LAYOUTS ------
% Section ------
\usepackage{titlesec}
\titleformat
	{\section} % command
	[display] % shape
	{\bf\Large} % format
	{\thesection} % label
	{0pt} % sep
	{
	\vspace{-2ex}
	\HRule{0.5mm}
	\MakeUppercase
	} % before-code
	[
	\HRule{0.5mm}
	] % after-code

% Subsection ------
\usepackage{titlesec}
\titleformat
	{\subsection} % command
	[display] % shape
	{\large} % format
	{\thesubsection} % label
	{0pt} % sep
	{
	\vspace{-3ex}
	} % before-code
	[
	] % after-code

% ------ PARAGRAPH LAYOUTS ------
% Year margin ------
\usepackage{marginnote}
\newcommand{\years}[1]{\marginnote{\small\textbf{#1}}}
\renewcommand*{\raggedrightmarginnote}{}
\reversemarginpar

% Hyperlinks ------
\usepackage[bookmarks, colorlinks, breaklinks,
	pdftitle={Mirko Ledda - CV},
	pdfauthor={Mirko Ledda},
	pdfproducer={}
]{hyperref} 
\hypersetup{linkcolor=blue,citecolor=blue,filecolor=black,urlcolor=MidnightBlue} 
\newcommand{\mail}[1]{\href{mailto:#1}{#1}}

% Education ------
\newcommand{\edu}[3]{\years{#1}\textbf{#2}\\
#3\\}

% Experience ------
\usepackage{xparse}
\DeclareDocumentCommand\experience{ m m m g }{
    	\IfNoValueT {#4} {\years{#1}\textsc{#2} - #3\\}
        \IfNoValueF {#4} {
        		\vspace{-\topsep}
        		\begin{tabbing}
    		\years{#1}\textsc{#2} - \=#3\\
    		\>#4
    		\end{tabbing}
		\vspace{-\topsep}}
}

% Publications ------
\usepackage{hyperref}
\usepackage{xparse}
\newcommand{\pubAuthors}[1]{#1}
\newcommand{\pubTitle}[1]{#1}
\newcommand{\pubJournal}[1]{\emph{#1}}
\newcommand{\pubIssue}[1]{#1}
\newcommand{\pubDOI}[1]{\href{http://dx.doi.org/#1}{\scriptsize\textsc{[doi]}}}

% Published articles
\DeclareDocumentCommand\pubArticle{ m m m m m g }{
    {\years{#1}\pubAuthors{#2}, \pubTitle{#3}, \pubJournal{#4} \pubIssue{#5}
        \IfNoValueF {#6} {\pubDOI{#6}}
        \medskip
        \\
    }
}
% Submitted articles
\newcommand{\pubSub}[4]{\years{#1}\pubAuthors{#2}, \pubTitle{#3}, \pubJournal{#4}, submitted\medskip
\\}

% In preparation articles
\newcommand{\pubPrep}[4]{\years{#1}\pubAuthors{#2}, \pubTitle{#3}, In preparation for \pubJournal{#4}\medskip
\\}

% In review articles
\newcommand{\pubRev}[4]{\years{#1}\pubAuthors{#2}, \pubTitle{#3}, \pubJournal{#4}, in review\medskip
\\}

% Patents
\newcommand{\pubPatent}[6]{\years{#1}\pubAuthors{#2}, \pubTitle{#3} - #4, \emph{#5} (issued in #6)\medskip
\\}

% Talks and Posters
\newcommand{\pubTalk}[7]{\years{#1}\textbf{#4} \hfill #5\\
\pubAuthors{#2}, #3. \hfill \emph{#7} \medskip
\\}

% Scientific and Professional experience
\newcommand{\professional}[4]{\years{#1}\textbf{#2} \hfill #3\\
\comment{#4}\medskip
\\}

% Teaching ------
\newcommand{\teaching}[4]{\years{#1}\textbf{#3} \hfill #2\\ \comment{#4}\medskip
\\}

% Outreach ------
\newcommand{\outreach}[4]{\years{#1}\textbf{#2} \hfill #3\\ \comment{#4}\medskip
\\}

% Award ------
\newcommand{\award}[4]{\years{#1}\textbf{#2} \hfill #3\\ \comment{#4}\medskip
\\}

% Membership ------
\newcommand{\member}[3]{\years{#1}\textbf{#2} \hfill #3\medskip
\\}
