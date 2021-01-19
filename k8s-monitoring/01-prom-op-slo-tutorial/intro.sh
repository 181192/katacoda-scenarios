#!/usr/bin/env bash

mkdir -p /root/manifests/crds
mkdir -p /root/manifests/alertmanager
mkdir -p /root/manifests/grafana
mkdir -p /root/manifests/prometheus
mkdir -p /root/manifests/prometheus-operator

launch.sh
