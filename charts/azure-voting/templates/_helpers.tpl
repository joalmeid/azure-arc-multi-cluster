{{/* vim: set filetype=mustache: */}}
{{/*
Frontend Values
*/}}
{{- define "app.frontend" -}}
{{ .Release.Name }}-frontend
{{- end -}}

{{/*
Frontend Values
*/}}
{{- define "app.backend" -}}
{{- .Release.Name -}}-backend
{{- end -}}

