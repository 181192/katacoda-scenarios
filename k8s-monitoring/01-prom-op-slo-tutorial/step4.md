## Deploy Prometheus through the operator

Let's see how Prometheus definition looks like:

`prometheus/prometheus.yaml`{{open}}

```
kubectl apply -f /root/manifests/prometheus/
```{{execute}}

```
kubectl get po
```{{execute}}

Let's see what it scrapes: [Prometheus UI](https://[[HOST_SUBDOMAIN]]-30090-[[KATACODA_HOST]].environments.katacoda.com/new/targets)

You should see no targets indeed! Check next step how to fix this.
