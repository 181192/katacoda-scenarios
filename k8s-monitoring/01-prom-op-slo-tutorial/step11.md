# Scaling based on Prometheus metrics

A very useful use case for Prometheus metrics is to scale applications on Kubernetes with the HorizontalPodAutoscaler v2beta2 API.

By extending the normal metrics server (used by the scheduler and `kubectl top`) with a Prometheus Adapter, we can scale the applications based on any Promtheus metrics.

These metrics can be custom prometheus metrics from the application itself, or another source such as the Nginx Ingress Controller.

Here's an example of using the Nginx Ingress Controller metrics to scale once the average request per second (based on 1 min interval) is over 100.

`hpa/hpa-error-service.yaml`{{open}}

First deploy the metrics-server

```
kubectl apply -f /root/manifests/metrics-server
```{{execute}}

Then let's deploy the Prometheus-Adapter for the metrics server

```
kubectl apply -f /root/manifests/prometheus-adapter
```{{execute}}

Query the metrics server for the exported custom metric from the Nginx Ingress Controller

`prometheus-adapter/configmap.yaml`{{open}}

```
kubectl get --raw "/apis/custom.metrics.k8s.io/v1beta1/namespaces/default/ingresses/error-service/nginx_ingress_controller_requests_per_second" | jq
```{{execute}}


And then apply the HPA for the error-service

```
kubectl apply -f /root/manifests/hpa/hpa-error-service.yaml
```{{execute}}

Lets look at the details

```
kubectl get hpa error-service
```{{execute}}

```
kubectl describe hpa error-service
```{{execute}}

```
kubectl get po
```{{execute}}

## Custom metrics from Pod

We can also scale based on the metrics a Pod exposes, let's deploy another sample application that have some metrics:

```
ls -l /root/manifests/podinfo
```{{execute}}

Apply the podinfo manifests

```
kubectl apply -f /root/manifests/podinfo
```{{execute}}

List out all resources labeled `app.kubernetes.io/name=podinfo`

```
kubectl get all -l app.kubernetes.io/name=podinfo
```{{execute}}

`podinfo/hpa.yaml`{{open}}

Query the metrics server to check for the custom metric `http_requests`.

Also check the `/metrics` endpoint for available metrics https://[[HOST_SUBDOMAIN]]-32080-[[KATACODA_HOST]].environments.katacoda.com/metrics.

```
kubectl get --raw "/apis/custom.metrics.k8s.io/v1beta1/namespaces/default/pods/*/http_requests" | jq
```{{execute}}

Check the status of the HPA

```
kubectl get hpa podinfo
```{{execute}}

Describe the HPA for more details

```
kubectl describe hpa podinfo
```{{execute}}

Generate some load

```
hey -z 5m https://[[HOST_SUBDOMAIN]]-32080-[[KATACODA_HOST]].environments.katacoda.com/
```{{execute interrupt}}
