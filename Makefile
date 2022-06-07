CACHE_DIR = $(CURDIR)/_cache

ansible-packages:
	CACHE_DIR=$(CACHE_DIR) python3 ./scripts/ansible-package.py

sync-ansible-packages:
	rsync -avP $(CACHE_DIR)/*.tar.gz a3-iso:/data/vm-images

download-sync-ansible-packages: ansible-packages sync-ansible-packages
