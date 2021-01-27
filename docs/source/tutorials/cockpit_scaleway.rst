###########################
Install your Rancher cockpit on a Scaleway
###########################

This tutorial will guide you through installing a fresh clan instance on a Kimsufi server, from zero to
all services enabled. 

.. note::

    This is no marketing bullshit intending to push you into renting a Kimsufi server.
    This is only based on our available infrastructure at the time of writing.

Ready?
******

* Have a ready `galaxie-clans` workspace (see [How to setup a galaxie-clans workspace](_howto_setup.md)).
* Have a `Kimsufi <https://www.kimsufi.com/>`_ server, installed with the template ``Debian 9 (Stretch) (64bits)``.
* Validate you are able to log as `root`.
* Configure a DNS to delegate a SOA to your server.

Set.
****

* We will call our host ``kimserver``. If you want to rename it, be aware to replace any occurence in the following steps.
* We will use the label ``$KIM_IPV4`` instead of a real IP address. replace with actual values when following instructions.
* The domain that ``kimserver`` is SOA for, will be named ``tuto.galaxie.clans``. Replace any occurence in the following steps with the domain you chose.
* The name of the clan we are founding is ``kimclan``
* All commands are to be run from the root of your ``galaxie-clans`` workspace.

Go!
***

First contact
=============

Create a scaleway instance
--------------------------

Run:

.. code:: bash

    ansible-playbook playbooks/create_cloud_host.yml -e workspace=gaocho


Expected:

Provision system
----------------

Run:

.. code:: bash

    ansible-playbook playbooks/provision_system.yml -e workspace=gaocho

Delegate a subdomain
--------------------

Run:

.. code:: bash

    ansible-playbook playbooks/dns_subdomain_gandi.yml -e workspace=gaocho



Provision certificates
----------------------

Run:

.. code:: bash

    ansible-playbook playbooks/acme_rotate_certificates.yml -e workspace=factory

Provision Rancher
----------------------

Run:

.. code:: bash

    ansible-playbook playbooks/provision_rancher.yml -e workspace=factory

----

.. admonition:: CONGRATULATIONS
    :class: important

    Your cockpit is founded!

    Welcome in the galaxie-clans's community.

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
