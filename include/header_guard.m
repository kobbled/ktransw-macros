%include standard.m

%mode push
%mode quote "$"
%define header_guard ASIS(class_name)_h
%defeval header_if $%ifndef header_guard$ 
%defeval header_def $%define header_guard$
%mode pop