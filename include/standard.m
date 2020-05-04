%ifndef STANDARD_M
%define STANDARD_M

--Force output macro (eg. ASIS(x)_ASIS(y) = x_y)
%define ASIS(x) x
--Do not include in output
%define SILENT(x) ASIS()

%endif -- STANDARD_M