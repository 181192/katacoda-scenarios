## SLO's with Prometheus Rules

Let's use following tool to create our SLO based on alert: https://promtools.dev/


Simple example of 500 errors:

`manifests/rules/ingress-nginx-500-error-rule.yaml`{{open}}

```
kubectl apply -f /root/manifests/rules/ingress-nginx-500-error-rule.yaml
```{{execute}}

```
kubectl get prometheusrules
```{{execute}}


Error budget:

`manifests/rules/ingress-nginx-slo-errorbudget-rules.yaml`{{open}}

```
kubectl apply -f /root/manifests/rules/ingress-nginx-slo-errorbudget-rules.yaml
```{{execute}}

```
kubectl get prometheusrules
```{{execute}}


Generate som traffic

```
snap install hey
```{{execute}}

```
hey -z 5m https://[[HOST_SUBDOMAIN]]-32080-[[KATACODA_HOST]].environments.katacoda.com/
```{{execute interrupt}}

Check the prometheus rules in the [Prometheus Alerts UI](https://[[HOST_SUBDOMAIN]]-30090-[[KATACODA_HOST]].environments.katacoda.com/alerts)
