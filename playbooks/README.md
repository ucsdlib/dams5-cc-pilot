DAMS 5 Curation Concerns Demo
=============================

Installs dependencies for Curation Concerns as listed on [Project Hydra Curation Concerns](https://github.com/projecthydra/curation_concerns/#prerequisites).

Steps:

1. `cd playbooks; ./setup.sh`  
This will install all required roles
2. `cp hosts-sample hosts`  
Edit `hosts` to match your environment
3. `ansible-playbook playbook.yml -K -k`  
Runs the playbook against the target host.

To use the Vagrant box:

1. `cd playbooks; vagrant up`
