%include standard.m

%mode push
%mode quote "$"
%define header_guard ASIS(class_name)_h
%define header_guard_private ASIS(class_name)_private_h

%defeval header_if $%ifndef header_guard$ 
%defeval header_def $%define header_guard$

%defeval header_private_if $%ifndef header_guard_private$ 
%defeval header_private_def $%define header_guard_private$
%mode pop