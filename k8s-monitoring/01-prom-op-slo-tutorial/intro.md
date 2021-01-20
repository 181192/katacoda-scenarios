# SLO tutorial with Prometheus Operator on Kubernetes

In this tutorial we will look at deploying a monitoring solution on Kubernetes and get SLO alerts from the Nginx Ingress Controller.

We will deploy:
- The Prometheus Operator
- A Prometheus instance using the `Prometheus` CRD
- A Alertmanager instance using the `Alertmanager` CRD
- A Nginx Ingress Controller to read metrics from
- A demo application for generating 200 and 500 HTTP status codes to trigger alerts
- Configuring Prometheus scrape targets using the declarative `ServiceMonitor` CRD
- Configuring Prometheus alerts using the declarative `PrometheusRule` CRD


Here's the complete documentation https://github.com/prometheus-operator/prometheus-operator/blob/v0.44.0/Documentation/api.md

- `Prometheus`, which defines a desired Prometheus deployment. (most cases only need one per cluster)
- `Alertmanager`, which defines a desired Alertmanager deployment. (most cases only need one per cluster)
- `ThanosRuler`, which defines a desired Thanos Ruler deployment.
- `ServiceMonitor`, which declaratively specifies how groups of Kubernetes services should be monitored. The Operator automatically generates Prometheus scrape configuration based on the current state of the objects in the API server.
- `PodMonitor`, which declaratively specifies how group of pods should be monitored. The Operator automatically generates Prometheus scrape configuration based on the current state of the objects in the API server.
- `Probe`, which declaratively specifies how groups of ingresses or static targets should be monitored. The Operator automatically generates Prometheus scrape configuration based on the definition.
- `PrometheusRule`, which defines a desired set of Prometheus alerting and/or recording rules. The Operator generates a rule file, which can be used by Prometheus instances.
- `AlertmanagerConfig`, which declaratively specifies subsections of the Alertmanager configuration, allowing routing of alerts to custom receivers, and setting inhibit rules.
