{{/* vim: set filetype=mustache: */}}

{{/*
Any override actions on sub chart are forbidden!!!
*/}}

{{/*
Expand the name of the chart.
*/}}
{{- define "grafana.name" -}}
{{- .Chart.Name -}}
{{- end -}}

{{/*
Create a name with version information for the chart.
*/}}
{{- define "grafana.version" -}}
{{- $name := include "grafana.name" . -}}
{{- $version := .Chart.Version | replace "+" "_" -}}
{{- printf "%s-%s" $name $version -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
*/}}
{{- define "grafana.fullname" -}}
{{- $name := include "grafana.name" . -}}
{{- printf "%s-%s" $name .Release.Name -}}
{{- end -}}

{{/*
Create a dns name for the chart.
*/}}
{{- define "grafana.dnsname" -}}
{{- include "grafana.fullname" . | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a dns name for the nginx component of the chart.
*/}}
{{- define "grafana.nginx.dnsname" -}}
{{- $name := include "grafana.name" . -}}
{{- printf "%s-nginx-%s" $name .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name for nginx.
*/}}
{{- define "grafana.nginx.fullname" -}}
{{- $name := include "grafana.name" . -}}
{{- printf "%s-nginx-%s" $name .Release.Name -}}
{{- end -}}

{{/*
Create a default fully qualified app name for dashboards.
*/}}
{{- define "grafana.dashboards.fullname" -}}
{{- $name := include "grafana.name" . -}}
{{- printf "%s-dashboards-%s" $name .Release.Name -}}
{{- end -}}

{{/*
Create a default fully qualified app name for psp.
*/}}
{{- define "grafana.psp.fullname" -}}
{{- $name := include "grafana.name" . -}}
{{- printf "%s-psp-%s" $name .Release.Name -}}
{{- end -}}

{{/*
Return the appropriate apiVersion value to use for the prometheus-operator managed k8s resources
*/}}
{{- define "prometheus-operator.apiVersion" -}}
{{- default "monitoring.coreos.com/v1" (.Values.apiGroup | printf "%s/v1") -}}
{{- end -}}
