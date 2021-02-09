##########################################
Configure Gandi access
##########################################

Prerequisites
=============

* Follow the :doc:`getting_started` how-to guide.
* `Open a Gandi account <https://account.gandi.net/en/create_account>`_
* Buy or link a domain name to your Gandi account.
* Generate a production API key from the API Key Page (in the Security section).

Configure your Gandi account
==========================================

At the workspace root, create a ``.env.gandi`` file with this content:

.. code:: bash

    export GANDI_API_KEY="..."
    export GANDI_DOMAIN="..."

Then run:

.. code:: bash

    direnv reload