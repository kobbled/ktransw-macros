
%include standard.m

-- in .klh file declare namespace alises for
-- each member to be used when accessing members
-- ouside of the class declaration scope (.kl files) 
-- namespace aliases will be in format class_name__function
-- arguments for EVAL are #1 = alias member name, 
-- #2 = actual output member name.
-- example, call in .klh :
-- | #mode push
-- | #mode quote "'"
-- | EVAL(full-name,short-name)
-- | #defeval full-name '#define alias func'
-- | #mode pop
-- |
-- | full-name
-- repeat for all members in quote mode

%mode push
%mode string QQQ "`" "`" "\\"
%define EVAL(n,f) SILENT(`%defeval TEMP0 n` `%defeval TEMP1 f` `%define alias ASIS(class_name)ASIS(__)ASIS(TEMP0)` `%define func ASIS(class_name)ASIS(_)ASIS(TEMP1)`)
%mode pop

-- define actual function name output to karel 
-- in format program_function. make sure are
-- are not using too many characters between class_name
-- and "f", as max routine name length is 12.
-- for declaring in .klh files:
-- (eg. ROUTINE funcname(init))
-- for declaring generic alias routine name in .klc files
-- (eg. #defeval constructor funcname(init))

%defeval funcname(f) ASIS(class_name)_#1