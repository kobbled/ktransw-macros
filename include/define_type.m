%ifndef DEF_TYPE_M
%define DEF_TYPE_M

%include standard.m

%mode push
%mode string QQQ "`" "`" "\\"
%define def2d(n,r,c) SILENT(`%defeval type_name n` `%defeval t_rows r` `%defeval t_columns c`)
%define check2d `%ifndef type_name` `%error "type_name is not defined before define_type in "%file` `%endif` `%ifndef t_rows || t_columns` `%error "rows and columns must be defined before type declaration in "%file` `%endif`
%mode pop

--  *** 2d array type macro ***
-- declare type above header with:
-- 
-- 't_arr2d(5,10,rarr,REAL)'
--
-- this will create a type for a 5X10
-- REAL matrix called 'rarr'.
--
-- This type can get declared to a variable
-- with arrx(rarr), for a row slice, and 
-- arry(rarr), for a full 2d array.
-- VAR
--   rows    : arrx(rarr)
--   a_2d    : arry(rarr)

%mode push
%mode string QQQ "`" "`" "\\"
%define t_arr2d(y,x,n,t) `TYPE
  #3_0 = ARRAY[x] OF #4
  #3_1 = ARRAY[y] OF #3_0`
%define t_arr2d_ref(y,x,n,t,c) `TYPE
  #3_0 FROM #5 = ARRAY[x] OF #4
  #3_1 FROM #5 = ARRAY[y] OF #3_0`
%define t_arr3d(z,y,x,n,t) `TYPE
  #4_0 = ARRAY[x] OF #5
  #4_1 = ARRAY[y] OF #4_0
  #4_2 = ARRAY[z] OF #4_1`

%define arrx(n) %eval #1_0
%define arry(n) %eval #1_1
%define arrz(n) %eval #1_2
%mode pop

%endif -- DEF_TYPE_M