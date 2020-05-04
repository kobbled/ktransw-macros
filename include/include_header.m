%ifndef INC_HEADER_M
%define INC_HEADER_M

%include standard.m

%mode push
%mode string QQQ "`" "`" "\\"
%define header_file(n) `%defeval TEMP_H n`
%mode pop

%endif -- INC_HEADER_M