%ifndef DEF_TYPE_M
%define DEF_TYPE_M

%include standard.m

%mode push
%mode string QQQ "`" "`" "\\"
%define check2d `%ifndef type_name` `%error "type_name is not defined before define_type in "%file` `%endif` `%ifndef t_rows || t_columns` `%error "rows and columns must be defined before type declaration in "%file` `%endif`
%mode pop

--  *** 2d array type macro ***
-- declare type above header with:
-- 't_arr2d(5,10,rarr,REAL)'
-- creates a 5 x 10 REAL 2d array
-- variables should be subsequently declared as:
-- VAR
--   rows    : arrx(rarr)
--   a_2d    : arry(rarr)

%mode push
%mode string QQQ "`" "`" "\\"
%define t_arr2d(y,x,n,t) `TYPE
  #3_0 = ARRAY[x] OF #4
  #3_1 = ARRAY[y] OF #3_0`
%define t_arr2d_ref(y,x,n,t) `TYPE
  #3_0 FROM #3 = ARRAY[x] OF #4
  #3_1 FROM #3 = ARRAY[y] OF #3_0`
%define t_arr3d(z,y,x,n,t) `TYPE
  #4_0 = ARRAY[x] OF #5
  #4_1 = ARRAY[y] OF #4_0
  #4_2 = ARRAY[z] OF #4_1`

%define arrx(n) %eval #1_0
%define arry(n) %eval #1_1
%define arrz(n) %eval #1_2
%mode pop


-- declare hash type of variable type
-- can use any type, preferably a STRUCTURE
-- eg. t_hash(hashstring,INTEGER,hashClass)
%mode push
%mode string QQQ "`" "`" "\\"
%ifndef HSH_KEY_SIZE
%define HSH_KEY_SIZE 12
%endif
%define t_hash(n,t,c) `TYPE
	n FROM c = STRUCTURE
		key     : STRING[HSH_KEY_SIZE]
		val     : t
	ENDSTRUCTURE`
%mode pop

-- path type declaration
%define call_path_type(head_type,node_type) SILENT(%ifneq (head_type) ())SILENT(%define h pathheader = head_type,)SILENT(%else)SILENT(%define h)SILENT(%endif)ASIS(PATH h nodedata = node_type)



%endif -- DEF_TYPE_M