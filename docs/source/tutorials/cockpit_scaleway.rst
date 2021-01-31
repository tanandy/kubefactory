git ###############################################
Install your Rancher cockpit on a Scaleway host
###############################################

Be sure to read the :ref:`howto/getting_started`

This tutorial will guide you through:

* Deploy a server on Scaleway Public Cloud
* Delegate a dns subdomain authority to it
* Install K3S and Rancher

.. note::

    This is no marketing bullshit intending to push you into renting a Scaleway server.
    I (the writer) find it fine for demonstration and learning. Feel free to adapt it to your needs/will.

Ready?
******

* Configure a DNS to delegate a SOA to your server.

Set.
****

* Choose the name of your Rancher platform. It must be a valid dns subdomain, as it will be also used for that purpose. In this tutorial we choose 'lab'

Go!
***

First contact
=============

Create a Scaleway instance
--------------------------

Run:

.. code:: bash

    ansible-playbook playbooks/create_cloud_host.yml -e workspace=lab


Expected:

Provision system
----------------

Run:

.. code:: bash

    ansible-playbook playbooks/provision_system.yml -e workspace=lab

Delegate a subdomain
--------------------

Run:

.. code:: bash

    ansible-playbook playbooks/dns_subdomain_gandi.yml -e workspace=lab



Provision certificates
----------------------

Run:

.. code:: bash

    ansible-playbook playbooks/acme_rotate_certificates.yml -e workspace=lab

Provision Rancher
----------------------

Run:

.. code:: bash

    ansible-playbook playbooks/provision_rancher.yml -e workspace=lab

----

.. admonition:: CONGRATULATIONS
    :class: important

    Your cockpit is founded!

----

.. admonition:: HEADSHOT SCRIPT
    :class: danger

    .. code:: bash

        export WORKSPACE=lab && \
        ansible-playbook playbooks/create_cloud_host.yml -e workspace=${WORKSPACE} && \
        ansible-playbook playbooks/provision_system.yml -e workspace=${WORKSPACE} && \
        ansible-playbook playbooks/dns_subdomain_gandi.yml -e workspace=${WORKSPACE} -e mode=destroy -e force=true && \
        ansible-playbook playbooks/dns_subdomain_gandi.yml -e workspace=${WORKSPACE} && \
        ansible-playbook playbooks/acme_rotate_certificates.yml -e workspace=${WORKSPACE} && \
        ansible-playbook playbooks/provision_rancher.yml -e workspace=${WORKSPACE} && \
        ansible-playbook playbooks/rancher_bootstrap.yml -e workspace=${WORKSPACE}
