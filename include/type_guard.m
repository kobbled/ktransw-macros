%ifndef TYPE_GUARD_M
%define TYPE_GUARD_M

%include standard.m

%mode push
%mode quote "$"
%define type_guard ASIS(type_name)_t
%defeval type_if $%ifndef type_guard$ 
%defeval type_def $%define type_guard$
%mode pop

%endif -- TYPE_GUARD_M