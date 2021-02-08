env:
	pip3 install -U --no-cache pip setuptools wheel
	pip3 install -U --no-cache -r requirements.txt 
	ansible-galaxy collection install -fr requirements.yml

core:
	ansible-playbook playbooks/tf_core.yml && \
	ansible-playbook playbooks/core_init.yml && \
	ansible-playbook playbooks/gandi_delegate_subdomain.yml -e mode=destroy -e force=true && \
	ansible-playbook playbooks/gandi_delegate_subdomain.yml && \
	ansible-playbook playbooks/core_services.yml && \
	ansible-playbook playbooks/acme_rotate_certificates.yml && \
	ansible-playbook playbooks/core_rancher.yml