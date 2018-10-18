{{/* vim: set filetype=mustache: */}}

{{/*
Expand the name of the chart.
*/}}
{{- define "prometheus-operator.name" -}}
{{- default .Chart.Name .Values.nameOverride -}}
{{- end -}}

{{/*
Create a name with version information for the chart.
*/}}
{{- define "prometheus-operator.version" -}}
{{- $name := include "prometheus-operator.name" . -}}
{{- $version := .Chart.Version | replace "+" "_" -}}
{{- printf "%s-%s" $name $version -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
*/}}
{{- define "prometheus-operator.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name -}}
{{- else -}}
{{- printf "%s-%s" $name .Release.Name -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create a default fully qualified app name for psp.
*/}}
{{- define "prometheus-operator.psp.fullname" -}}
{{- $name := include "prometheus-operator.name" . -}}
{{- printf "%s-psp-%s" $name .Release.Name -}}
{{- end -}}

{{/*
Create a default fully qualified app name for create servicemonitor job.
*/}}
{{- define "prometheus-operator.create-sm-job.fullname" -}}
{{- $name := include "prometheus-operator.name" . -}}
{{- printf "%s-create-sm-%s" $name .Release.Name -}}
{{- end -}}

{{/*
Create a default fully qualified app name for get CRD job.
*/}}
{{- define "prometheus-operator.get-crd-job.fullname" -}}
{{- $name := include "prometheus-operator.name" . -}}
{{- printf "%s-get-crd-%s" $name .Release.Name -}}
{{- end -}}

{{/*
Return the appropriate apiVersion value to use for the prometheus-operator managed k8s resources
*/}}
{{- define "prometheus-operator.apiVersion" -}}
{{- default "monitoring.coreos.com/v1" (.Values.apiGroup | printf "%s/v1") -}}
{{- end -}}

{{/*
Return the appropriate apiGroup value to use for the prometheus-operator managed k8s resources
*/}}
{{- define "prometheus-operator.apiGroup" -}}
{{- $apiVersion := include "prometheus-operator.apiVersion" . -}}
{{- index (regexSplit "/" $apiVersion 2) 0 | printf "%s" -}}
{{- end -}}
