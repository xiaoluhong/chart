# NGINX Ingress Controller Helm Chart

## Introduction

This chart deploys the NGINX Ingress controller in your Kubernetes cluster.

## Installing the Chart

When deploying the Ingress controller, make sure to use your own TLS certificate and key for the default server rather than the default pre-generated ones. Read the [Configuration](#Configuration) section below to see how to configure a TLS certificate and key for the default server. Note that the default server returns the Not Found page with the 404 status code for all requests for domains for which there are no Ingress rules defined.

## Configuration

The following tables lists the configurable parameters of the NGINX Ingress controller  chart and their default values.

Parameter | Description | Default
--- | --- | ---
`controller.name` | The name of the Ingress controller daemon set or deployment. | nginx-ingress
`controller.kind` | The kind of the Ingress controller installation - deployment or daemonset. | deployment
`controller.nginxplus` | Deploys the Ingress controller for NGINX Plus. | false
`controller.hostNetwork` | Enables the Ingress controller pods to use the host's network namespace. | false
`controller.image.repository` | The image repository of the Ingress controller. | nginx/nginx-ingress
`controller.image.tag` | The tag of the Ingress controller image. | 1.2.0
`controller.image.pullPolicy` | The pull policy for the Ingress controller image. | IfNotPresent
`controller.config.entries` | The entries of the ConfigMap for customizing NGINX configuration. | { }
`controller.defaultTLS.cert` | The base64-encoded TLS certificate for the default HTTPS server. If not specified, a pre-generated self-signed certificate is used. **Note:** It is recommended that you specify your own certificate. | A pre-generated self-signed certificate.
`controller.defaultTLS.key` | The base64-encoded TLS key for the default HTTPS server. **Note:** If not specified, a pre-generated key is used. It is recommended that you specify your own key. | A pre-generated key.
`controller.defaultTLS.secret` | The secret with a TLS certificate and key for the default HTTPS server. The value must follow the following format: `<namespace>/<name>`. Used as an alternative to specifiying a certifcate and key using `controller.defaultTLS.cert` and `controller.defaultTLS.key` parameters. | None
`controller.nodeSelector` | The node selector for pod assignment for the Ingress controller pods. | { }
`controller.terminationGracePeriodSeconds` | The termination grace period of the Ingress controller pod. | 30
`controller.tolerations` | The tolerations required for the IBM Cloud Private installation. | None
`controller.replicaCount` | The number of replicas of the Ingress controller deployment. | 1
`service.ingress.create` | Creates a service to expose the Ingress controller pods. | true
`service.ingress.type` | The type of service to create for the Ingress controller. | LoadBalancer
`service.ingress.externalTrafficPolicy` | The externalTrafficPolicy of the service. The value Local preserves the client source IP. | Local
`service.ingress.annotations` | The annotations of the Ingress controller service. | { }
`controller.serviceAccountName` | The serviceAccountName of the Ingress controller pods. Used for RBAC. | nginx-ingress
`controller.ingressClass` | A class of the Ingress controller. The Ingress controller only processes Ingress resources that belong to its class - i.e. have the annotation `"kubernetes.io/ingress.class"` equal to the class. Additionally, the Ingress controller processes Ingress resources that do not have that annotation which can be disabled by setting the "-use-ingress-class-only" flag. | nginx
`controller.useIngressClassOnly` | Ignore Ingress resources without the `"kubernetes.io/ingress.class"` annotation. | false
`controller.watchNamespace` | Namespace to watch for Ingress resources. By default the Ingress controller watches all namespaces. | ""
`controller.healthStatus` | Add a location "/nginx-health" to the default server. The location responds with the 200 status code for any request. Useful for external health-checking of the Ingress controller. | false
`rbac.create` | Configures RBAC. | true
`prometheues.create` | Deploys a Prometheus exporter container within the Ingress controller pod. Requires NGINX Plus. `controller.nginxplus` must be set to `true`. | false
`prometheus.port` | Configures the port to scrape the metrics. | 9113
`prometheus.image.repository` | The image repository of the Prometheus exporter. | nginx/nginx-prometheus-exporter
`prometheus.image.tag` | The tag of the Prometheus exporter image. | 0.1.0
`prometheus.image.pullPolicy` | The pull policy for the Prometheus exporter image. | IfNotPresent

Example:
```
$ cd kubernetes-ingress/helm-chart
$ helm install --name my-release . --set controller.replicaCount=5
```

## Notes
* The values-icp.yaml file is used for deploying the Ingress controller on IBM Cloud Private. See the [blog post](https://www.nginx.com/blog/nginx-ingress-controller-ibm-cloud-private/) for more details.
