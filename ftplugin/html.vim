" Vim script file                                           vim600:fdm=marker:
" FileType:	HTML
" Maintainer:	Devin Weaver <vim@tritarget.com>
" Last Change:  $Date$
" Version:      $Revision$
" Location:	http://tritarget.com/pub/vim/ftplugin/html.vim

" This is a wrapper script to add extra html support to xml documents.

" Only do this when not done yet for this buffer
if exists("b:did_ftplugin")
  finish
endif
" Don't set 'b:did_ftplugin = 1' because that is xml.vim's responsability.

let b:html_mode = 1

if !exists("*HtmlAttribCallback")
function HtmlAttribCallback( xml_tag )
    if a:xml_tag ==? "table"
	return "cellpadding=\"0\" cellspacing=\"0\" border=\"0\""
    elseif a:xml_tag ==? "link"
	return "href=\"/site.css\" rel=\"StyleSheet\" type=\"text/css\""
    elseif a:xml_tag ==? "body"
	return "bgcolor=\"white\""
    elseif a:xml_tag ==? "frame"
	return "name=\"NAME\" src=\"/\" scrolling=\"auto\" noresize"
    elseif a:xml_tag ==? "frameset"
	return "rows=\"0,*\" cols=\"*,0\" border=\"0\""
    elseif a:xml_tag ==? "img"
	return "src=\"\" width=\"0\" height=\"0\" border=\"0\" alt=\"\""
    else
	return 0
    endif
endfunction
endif

" On to loading xml.vim
runtime ftplugin/xml.vim

