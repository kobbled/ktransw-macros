%ifndef INC_TYPES_M
%define INC_TYPES_M

%mode push
%mode string QQQ "`" "`" "\\"
%define type_file(n) SILENT(`%defeval TEMP_T #1.klt`)
%mode pop

%mode push
%mode quote "$"
%defeval include_type $%include TEMP_T$
%mode pop

%endif -- INC_TYPES_M