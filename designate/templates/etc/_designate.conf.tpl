[DEFAULT]
# Where an option is commented out, but filled in this shows the default
# value of that option

########################
## General Configuration
########################
# Show more verbose log output (sets INFO log level output)
verbose = True

# Show debugging output in logs (sets DEBUG log level output)
debug = {{ .Values.debug }}

# Top-level directory for maintaining designate's state
state_path = /var/lib/designate

log_config_append = /etc/designate/logging.conf

# Driver used for issuing notifications
notification_driver = messaging

# Notification Topics
notification_topics = notifications

# Use "sudo designate-rootwrap /etc/designate/rootwrap.conf" to use the real
# root filter facility.
# Change to "sudo" to skip the filtering and just run the command directly
#root_helper = sudo designate-rootwrap /etc/designate/rootwrap.conf

# Which networking API to use, Defaults to neutron
#network_api = neutron

# Supported record types
#supported_record_type = A, AAAA, CNAME, MX, SRV, TXT, SPF, NS, PTR, SSHFP, SOA

# Setting SOA defaults
default-soa-refresh-min = 3500
default-soa-refresh-max = 3600
default-soa-retry = 600
default-soa-expire = 3600000
default-soa-minimum = 300

# Setting default quotas
quota_zones = 0
quota_zone_recordsets = 400
quota_zone_records = 350
quota_recordset_records = 20
quota_api_export_size = 1000

rpc_response_timeout = {{ .Values.rpc_response_timeout | default .Values.global.rpc_response_timeout | default 300 }}
rpc_workers = {{ .Values.rpc_workers | default .Values.global.rpc_workers | default 1 }}


#-----------------------
# RabbitMQ Config
#-----------------------
[oslo_messaging_rabbit]
rabbit_userid = {{ .Values.global.rabbitmq_default_user }}
rabbit_password = {{ .Values.global.rabbitmq_default_pass }}
#rabbit_virtual_host = /
#rabbit_use_ssl = False
rabbit_hosts = {{ include "rabbitmq_host" . }}

########################
## Service Configuration
########################
#-----------------------
# Central Service
#-----------------------
[service:central]
# Number of central worker processes to spawn
#workers = None

# Number of central greenthreads to spawn
#threads = 1000

# Maximum domain name length
#max_domain_name_len = 255

# Maximum recordset name length
#max_recordset_name_len = 255

# Minimum TTL
#min_ttl = None

# The name of the default pool
default_pool_id = '794ccc2c-d751-44fe-b57f-8894c9f5c842'

## Managed resources settings

# Email to use for managed resources like domains created by the FloatingIP API
#managed_resource_email = hostmaster@example.com.

# Tenant ID to own all managed resources - like auto-created records etc.
#managed_resource_tenant_id = 123456

# What filters to use. They are applied in order listed in the option, from
# left to right
scheduler_filters = {{ .Values.scheduler_filters }}

#-----------------------
# API Service
#-----------------------
[service:api]
# Number of api worker processes to spawn
#workers = None

# Number of api greenthreads to spawn
#threads = 1000

# Enable host request headers
#enable_host_header = False

# The base uri used in responses
api_base_uri = https://{{ include "designate_api_endpoint_host_public" .}}:{{.Values.global.designate_api_port_public}}

# Address to bind the API server
api_host = 0.0.0.0

# Port the bind the API server to
api_port = {{.Values.global.designate_api_port_internal}}

# Maximum line size of message headers to be accepted. max_header_line may
# need to be increased when using large tokens (typically those generated by
# the Keystone v3 API with big service catalogs).
#max_header_line = 16384

# Authentication strategy to use - can be either "noauth" or "keystone"
auth_strategy = keystone

# Enable Version 1 API (deprecated)
enable_api_v1 = True

# Enabled API Version 1 extensions
# Can be one or more of : diagnostics, quotas, reports, sync, touch
enabled_extensions_v1 = diagnostics, quotas, reports, sync, touch

# Enable Version 2 API
enable_api_v2 = True

# Enabled API Version 2 extensions
enabled_extensions_v2 = quotas, reports

