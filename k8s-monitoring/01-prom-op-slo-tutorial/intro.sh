#!/usr/bin/env bash

mkdir -p /root/manifests/crds
mkdir -p /root/manifests/alertmanager
mkdir -p /root/manifests/grafana
mkdir -p /root/manifests/prometheus
mkdir -p /root/manifests/prometheus-operator

docker pull quay.io/prometheus-operator/prometheus-operator:v0.44.0
docker pull quay.io/prometheus-operator/prometheus-config-reloader:v0.44.0
docker pull quay.io/prometheus/prometheus:v2.22.1
docker pull kiwigrid/k8s-sidecar:1.1.0
docker pull grafana/grafana:7.3.5
docker pull quay.io/prometheus/alertmanager:v0.21.0
