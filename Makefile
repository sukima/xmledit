PLUGIN = xmledit

SOURCE = ftplugin/xml.vim
SOURCE += doc/xml-plugin.txt

${PLUGIN}.vba: ${SOURCE}
		vim --cmd 'let g:plugin_name="${PLUGIN}"' -S build.vim -cq!

install:
		rsync -Rv ${SOURCE} ${HOME}/.vim/

clean:
		rm ${PLUGIN}.vba
