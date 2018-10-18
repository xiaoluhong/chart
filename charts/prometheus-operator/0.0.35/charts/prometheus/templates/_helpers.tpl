{{/* vim: set filetype=mustache: */}}

{{/*
Any override actions on sub chart are forbidden!!!
*/}}

{{/*
Expand the name of the chart.
*/}}
{{- define "prometheus.name" -}}
{{- .Chart.Name -}}
{{- end -}}

{{/*
Create a name with version information for the chart.
*/}}
{{- define "prometheus.version" -}}
{{- $name := include "prometheus.name" . -}}
{{- $version := .Chart.Version | replace "+" "_" -}}
{{- printf "%s-%s" $name $version -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
*/}}
{{- define "prometheus.fullname" -}}
{{- $name := include "prometheus.name" . -}}
{{- printf "%s-%s" $name .Release.Name -}}
{{- end -}}

{{/*
Create a dns name for the chart.
*/}}
{{- define "prometheus.dnsname" -}}
{{- include "prometheus.fullname" . | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a dns name for the nginx component of the chart.
*/}}
{{- define "prometheus.nginx.dnsname" -}}
{{- $name := include "prometheus.name" . -}}
{{- printf "%s-nginx-%s" $name .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

Create a default fully qualified app name for the nginx component.
*/}}
{{- define "prometheus.nginx.fullname" -}}
{{- $name := include "prometheus.name" . -}}
{{- printf "%s-nginx-%s" $name .Release.Name -}}
{{- end -}}

{{/*
Create a default fully qualified app name for psp.
*/}}
{{- define "prometheus.psp.fullname" -}}
{{- $name := include "prometheus.name" . -}}
{{- printf "%s-psp-%s" $name .Release.Name -}}
{{- end -}}

{{/*
Create the name of the service account to use
*/}}
{{- define "prometheus.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
    {{ default (include "prometheus.fullname" .) .Values.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.serviceAccount.name }}
{{- end -}}
{{- end -}}

{{/*
Return the appropriate apiVersion value to use for the prometheus-operator managed k8s resources
*/}}
{{- define "prometheus-operator.apiVersion" -}}
{{- default "monitoring.coreos.com/v1" (.Values.apiGroup | printf "%s/v1") -}}
{{- end -}}
