# Bootstrapping the CRD's into the cluster

`crds/crd-prometheuses.yaml`{{open}}

```
ls -l /root/manifests/crds
```{{execute}}

```
kubectl apply -f /root/manifests/crds/
```{{execute}}
