let g:vimball_home = "."
e Makefile
v/^SOURCE/d
%s/^SOURCE\s\++\?=\s\+//
execute '%MkVimball!' . g:plugin_name