# Default per-page limit for the V2 API, a value of None means show all results
# by default
#default_limit_v2 = 20

# Max page size in the V2 API
#max_limit_v2 = 1000

# Enable Admin API (experimental)
#enable_api_admin = True

# Enabled Admin API extensions
# Can be one or more of : reports, quotas, counts, tenants, target_sync
# zone export is in zones extension
#enabled_extensions_admin = quotas

# Default per-page limit for the Admin API, a value of None means show all results
# by default
#default_limit_admin = 20

# Max page size in the Admin API
#max_limit_admin = 1000

# Show the pecan HTML based debug interface (v2 only)
# This is only useful for development, and WILL break python-designateclient
# if an error occurs
#pecan_debug = False

#-----------------------
# Keystone Middleware
#-----------------------
[keystone_authtoken]
auth_uri = {{.Values.global.keystone_api_endpoint_protocol_internal}}://{{include "keystone_api_endpoint_host_internal" .}}:{{ .Values.global.keystone_api_port_internal }}
auth_url = {{.Values.global.keystone_api_endpoint_protocol_admin}}://{{include "keystone_api_endpoint_host_admin" .}}:{{ .Values.global.keystone_api_port_admin }}/v3
username = {{ .Values.global.designate_service_user }}
password = {{ .Values.global.designate_service_password }}
user_domain_name = {{.Values.global.keystone_service_domain}} 
project_name = {{.Values.global.keystone_service_project}} 
project_domain_name = {{.Values.global.keystone_service_domain}}
memcache_servers = {{ include "memcached_host" . }}:{{.Values.global.memcached_port_public}}
auth_type = v3password
insecure = True

#-----------------------

# CORS Middleware
#-----------------------
[cors]

# Indicate whether this resource may be shared with the domain received in the
# requests "origin" header. (list value)
#allowed_origin = <None>

# Indicate that the actual request can include user credentials (boolean value)
#allow_credentials = true

# Indicate which headers are safe to expose to the API. Defaults to HTTP Simple
# Headers. (list value)
#expose_headers = X-OpenStack-Request-ID,Host

# Maximum cache age of CORS preflight requests. (integer value)
#max_age = 3600

# Indicate which methods can be used during the actual request. (list value)
#allow_methods = GET,PUT,POST,DELETE,PATCH,HEAD

# Indicate which header field names may be used during the actual request.
# (list value)
#allow_headers = X-Auth-Token,X-Auth-Sudo-Tenant-ID,X-Auth-Sudo-Project-ID,X-Auth-All-Projects,X-Designate-Edit-Managed-Records

[cors.subdomain]

# Indicate whether this resource may be shared with the domain received in the
# requests "origin" header. (list value)
#allowed_origin = <None>

# Indicate that the actual request can include user credentials (boolean value)
#allow_credentials = true

# Indicate which headers are safe to expose to the API. Defaults to HTTP Simple
# Headers. (list value)
#expose_headers = X-OpenStack-Request-ID,Host

# Maximum cache age of CORS preflight requests. (integer value)
#max_age = 3600

# Indicate which methods can be used during the actual request. (list value)
#allow_methods = GET,PUT,POST,DELETE,PATCH,HEAD

# Indicate which header field names may be used during the actual request.
# (list value)
#allow_headers = X-Auth-Token,X-Auth-Sudo-Tenant-ID,X-Auth-Sudo-Project-ID,X-Auth-All-Projects,X-Designate-Edit-Managed-Records

#-----------------------
# Sink Service
#-----------------------
[service:sink]
# List of notification handlers to enable, configuration of these needs to
# correspond to a [handler:my_driver] section below or else in the config
# Can be one or more of : nova_fixed, neutron_floatingip
#enabled_notification_handlers = nova_fixed, neutron_floatingip

#-----------------------
# mDNS Service
#-----------------------
[service:mdns]
# Number of mdns worker processes to spawn
#workers = None

# Number of mdns greenthreads to spawn
#threads = 1000

# mDNS Bind Host
host = 0.0.0.0

