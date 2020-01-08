%==============================================================================
% LaTeX-class HOGENT exam assignment, academic year 19-20
%==============================================================================
% Author: Bert Van Vreckem <bert.vanvreckem@hogent.be>

\NeedsTeXFormat{LaTeX2e}
\def\@classname{hogent-exam}
\ProvidesClass{hogent-exam}[2020/01/08 Exam assignment HOGENT]
\LoadClass{exam}

%---------- Packages ----------------------------------------------------------

\RequirePackage{graphicx}
\RequirePackage[dutch]{babel}
\RequirePackage{hyperref}
\RequirePackage{geometry}
\RequirePackage{rotating}
\RequirePackage{booktabs}
\RequirePackage[table]{xcolor}

%---------- Class variables ---------------------------------------------------
\let\@examendatum\@empty
\let\@academiejaar\@empty
\let\@opleiding\@empty
\let\@afstudeerrichting\@empty
\let\@jaar\@empty
\let\@olod\@empty
\let\@reeks\@empty
\let\@lectoren\@empty

\newcommand{\examendatum}[1]{\def\@examendatum{#1}}
\newcommand{\academiejaar}[1]{\def\@academiejaar{#1}}
\newcommand{\opleiding}[1]{\def\@opleiding{#1}}
\newcommand{\afstudeerrichting}[1]{\def\@afstudeerrichting{#1}}
\newcommand{\jaar}[1]{\def\@jaar{#1}}
\newcommand{\olod}[1]{\def\@olod{#1}}
\newcommand{\reeks}[1]{\def\@reeks{#1}}
\newcommand{\lectoren}[1]{\def\@lectoren{#1}}

%% Check the variables that need to be defined for the title page
\newcommand{\@checkvariables}{%
  \ifx\@examendatum\@empty{%
    \ClassError{\@classname}{Exam date is undefined!}%
      {Use the \examendatum command to define it}
  }\fi
  \ifx\@academiejaar\@empty{%
    \ClassError{\@classname}{Academic year is undefined!}%
    {Use the \academiejaar command to define it}
  }\fi
  \ifx\@opleiding\@empty{%
    \ClassError{\@classname}{Study programme is undefined!}%
    {Use the \opleiding command to define it}
  }\fi
  \ifx\@afstudeerrichting\@empty{%
    \ClassError{\@classname}{Main subject is undefined!}%
    {Use the \afstudeerrichting command to define it}
  }\fi
  \ifx\@jaar\@empty{%
    \ClassError{\@classname}{Year is undefined!}%
    {Use the \jaar command to define it}
  }\fi
  \ifx\@olod\@empty{%
    \ClassError{\@classname}{Course unit is undefined!}%
    {Use the \olod command to define it}
  }\fi
  \ifx\@reeks\@empty{%
    \ClassError{\@classname}{Series is undefined!}%
    {Use the \reeks command to define it}
  }\fi
  \ifx\@lectoren\@empty{%
    \ClassError{\@classname}{Lecturer(s) is/are undefined!}%
    {Use the \lectoren command to define it}
  }\fi
}

%---------- Fonts and symbols -------------------------------------------------
\RequirePackage{fontspec}
\RequirePackage{wasysym,amssymb,latexsym,amsfonts}

\defaultfontfeatures{Ligatures=TeX}
\setmainfont{Arial}
\setmonofont{Courier New}

%---------- Page Layout -------------------------------------------------------

\geometry{a4paper,top=1.5cm,bottom=1.5cm,left=1.5cm,right=1.5cm}

\setlength{\parindent}{0pt}           % Don't indent first line of a paragraph
\renewcommand{\arraystretch}{2}
\setlength{\fboxsep}{9pt}             % Space around framed boxes

%---------- Header anf footer -------------------------------------------------

\pagestyle{headandfoot}
\extraheadheight{1.5cm}
\extrafootheight{2cm}

\firstpageheader{\textbf{Datum examen:} \@examendatum}{}{}

\firstpagefooter{}{}%
{\includegraphics[width=2.7cm]{img/HOGENT_Logo_Pos_rgb}}

\runningheader{%
  \parbox{.85\textwidth}{
    \vspace{12pt}\textbf{Datum examen:}  \@examendatum \\ \\
    \textbf{Voornaam en naam} \dotfill\\}
  }%
{}%
{\Large \textbf{\thepage/\numpages}}

\runningfooter{}{}{\includegraphics[width=2.7cm]{img/HOGENT_Logo_Pos_rgb}}

%%---------- Voorbeeldoplossing ------------------------------------------------

\pointsinmargin
\marginpointname{pt}
\addpoints
\bonuspointname{\relax}
\bonuspointformat{(\thepoints pt)}

\newif\ifsolution % Vlag die aanduidt of de oplossing afgedrukt moet worden

%%---------- Invulhoofding -----------------------------------------------------

\newcommand{\hoofding}{%
\ifsolution
\begin{center}
  \LARGE{\textbf{VOORBEELDOPLOSSING}}
\end{center}
\fi

\begin{tabular}{m{\textwidth}}
  \cellcolor{black} \textcolor{white}{\textbf{Academiejaar \@academiejaar}} \\
\end{tabular}

\begin{tabular}{m{.20\textwidth}m{.76\textwidth}}
	\textbf{Voornaam en naam}    & \dotfill                                         \\
	\textbf{Studentennummer}     & \dotfill                                         \\
	\textbf{Opleiding}           & \@opleiding \hspace*{\fill} \textbf{Jaar} \@jaar \\
	\textbf{Afstudeerrichting}   & \@afstudeerrichting                              \\
	\textbf{Klas}                & \dotfill                                         \\
	\textbf{Opleidingsonderdeel} & \@olod \hspace*{\fill}  \@reeks                  \\
	\textbf{Lesgever(s)}         & \@lectoren
\end{tabular}

\hspace{\fill}
\fcolorbox{black}{black!20}{\parbox{4cm}{
  \centering
  \textbf{Behaald resultaat}

  \Huge \hspace{1.2cm} \textbf{/ \numpoints}
}}
\fcolorbox{black}{black!20}{\parbox{4cm}{
\centering
\textbf{Behaald scripting}

\Huge \hspace{1.2cm} \textbf{/ \numbonuspoints}
}}
}