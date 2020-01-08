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
\RequirePackage[table]{xcolor}
\RequirePackage[breaklinks]{hyperref}
\RequirePackage{booktabs}

%---------- Language support --------------------------------------------------
% This defines class options dutch (default) and english.

\RequirePackage{xkeyval}
\RequirePackage{iflang}

\newif\if@dutch
\newif\if@english
\DeclareOptionX{dutch}{\@dutchtrue\@englishfalse}
\DeclareOptionX{english}{\@dutchfalse\@englishtrue}
\ExecuteOptionsX{dutch}
\ProcessOptionsX

\if@dutch
  \RequirePackage[dutch]{babel}
\else
  \RequirePackage[english]{babel}
\fi



%---------- Class variables ---------------------------------------------------

\let\@ExamDate\@empty
\let\@AcademicYear\@empty
\let\@StudyProgramme\@empty
\let\@MainSubject\@empty
\let\@Year\@empty
\let\@CourseUnit\@empty
\let\@Version\@empty
\let\@lectoren\@empty

\newcommand{\ExamDate}[1]{\def\@ExamDate{#1}}
\newcommand{\AcademicYear}[1]{\def\@AcademicYear{#1}}
\newcommand{\StudyProgramme}[1]{\def\@StudyProgramme{#1}}
\newcommand{\MainSubject}[1]{\def\@MainSubject{#1}}
\newcommand{\Year}[1]{\def\@Year{#1}}
\newcommand{\CourseUnit}[1]{\def\@CourseUnit{#1}}
\newcommand{\Version}[1]{\def\@Version{#1}}
\newcommand{\Instructors}[1]{\def\@Instructors{#1}}

%% Check the variables that need to be defined for the title page
\newcommand{\@checkvariables}{%
  \ifx\@ExamDate\@empty{%
    \ClassError{\@classname}{Exam date is undefined!}%
      {Use the \ExamDate command to define it}
  }\fi
  \ifx\@AcademicYear\@empty{%
    \ClassError{\@classname}{Academic year is undefined!}%
    {Use the \AcademicYear command to define it}
  }\fi
  \ifx\@StudyProgramme\@empty{%
    \ClassError{\@classname}{Study programme is undefined!}%
    {Use the \StudyProgramme command to define it}
  }\fi
  \ifx\@Year\@empty{%
    \ClassError{\@classname}{Year is undefined!}%
    {Use the \Year command to define it}
  }\fi
  \ifx\@CourseUnit\@empty{%
    \ClassError{\@classname}{Course unit is undefined!}%
    {Use the \CourseUnit command to define it}
  }\fi
  \ifx\@Version\@empty{%
    \ClassError{\@classname}{Assignment version is undefined!}%
    {Use the \Version command to define it}
  }\fi
  \ifx\@Instructors\@empty{%
    \ClassError{\@classname}{Instructor(s) is/are undefined!}%
    {Use the \Instructors command to define it}
  }\fi
}

% Language dependent text part of the template
\IfLanguageName{english}{%
  \newcommand{\labExamDate}{Exam date}
  \newcommand{\labAcademicYear}{Academic year}
  \newcommand{\labStudentName}{First and family name}
  \newcommand{\labEnrollmentNumber}{Enrollment number}
  \newcommand{\labStudyProgramme}{Study programme}
  \newcommand{\labMainSubject}{Main subject}
  \newcommand{\labClass}{Class}
  \newcommand{\labInstructors}{Lecturer(s)}
  \newcommand{\labYear}{Year}
  \newcommand{\labCourseUnit}{Course unit}
  \newcommand{\labScore}{Score}
  \newcommand{\labScratchNotes}{Scratch notes}
}{%
  \newcommand{\labExamDate}{Datum Examen}
  \newcommand{\labAcademicYear}{Academiejaar}
  \newcommand{\labStudentName}{Voornaam en naam}
  \newcommand{\labEnrollmentNumber}{Studentennummer}
  \newcommand{\labStudyProgramme}{Opleiding}
  \newcommand{\labMainSubject}{Afstudeerrichting}
  \newcommand{\labClass}{Klas}
  \newcommand{\labInstructors}{Lesgever(s)}
  \newcommand{\labYear}{Jaar}
  \newcommand{\labCourseUnit}{Opleidingsonderdeel}
  \newcommand{\labScore}{Behaald Resultaat}
  \newcommand{\labScratchNotes}{Kladruimte}
}

%---------- Fonts and symbols -------------------------------------------------
\RequirePackage{fontspec}
\RequirePackage{wasysym,amssymb,latexsym,amsfonts}

\defaultfontfeatures{Ligatures=TeX}
\setmainfont{Arial}
\setmonofont{Courier New}

%---------- Page Layout -------------------------------------------------------

\RequirePackage{geometry}

\geometry{a4paper,top=1.5cm,bottom=1.5cm,left=1.5cm,right=1.5cm}

\setlength{\parindent}{0pt}           % Don't indent first line of a paragraph
\renewcommand{\arraystretch}{2}
\setlength{\fboxsep}{9pt}             % Space around framed boxes

%---------- Header and footer -------------------------------------------------

\pagestyle{headandfoot}
\extraheadheight{1.5cm}
\extrafootheight{2cm}

\firstpageheader{\textbf{\labExamDate:} \@ExamDate}{}{}

\firstpagefooter{}{}%
{\includegraphics[width=2.7cm]{img/HOGENT_Logo_Pos_rgb}}

\runningheader{%
  \parbox{.85\textwidth}{
    \vspace{12pt}\textbf{\labExamDate:}  \@ExamDate \\ \\
    \textbf{\labStudentName} \dotfill\\}
  }%
{}%
{\Large \textbf{\thepage/\numpages}}

\runningfooter{}{}{\includegraphics[width=2.7cm]{img/HOGENT_Logo_Pos_rgb}}

%%---------- Points -----------------------------------------------------------

\pointsinmargin
\marginpointname{pt}
\addpoints
\bonuspointname{\relax}
\bonuspointformat{(\thepoints pt)}

\newif\ifsolution % Vlag die aanduidt of de oplossing afgedrukt moet worden

%%---------- Heading ----------------------------------------------------------

\newcommand{\hoofding}{%
  \@checkvariables
  \ifsolution
  \begin{center}
    \LARGE{\textbf{VOORBEELDOPLOSSING}} % TODO
  \end{center}
  \fi
  
  \begin{tabular}{m{\textwidth}}
    \cellcolor{black} \textcolor{white}{\textbf{\labAcademicYear \@AcademicYear}} \\
  \end{tabular}
  
  \begin{tabular}{m{.20\textwidth}m{.76\textwidth}}
  	\textbf{\labStudentName}      & \dotfill                                                  \\
  	\textbf{\labEnrollmentNumber} & \dotfill                                                  \\
  	\textbf{\labStudyProgramme}   & \@StudyProgramme \hspace*{\fill} \textbf{\labYear} \@Year \\
  	\textbf{\labMainSubject}      & \@MainSubject                                             \\
  	\textbf{\labClass}            & \dotfill                                                  \\
  	\textbf{\labCourseUnit}       & \@CourseUnit \hspace*{\fill}  \@Version                   \\
  	\textbf{\labInstructors}      & \@Instructors
  \end{tabular}
  
  \hspace{\fill}
  \fcolorbox{black}{black!20}{\parbox{4cm}{
    \centering
    \textbf{\labScore}
  
    \Huge \hspace{1.2cm} \textbf{/ \numpoints}
  }}
}

%---------- Scratch notes area ------------------------------------------------

\newcommand{\scratchnotes}{%
  \ifsolution
  \else
  \newpage
  \section*{\labScratchNotes}
  
  \fillwithdottedlines{\stretch{1}}
  \fi
}