[DEFAULT]

# Scheduling
scheduler_driver_task_period = {{ .Values.scheduler.driver_task_period | default 60 }}
scheduler_host_manager = {{ if .Values.global.hypervisors_ironic }}nova.scheduler.ironic_host_manager.IronicHostManager{{ else }}nova.scheduler.host_manager.HostManager{{ end }}
scheduler_driver = {{ .Values.scheduler.driver | default "nova.scheduler.filter_scheduler.FilterScheduler" }}
scheduler_available_filters = {{ .Values.scheduler.available_filters | default "nova.scheduler.filters.all_filters" }}
scheduler_default_filters = {{ .Values.scheduler.default_filters}}
