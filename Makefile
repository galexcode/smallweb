prefix=/usr

game: smallweb.c
	gcc smallweb.c -o smallweb `pkg-config --cflags gtk+-2.0 --libs webkit-1.0`

install: smallweb
	sudo install -g dialout smallweb $(prefix)/bin
	sudo cp ./smallweb.desktop $(prefix)/share/applications/smallweb.desktop
	sudo cp ./minimalwebbrowser.png $(prefix)/share/pixmaps/minimalwebbrowser.png

remove: 
	sudo rm $(prefix)/bin/smallweb
	sudo rm $(prefix)/share/applications/smallweb.desktop
	sudo rm $(prefix)/share/pixmaps/minimalwebbrowser.png

clean:
	rm ./smallweb

tar: smallweb.c Makefile
	cd .. && tar -czvf smallweb_1.0.orig.tar.gz ./smallweb-1.0/Makefile ./smallweb-1.0/smallweb.c ./smallweb-1.0/COPYING ./smallweb-1.0/minimalwebbrowser.png ./smallweb-1.0/smallweb.desktop

deb: smallweb
	debuild -us -uc	

install-deb: smallweb_1.0-2_armhf.deb
	sudo dpkg -i ../smallweb_1.0-2_armhf.deb
	

