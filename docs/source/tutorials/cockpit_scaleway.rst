##########################################
Install Rancher on a Scaleway instance
##########################################

Be sure to read the :doc:`/howto/getting_started`

This tutorial will guide you through:

* Deploy a server on Scaleway Public Cloud
* Delegate a dns subdomain authority to it
* Install K3S and Rancher

.. note::

    This is no marketing bullshit intending to push you into renting a Scaleway server.
    I (the writer) find it fine for demonstration and learning. Feel free to adapt it to your needs/will.

******
Ready?
******

* Configure a DNS to delegate a SOA to your server.

******
Set.
******

* Choose the name of your Rancher platform. It must be a valid dns subdomain, as it will be also used for that purpose. In this tutorial we choose 'lab'

******
Go!
******

Create a Scaleway instance
==========================================

Run:

.. code:: bash

    ansible-playbook playbooks/tf_core.yml -e workspace=lab


Expected:

Init server
==========================================

Run:

.. code:: bash

    ansible-playbook playbooks/core_init.yml -e workspace=lab


Provision system
==========================================

Run:

.. code:: bash

    ansible-playbook playbooks/core_services.yml -e workspace=lab

Delegate a subdomain
==========================================

Run:

.. code:: bash

    ansible-playbook playbooks/gandi_delegate_subdomain.yml -e workspace=lab



Provision certificates
==========================================

Run:

.. code:: bash

    ansible-playbook playbooks/acme_rotate_certificates.yml -e workspace=lab

Provision Rancher
==========================================

Run:

.. code:: bash

    ansible-playbook playbooks/core_rancher.yml -e workspace=lab

----

.. admonition:: CONGRATULATIONS
    :class: important

    Your cockpit is founded!

----

.. admonition:: HEADSHOT SCRIPT
    :class: danger

    .. code:: bash

        export KUBEFACTORY_WORKSPACE=lab && \
        ansible-playbook playbooks/tf_core.yml && \
        ansible-playbook playbooks/core_init.yml && \
        ansible-playbook playbooks/gandi_delegate_subdomain.yml -e mode=destroy -e force=true && \
        ansible-playbook playbooks/gandi_delegate_subdomain.yml && \
        ansible-playbook playbooks/core_system.yml && \
        ansible-playbook playbooks/acme_rotate_certificates.yml && \
        ansible-playbook playbooks/core_rancher.yml

