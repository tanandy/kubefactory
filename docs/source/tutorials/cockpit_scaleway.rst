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
* A Scaleway account (AKSK and organization id)
* A gandi account (API key + domain name)

******
Set.
******

Configure your Gandi account
==========================================

At the workspace root, create a ``.env.gandi`` file with this content:

.. code:: bash

    export GANDI_API_KEY="..."
    export GANDI_DOMAIN="..."

Then run:

.. code:: bash

    direnv reload
    
.. tip::

    Let's assume that your domain will be ``yourdomain.fr``

Configure your Scaleway account
==========================================

At the workspace root, create a ``.env.scw`` file with this content:

.. code:: bash

    export SCW_DEFAULT_ORGANIZATION_ID="..."
    export SCW_ACCESS_KEY="..."
    export SCW_SECRET_KEY="..."
    export SCW_DEFAULT_REGION="..."
    export SCW_DEFAULT_ZONE="..."

Then run:

.. code:: bash

    direnv reload

Choose the name of your Rancher instance
==========================================

It must be a **valid dns subdomain** (it will be used for that). 

To point to this value, run:

.. code:: bash

    export KUBEFACTORY_WORKSPACE="..."

.. tip::

    Let's assume that your domain will be ``yourlab``

******
Go!
******

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

