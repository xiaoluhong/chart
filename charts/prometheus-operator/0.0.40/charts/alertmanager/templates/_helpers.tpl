{{/* vim: set filetype=mustache: */}}

{{/*
Any override actions on sub chart are forbidden!!!
*/}}

{{/*
Expand the name of the chart
*/}}
{{- define "alertmanager.name" -}}
{{- .Chart.Name -}}
{{- end -}}

{{/*
Create a name with version information for the chart.
*/}}
{{- define "alertmanager.version" -}}
{{- $name := include "alertmanager.name" . -}}
{{- $version := .Chart.Version | replace "+" "_" -}}
{{- printf "%s-%s" $name $version -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
*/}}
{{- define "alertmanager.fullname" -}}
{{- $name := include "alertmanager.name" . -}}
{{- printf "%s-%s" $name .Release.Name -}}
{{- end -}}

{{/*
Create a dns name for the chart.
*/}}
{{- define "alertmanager.dnsname" -}}
{{- include "alertmanager.fullname" . | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name for psp.
*/}}
{{- define "alertmanager.psp.fullname" -}}
{{- $name := include "alertmanager.name" . -}}
{{- printf "%s-psp-%s" $name .Release.Name -}}
{{- end -}}

{{/*
Return the appropriate apiVersion value to use for the prometheus-operator managed k8s resources
*/}}
{{- define "prometheus-operator.apiVersion" -}}
{{- default "monitoring.coreos.com/v1" (.Values.apiGroup | printf "%s/v1") -}}
{{- end -}}
