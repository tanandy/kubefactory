#!/bin/bash

# FIXME url
curl -s "http://helper.cab0924b-b548-4682-9b98-2634f966f5a8.nodes.k8s.fr-par.scw.cloud/$2/$1" | jq ."helpMessage"
