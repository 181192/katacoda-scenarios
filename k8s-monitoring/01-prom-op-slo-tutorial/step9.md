## SLO's with Prometheus Rules

Let's use following tool to create our SLO based on alert: https://promtools.dev/


Simple example of 500 errors:

`manifests/rules/ingress-nginx-500-error-rule.yaml`{{open}}


Error budget:

`manifests/rules/ingress-nginx-slo-errorbudget-rules.yaml`{{open}}


Generate som traffic

```
hey -z 5m https://[[HOST_SUBDOMAIN]]-32080-[[KATACODA_HOST]].environments.katacoda.com/
```

Check the prometheus rules in the [Prometheus Alerts UI](https://[[HOST_SUBDOMAIN]]-30090-[[KATACODA_HOST]].environments.katacoda.com/alerts)
