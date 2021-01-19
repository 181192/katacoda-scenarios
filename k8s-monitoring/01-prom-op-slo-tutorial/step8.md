## Define what to scrape using Service Monitors

`manifests/servicemonitors/servicemonitor-ingress-nginx.yaml`{{open}}

You can see what ServiceMonitor resource can include [here](https://github.com/prometheus-operator/prometheus-operator/blob/v0.44.0/Documentation/api.md#servicemonitor).

```
kubectl apply -f /root/manifests/servicemonitors/
```{{execute}}

```
kubectl get servicemonitors
```{{execute}}

Now we should see some targets, and we can query: [Prometheus UI](https://[[HOST_SUBDOMAIN]]-30090-[[KATACODA_HOST]].environments.katacoda.com/new/targets)
