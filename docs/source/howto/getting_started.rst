###############
Getting started
###############

Prerequisites
=============

* ``make``
* ``python >= 3.7.3``
* ``virtualenv``
* ``pip3``
* `direnv <https://direnv.net/docs/installation.html>`_ 
* ``terraform >= 0.14``

Setup workspace
===============

* `Hook direnv to your shell <https://direnv.net/docs/hook.html>`_

* Run:

.. code:: bash

    git clone https://gitlab.com/wescalefr-oss/ansible/collections/kubefactory.git
    cd kubefactory
    direnv allow .
    make env

.. admonition:: CONGRATULATIONS
    :class: important

    You are ready to play with the kubefactory project.

