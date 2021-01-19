# Dashboards


Create a Grafana dashboard manifest

`manifests/dashboards/ingress-nginx-controller.json`{{open}}

Generate a configmap with Kustomize and label with `grafana_dashboard: "1"`

`manifests/dashboards/kustomization.yaml`{{open}}

Apply kustomization to cluster
```
kubectl apply -k /root/manifests/dashboards/
```{{execute}}



Now we should see the dashboard in Grafana: [Grafana UI](https://[[HOST_SUBDOMAIN]]-30030-[[KATACODA_HOST]].environments.katacoda.com/)
