env:
	direnv allow .
	direnv reload
	pip3 install -U -r requirements.txt --no-cache
	direnv reload
