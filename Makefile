prefix=/usr

game: web.c
	gcc web.c -o smallweb `pkg-config --cflags gtk+-2.0 --libs webkit-1.0`

install: web
	sudo install -g dialout smallweb $(prefix)/bin
	sudo cp ./web.desktop $(prefix)/share/applications/web.desktop
	sudo cp ./minimalwebbrowser.png $(prefix)/share/pixmaps/minimalwebbrowser.png

remove: 
	sudo rm $(prefix)/bin/smallweb
	sudo rm $(prefix)/share/applications/web.desktop
	sudo rm $(prefix)/share/pixmaps/minimalwebbrowser.png

clean:
	rm ./web

tar: web.c Makefile
	cd .. && tar -czvf web_1.0.orig.tar.gz ./web-1.0/Makefile ./web-1.0/web.c ./web-1.0/COPYING ./web-1.0/minimalwebbrowser.png ./web-1.0/web.desktop

deb: smallweb
	debuild -us -uc	

install-deb: smallweb_1.0-2_armhf.deb
	sudo dpkg -i ../web_1.0-2_armhf.deb
	

