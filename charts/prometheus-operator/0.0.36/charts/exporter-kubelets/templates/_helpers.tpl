{{/* vim: set filetype=mustache: */}}

{{/*
Any override actions on sub chart are forbidden!!!
*/}}

{{/*
Expand the name of the chart.
*/}}
{{- define "exporter-kubelets.name" -}}
{{- .Chart.Name -}}
{{- end -}}

{{/*
Create a name with version information for the chart.
*/}}
{{- define "exporter-kubelets.version" -}}
{{- $name := include "exporter-kubelets.name" . -}}
{{- $version := .Chart.Version | replace "+" "_" -}}
{{- printf "%s-%s" $name $version -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
*/}}
{{- define "exporter-kubelets.fullname" -}}
{{- $name := include "exporter-kubelets.name" . -}}
{{- printf "%s-%s" $name .Release.Name -}}
{{- end -}}

{{/*
Return the appropriate apiVersion value to use for the prometheus-operator managed k8s resources
*/}}
{{- define "prometheus-operator.apiVersion" -}}
{{- default "monitoring.coreos.com/v1" (.Values.apiGroup | printf "%s/v1") -}}
{{- end -}}
