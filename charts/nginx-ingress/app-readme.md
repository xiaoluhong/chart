# NGINX Ingress Controller

This is an implementation of a Kubernetes Ingress controller for NGINX and NGINX Plus, which provides HTTP load balancing for applications your deploy in your Kubernetes cluster. You can find more details on what an Ingress controller is on the [main page](https://github.com/nginxinc/kubernetes-ingress).

## Prerequisites
  If you’d like to use NGINX Plus:
  - Build an Ingress controller image with NGINX Plus and push it to your private registry by following the instructions from [here](https://github.com/nginxinc/kubernetes-ingress/blob/master/nginx-controller/README.md).
  - Update the `NGINX Plus Image Repository` to your custom build image repository accordingly.