# mDNS Port Number
port = 5354

# mDNS TCP Backlog
#tcp_backlog = 100

# mDNS TCP Receive Timeout
#tcp_recv_timeout = 0.5

# Enforce all incoming queries (including AXFR) are TSIG signed
query_enforce_tsig = {{ .Values.query_enforce_tsig }}

# Send all traffic over TCP
#all_tcp = False

# Maximum message size to emit
#max_message_size = 65535

#-----------------------
# Agent Service
#-----------------------
[service:agent]
#workers = None
#host = 0.0.0.0
#port = 5358
#tcp_backlog = 100
#allow_notify = 127.0.0.1
#masters = 127.0.0.1:5354
#backend_driver = fake
#transfer_source = None
#notify_delay = 0

#-----------------------
# Zone Manager Service
#-----------------------
[service:zone_manager]
# Number of Zone Manager worker processes to spawn
#workers = None

# Number of Zone Manager greenthreads to spawn
#threads = 1000

# List of Zone Manager tasks to enable, a value of None will enable all tasks.
# Can be one or more of: periodic_exists
#enabled_tasks = None

# Whether to allow synchronous zone exports
#export_synchronous = True

#------------------------
# Deleted domains purging
#------------------------
[zone_manager_task:domain_purge]
# How frequently to purge deleted domains, in seconds
#interval = 3600  # 1h

# How many records to be deleted on each run
#batch_size = 100

# How old deleted records should be (deleted_at) to be purged, in seconds
#time_threshold = 604800  # 7 days

#------------------------
# Delayed zones NOTIFY
#------------------------
[zone_manager_task:delayed_notify]
# How frequently to scan for zones pending NOTIFY, in seconds
#interval = 5

# How many zones to receive NOTIFY on each run
#batch_size = 100

#-----------------------
# Pool Manager Service
#-----------------------
[service:pool_manager]
# Number of Pool Manager worker processes to spawn
#workers = None

# Number of Pool Manager greenthreads to spawn
#threads = 1000

# The ID of the pool managed by this instance of the Pool Manager
pool_id = 794ccc2c-d751-44fe-b57f-8894c9f5c842
#pool_id = 9c489bf4-9eac-4887-95a7-20fa483018b3

# The percentage of servers requiring a successful update for a domain change
# to be considered active
#threshold_percentage = 100

# The time to wait for a response from a server
#poll_timeout = 30

# The time between retrying to send a request and waiting for a response from a
# server
#poll_retry_interval = 15

# The maximum number of times to retry sending a request and wait for a
# response from a server
#poll_max_retries = 10

# The time to wait before sending the first request to a server
#poll_delay = 5

# Enable the recovery thread
#enable_recovery_timer = True

# The time between recovering from failures
#periodic_recovery_interval = 120

# Enable the sync thread
#enable_sync_timer = True

# The time between synchronizing the servers with storage
#periodic_sync_interval = 1800

# Zones Updated within last N seconds will be syncd. Use None to sync all zones
#periodic_sync_seconds = None

# Perform multiple update attempts during periodic_sync
#periodic_sync_max_attempts = 3
#periodic_sync_retry_interval = 30

# The cache driver to use
cache_driver = memcache

#-----------------------
# Worker Service
#-----------------------
[service:worker]
# Whether to send events to worker instead of Pool Manager
enabled = {{.Values.worker_enabled}}

# Number of Worker processes to spawn
#workers = None

# Number of Worker greenthreads to spawn
#threads = 1000

# The percentage of servers requiring a successful update for a zone change
# to be considered active
threshold_percentage =  {{ .Values.worker_threshold_percentage }}

# The time to wait for a response from a server
#poll_timeout = 30

# The time between retrying to send a request and waiting for a response from a
# server
#poll_retry_interval = 15

# The maximum number of times to retry sending a request and wait for a
# response from a server
#poll_max_retries = 10

# The time to wait before sending the first request to a server
#poll_delay = 5

# Whether to allow worker to send NOTIFYs. NOTIFY requests to mdns will noop
notify = {{ .Values.worker_notify }}

