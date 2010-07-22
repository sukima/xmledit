PLUGIN = xmledit
VERSION=1.9.1

SOURCE = ftplugin/xml.vim
SOURCE += doc/xml-plugin.txt

${PLUGIN}-${VERSION}.vba: ${SOURCE}
		vim --cmd 'let g:plugin_name="${PLUGIN}-${VERSION}"' -S build.vim -cq!

install:
		rsync -Rv ${SOURCE} ${HOME}/.vim/

clean:
		rm ${PLUGIN}-${VERSION}.vba

update-version:
		sed "s/Version: [\d.]\\+/Version: ${VERSION}/" README.mkd > README.mkd.tmp
		mv README.mkd.tmp README.mkd
		sed "s/Version: [\d.]\\+/Version: ${VERSION}/" ftplugin/xml.vim > ftplugin/xml.vim.tmp
		mv ftplugin/xml.vim.tmp ftplugin/xml.vim
		sed "s/Version: [\d.]\\+/Version: ${VERSION}/" doc/xml-plugin.txt > doc/xml-plugin.txt.tmp
		mv doc/xml-plugin.txt.tmp doc/xml-plugin.txt
