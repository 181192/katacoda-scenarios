# Dashboards


Create a Grafana dashboard manifest

`dashboards/ingress-nginx-controller.json`{{open}}

Generate a configmap with Kustomize and label with `grafana_dashboard: "1"`

`dashboards/kustomization.yaml`{{open}}

Apply kustomization to cluster
```
kubectl apply -k /root/manifests/dashboards/
```{{execute}}



Now we should see the dashboard in Grafana: [Grafana UI](https://[[HOST_SUBDOMAIN]]-30030-[[KATACODA_HOST]].environments.katacoda.com/d/XNam6FSH9XFn/ingress-nginx-controller?orgId=1&refresh=5s)
