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

For this tutorial to go as expected you must have:

* An AWS account (AKSK with IAM administator rights)
* Follow the :doc:`/howto/conf_scw` how-to guide
* Follow the :doc:`/howto/conf_gandi` how-to guide
* Choose your Rancher instance name. It must be a **valid dns subdomain**. 

******
Set.
******

For this tutorial, let's assume that:

* your domain is ``yourdomain.fr``
* your Rancher instance is ``yourlab``

******
Go!
******

Setup the Rancher instance name
==========================================

Run:

.. code:: bash

    export KUBEFACTORY_WORKSPACE="yourlab"

Create a Scaleway instance
==========================================

Run:

.. code:: bash

    ansible-playbook playbooks/tf_core.yml

Expected:

Init server
==========================================

Run:

.. code:: bash

    ansible-playbook playbooks/core_init.yml


Provision system
==========================================

Run:

.. code:: bash

    ansible-playbook playbooks/core_system.yml

Delegate a subdomain
==========================================

Run:

.. code:: bash

    ansible-playbook playbooks/gandi_delegate_subdomain.yml



Provision certificates
==========================================

Run:

.. code:: bash

    ansible-playbook playbooks/acme_rotate_certificates.yml

Provision Rancher
==========================================

Run:

.. code:: bash

    ansible-playbook playbooks/core_rancher.yml

----

.. admonition:: CONGRATULATIONS
    :class: important

    Your Rancher is setup! You can reach it at `<https://rancher.k3s.yourlab.yourdomain.fr>`_

----

.. admonition:: HEADSHOT SCRIPT
    :class: danger

    .. code:: bash

        export KUBEFACTORY_WORKSPACE=yourlab && \
        ansible-playbook playbooks/tf_core.yml && \
        ansible-playbook playbooks/core_init.yml && \
        ansible-playbook playbooks/gandi_delegate_subdomain.yml -e mode=destroy -e force=true && \
        ansible-playbook playbooks/gandi_delegate_subdomain.yml && \
        ansible-playbook playbooks/core_system.yml && \
        ansible-playbook playbooks/acme_rotate_certificates.yml && \
        ansible-playbook playbooks/core_rancher.yml

.. admonition:: HEADSHOT SCRIPT - DESTROY
    :class: danger

    .. code:: bash

        export KUBEFACTORY_WORKSPACE=yourlab && \
        ansible-playbook playbooks/gandi_delegate_subdomain.yml -e mode=destroy -e force=true && \
        ansible-playbook playbooks/tf_core.yml -e tf_action=destroy
