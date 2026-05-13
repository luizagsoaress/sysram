install:
	mkdir -p ~/.local/bin
	mkdir -p ~/.local/share/sysram
	cp -r script.sh decodificador interface ~/.local/share/sysram
	cp script.sh ~/.local/bin/script.sh
	sudo cp script-ram.txt ~/.config/systemd/user/script-ram.service
	chmod +x ~/.local/bin/script.sh
	bash interface/interface.sh

run:
	systemctl --user stop script-ram.service
	systemctl --user daemon-reload
	systemctl --user enable script-ram.service
	systemctl --user start script-ram.service