###################################
## Pool Manager Cache Configuration
###################################
#-----------------------
# SQLAlchemy Pool Manager Cache
#-----------------------
[pool_manager_cache:sqlalchemy]
connection = mysql://root:{{.Values.mariadb.root_password}}@{{include "designate_db_host" .}}/{{.Values.poolmanager.db_name}}
#connection_debug = 100
#connection_trace = False
#sqlite_synchronous = True
#idle_timeout = 3600
#max_retries = 10
#retry_interval = 10

#-----------------------
# Memcache Pool Manager Cache
#-----------------------
[pool_manager_cache:memcache]
#memcached_servers = None
#expiration = 3600

##############
## Network API
##############
[network_api:neutron]
# Comma separated list of values, formatted "<name>|<neutron_uri>"
#endpoints = RegionOne|http://localhost:9696
#endpoint_type = publicURL
#timeout = 30
#admin_username = designate
#admin_password = designate
#admin_tenant_name = designate
#auth_url = http://localhost:35357/v2.0
#insecure = False
#auth_strategy = keystone
#ca_certificates_file =

########################
## Storage Configuration
########################
#-----------------------
# SQLAlchemy Storage
#-----------------------
[storage:sqlalchemy]
# Database connection string - to configure options for a given implementation
# like sqlalchemy or other see below
#connection = sqlite:///$state_path/designate.sqlite
connection = mysql://root:{{.Values.mariadb.root_password}}@{{include "designate_db_host" .}}/{{.Values.db_name}}

#connection_debug = 0
#connection_trace = False
#sqlite_synchronous = True
#idle_timeout = 3600
#max_retries = 10
#retry_interval = 10

########################
## Handler Configuration
########################
#-----------------------
# Nova Fixed Handler
#-----------------------
[handler:nova_fixed]
# Domain ID of domain to create records in. Should be pre-created
#domain_id = c7deacad-7ce7-4c9f-bf6a-6203f702750d
#notification_topics = notifications_designate
#control_exchange = 'nova'
#format = '%(octet0)s-%(octet1)s-%(octet2)s-%(octet3)s.%(domain)s'
#format = '%(hostname)s.%(project)s.%(domain)s'
#format = '%(hostname)s.%(domain)s'

#------------------------
# Neutron Floating Handler
#------------------------
[handler:neutron_floatingip]
# Domain ID of domain to create records in. Should be pre-created
#domain_id = c7deacad-7ce7-4c9f-bf6a-6203f702750d
#notification_topics = notifications_designate
#control_exchange = 'neutron'
#format = '%(octet0)s-%(octet1)s-%(octet2)s-%(octet3)s.%(domain)s'
#format = '%(hostname)s.%(project)s.%(domain)s'
#format = '%(hostname)s.%(domain)s'

#############################
## Agent Backend Configuration
#############################
[backend:agent:bind9]
#rndc_host = 10.44.11.98
#rndc_port = 953
#rndc_config_file = /etc/rndc.conf
#rndc_key_file = /etc/rndc.key
#zone_file_path = $state_path/zones
#query_destination = 127.0.0.1
#
[backend:agent:denominator]
#name = dynect
#config_file = /etc/denominator.conf

########################
## Library Configuration
########################
[oslo_concurrency]
# Path for Oslo Concurrency to store lock files, defaults to the value
# of the state_path setting.
#lock_path = $state_path

########################
## Coordination
########################
[coordination]
# URL for the coordination backend to use.
#backend_url = kazoo://127.0.0.1/

########################
## Hook Points
########################
# Hook Points are enabled when added to the config and there has been
# a package that provides the corresponding named designate.hook_point
# entry point.

# [hook_point:name_of_hook_point]
# some_param_for_hook = 42
# Hooks can be disabled in the config
# enabled = False

# Hook can also be applied to the import path when the hook has not
# been given an explicit name. The name is created from the hook
# target function / method:
#
#   name = '%s.%s' % (func.__module__, func.__name__)

# [hook_point:designate.api.v2.controllers.zones.get_one]

