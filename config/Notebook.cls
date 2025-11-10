\NeedsTeXFormat{LaTeX2e}
\RequirePackage{kvoptions}
\RequirePackage{etoolbox}

\LoadClass{book}

\RequirePackage{fontspec}				% XeLaTeX
\RequirePackage[CJKchecksingle]{xeCJK}	% XeCJK
\RequirePackage{CJKnumb}				% 使用 CJK 数字

% 引入 AMS 宏包 + mathtools
% \RequirePackage[intlimits]{amsmath}   % intlimits会使积分号上下限处于上下位置
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage[centercolon]{mathtools}

\RequirePackage{hyperref}
\RequirePackage{tabularx}  % 支持自动换行的文本框
\RequirePackage{pdfpages}  % 支持直接引入 PDF 页面
\RequirePackage{emptypage}
\RequirePackage{tikz}  % 要求载入 TikZ
\RequirePackage{tikz-cd}

\RequirePackage{paralist}  % 载入 paralist 支持itemize 和 enumerate
\RequirePackage{float}  % 允许制定图片位置
\RequirePackage{graphicx}  % 允许插入图片
\RequirePackage{xcolor}  % 设置颜色所需
\RequirePackage{xparse} % 编程接口, 此作章节编码转换用
\RequirePackage{enumitem}  % 设置列表


% 使用bib管理引用
\RequirePackage[backend=biber, 
                hyperref=auto, 
                % backref=true, 
                % backrefstyle=three
                ]{biblatex}
\addbibresource{ref.bib}

\input{config/fontset.tex}  % 插入字体设置

\newcommand{\openbox}{\leavevmode	% 复制 amsthm 的 QED 符号: 空心方格
	\hbox to.77778em{%
		\hfil\vrule
		\vbox to.675em{\hrule width.6em\vfil\hrule}%
		\vrule\hfil}}


\ExplSyntaxOn  % 调用xparse实现10进制转32进制, 用以设置nabls的标签
		\NewDocumentCommand{\toBaseThirtyTwo}{m}
		{
			\tl_upper_case:n {\int_to_base:nn{#1}{32}}
		}
\ExplSyntaxOff


\AtEndPreamble{
	\RequirePackage[thmmarks, amsmath, hyperref]{ntheorem}	% 设置定理环境所需
    \hypersetup{
			colorlinks = true,
			linkcolor = red,
			citecolor = blue,
			urlcolor = blue}  % 设置链接颜色

	\RequirePackage{geometry}  % 设置版面
	\geometry{
	% paper=b5paper,
	% headheight=5ex,
	% headsep=5ex,
	% textwidth=132mm,
	% textheight=198mm,
	% twoside,
	% bindingoffset=18pt,  % 设置装订偏移为18点。这是为了预留装订的空间，防止装订后文字被遮挡。
	% asymmetric	% 单双数页不分
		paper=a4paper,
		top=3cm,
		inner=2.54cm,
		outer=2.54cm,
		bottom=3cm,
		headheight=6ex,
		headsep=6ex,
		twoside,
		asymmetric
	}

	\RequirePackage{fancyhdr}  % 设置天眉
	\fancypagestyle{plain}{ % 使空页恒空
	\fancyhead{}
	\renewcommand{\headrulewidth}{0pt}
	}
	\pagestyle{fancy}
	\renewcommand{\headrulewidth}{0pt}	% 天眉暂不加横线
	\renewcommand{\footrulewidth}{0pt}

  \fancyhf{} % 先清空
	\fancyhead[EC]{\footnotesize{\leftmark}\vspace{1mm}}
	\fancyhead[OC]{\footnotesize{\rightmark}\vspace{1mm}}
	\fancyhead[LE,RO]{{\footnotesize \thepage}\vspace{1mm}} %
	\fancyhead[RE,LO]{}

}


\AtBeginDocument{
  \renewcommand{\Re}{\operatorname{Re}}
	\renewcommand{\Im}{\operatorname{Im}}
	\renewcommand{\emptyset}{\ensuremath{\varnothing}}  % 重置空集

	\theorembodyfont{\songti}
	% \theoremheaderfont{\songti}
	\newtheorem{theorem}{Theorem}[section] % 按section编号
	\newtheorem{corollary}[theorem]{Corollary}
	\newtheorem{lemma}[theorem]{Lemma}
	\newtheorem{proposition}[theorem]{Proposition}
	\newtheorem{definition}[theorem]{Definition}
	\newtheorem{hypothesis}[theorem]{Hypothesis}
	\newtheorem{example}[theorem]{Example}

	\theorembodyfont{}
	\theoremstyle{nonumberplain}
	\theoremheaderfont{}
	\theoremseparator{\enspace}
	\theoremsymbol{\openbox}
	\newtheorem{proof}{\textit{Proof.}}

	\input{config/mycommand.sty}
	\input{config/myarrow.tex}
	\input{config/mylist.sty}
}


\AtEndDocument{
}
