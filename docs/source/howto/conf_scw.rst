##########################################
Configure Scaleway access
##########################################

Prerequisites
=============

* Follow the :doc:`getting_started` how-to guide.
* `Open a Scaleway account <https://www.scaleway.com/en/docs/create-your-scaleway-account>`_
* `Retrieve your organization id <https://www.scaleway.com/en/docs/scaleway-organizations/#-Retrieving-your-Organization-ID>`_
* `Generate Scaleway API key <https://www.scaleway.com/en/docs/generate-api-keys>`_
* `Choose your deployment zone <https://registry.terraform.io/providers/scaleway/scaleway/latest/docs/guides/regions_and_zones>`_

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
