%ifndef NAMESPACE_M
%define NAMESPACE_M

%include standard.m

-- define actual function name output to karel 
-- in format program_function. max routine name length is 12.
-- for declaring in .klh files:
-- (eg. declare(class_name,constructor,init))
-- for declaring generic alias routine name in .klc files
-- (eg. #defeval constructor classfunc(init))

%defeval funcname(f) ASIS(prog_name)_#1
%defeval classfunc(f) ASIS(class_name)_#1

%mode push
%mode string QQQ "`" "`" "\\"
%define getalias(nme,fnc,anme,afnc) SILENT(`%defeval TEMP0 nme` `%defeval TEMP1 fnc` `%defeval TEMP2 anme` `%defeval TEMP3 afnc` `%define alias ASIS(TEMP0)ASIS(__)ASIS(TEMP1)` `%define func ASIS(TEMP2)ASIS(_)ASIS(TEMP3)`)
%define getobject(anme,afnc) SILENT(`%defeval TEMP21 anme` `%defeval TEMP22 afnc` `%define objt ASIS(TEMP21)ASIS(_)ASIS(TEMP22)`)
%mode pop

%define declare_function(nme,fnc,anme,afnc) SILENT(%mode push)SILENT(%mode nostring "`")SILENT(getalias(nme,fnc,anme,afnc))ASIS(%defeval TEMP4 `%define alias func`)SILENT(%mode pop)TEMP4

%mode push
%mode string QQQ "$" "$" "\\"
%define declare_member(nme,fnc,anme,afnc) SILENT(%mode push)SILENT(%mode nostring "`")SILENT(getobject(anme,afnc))SILENT(getalias(nme,fnc,anme,afnc))ASIS(%defeval TEMP4 `%define alias func`)ASIS(%defeval TEMP5 `%define fnc objt`)SILENT(%mode pop)$TEMP4
TEMP5$
%mode pop

%endif -- NAMESPACE_M