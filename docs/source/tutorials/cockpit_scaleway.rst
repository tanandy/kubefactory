##########################################
Install Rancher on a Scaleway instance
##########################################

This tutorial will guide you through:

* Creating a server on Scaleway Elements
* Delegating a (Gandi-managed) dns subdomain authority to it
* Installing K3S and Rancher

Estimated 

******
Ready?
******

For this tutorial to go as expected you **must**:

* Follow the :doc:`/howto/getting_started` how-to guide
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

Most of the playbooks hosts scope is based on the ``'workspace'`` ansible variable.
This variable take its default value from environment variable ``KUBEFACTORY_WORKSPACE``.

This value will be used as a DNS subdomain delegated to the Scaleway instance we will create.

Run:

.. code:: bash

    export KUBEFACTORY_WORKSPACE="yourlab"

Create instance
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
        ansible-playbook playbooks/core_rancher.yml && \
        ansible-playbook playbooks/tf_rancher_bootstrap.yml

.. admonition:: HEADSHOT SCRIPT - DESTROY
    :class: danger

    .. code:: bash

        export KUBEFACTORY_WORKSPACE=yourlab && \
        ansible-playbook playbooks/gandi_delegate_subdomain.yml -e mode=destroy -e force=true && \
        ansible-playbook playbooks/tf_core.yml -e tf_action=destroy
