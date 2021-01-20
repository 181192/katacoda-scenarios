## SLO's with Prometheus Rules

Let's use following tool to create our SLO based on alert: https://promtools.dev/.

(based on Google's [The Site Reliability Workbook](https://sre.google/workbook/alerting-on-slos/))

Simple example of 500 errors:

`rules/ingress-nginx-500-error-rule.yaml`{{open}}

```
kubectl apply -f /root/manifests/rules/ingress-nginx-500-error-rule.yaml
```{{execute}}

```
kubectl get prometheusrules
```{{execute}}


Error budget:

`rules/ingress-nginx-slo-errorbudget-rules.yaml`{{open}}

```
kubectl apply -f /root/manifests/rules/ingress-nginx-slo-errorbudget-rules.yaml
```{{execute}}

```
kubectl get prometheusrules
```{{execute}}


Generate som traffic:

```
snap install hey
```{{execute}}

```
hey -z 5m https://[[HOST_SUBDOMAIN]]-32080-[[KATACODA_HOST]].environments.katacoda.com/
```{{execute interrupt}}

Check the prometheus rules in the [Prometheus Alerts UI](https://[[HOST_SUBDOMAIN]]-30090-[[KATACODA_HOST]].environments.katacoda.com/alerts)

Alerts should be firing after 1-2 min both 500 error and errorbudget's alerts.

Stop the loadtesting after the alerts is firing and generate 200 requests by running:

```
hey -z 5m https://[[HOST_SUBDOMAIN]]-32080-[[KATACODA_HOST]].environments.katacoda.com/ok
```{{execute interrupt}}

Alerts should be going back to normal after a couple of minutes, the first should be the 500 error alert.

Continue to the next step for deploying a Grafana dashboard to get some overall metrics about our environment.
