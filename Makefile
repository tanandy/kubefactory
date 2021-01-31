env:
	direnv allow .
	direnv reload
	pip3 install -U -r requirements.txt --no-cache
	ansible-galaxy collection install -fr requirements.yml
	direnv reload

# instance: