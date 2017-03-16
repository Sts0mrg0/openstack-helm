{
    "admin_required": "role:admin",
    "cloud_admin": "role:admin and (token.is_admin_project:True or domain_id:default)",
    "service_role": "role:service",
    "service_or_admin": "rule:admin_required or rule:service_role",
    "owner": "user_id:%(user_id)s or user_id:%(target.token.user_id)s",
    "admin_or_owner": "(rule:admin_required and domain_id:%(target.token.user.domain.id)s) or rule:owner",
    "admin_and_matching_domain_id": "rule:admin_required and domain_id:%(domain_id)s",
    "service_admin_or_owner": "rule:service_or_admin or rule:owner",
    "cloud_admin_or_owner": "rule:cloud_admin or rule:owner",

    "default": "rule:admin_required",

    "identity:get_region": "",
    "identity:list_regions": "",
    "identity:create_region": "rule:cloud_admin",
    "identity:update_region": "rule:cloud_admin",
    "identity:delete_region": "rule:cloud_admin",

    "identity:get_service": "rule:admin_required",
    "identity:list_services": "rule:admin_required",
    "identity:create_service": "rule:cloud_admin",
    "identity:update_service": "rule:cloud_admin",
    "identity:delete_service": "rule:cloud_admin",

    "identity:get_endpoint": "rule:admin_required",
    "identity:list_endpoints": "rule:admin_required",
    "identity:create_endpoint": "rule:cloud_admin",
    "identity:update_endpoint": "rule:cloud_admin",
    "identity:delete_endpoint": "rule:cloud_admin",

    "identity:get_domain": "rule:cloud_admin or rule:admin_and_matching_domain_id",
    "identity:list_domains": "rule:cloud_admin or rule:service_role",
    "identity:create_domain": "rule:cloud_admin",
    "identity:update_domain": "rule:cloud_admin",
    "identity:delete_domain": "rule:cloud_admin",

    "admin_and_matching_target_project_domain_id": "rule:admin_required and domain_id:%(target.project.domain_id)s",
    "admin_and_matching_project_domain_id": "rule:admin_required and domain_id:%(project.domain_id)s",
    "identity:get_project": "rule:cloud_admin or rule:admin_and_matching_target_project_domain_id or project_id:%(target.project.id)s or rule:service_role",
    "identity:list_projects": "rule:cloud_admin or rule:admin_and_matching_domain_id or rule:service_role",
    "identity:list_user_projects": "rule:owner or rule:admin_and_matching_domain_id",
    "identity:create_project": "rule:cloud_admin or rule:admin_and_matching_project_domain_id",
    "identity:update_project": "rule:cloud_admin or rule:admin_and_matching_target_project_domain_id",
    "identity:delete_project": "rule:cloud_admin or rule:admin_and_matching_target_project_domain_id",

    "admin_and_matching_target_user_domain_id": "rule:admin_required and domain_id:%(target.user.domain_id)s",
    "admin_and_matching_user_domain_id": "rule:admin_required and domain_id:%(user.domain_id)s",
    "identity:get_user": "rule:cloud_admin or rule:admin_and_matching_target_user_domain_id or rule:service_role",
    "identity:list_users": "rule:cloud_admin or rule:admin_and_matching_domain_id or rule:service_role",
    "identity:create_user": "rule:cloud_admin or rule:admin_and_matching_user_domain_id",
    "identity:update_user": "rule:cloud_admin or rule:admin_and_matching_target_user_domain_id",
    "identity:delete_user": "rule:cloud_admin or rule:admin_and_matching_target_user_domain_id",

    "admin_and_matching_target_group_domain_id": "rule:admin_required and domain_id:%(target.group.domain_id)s",
    "admin_and_matching_group_domain_id": "rule:admin_required and domain_id:%(group.domain_id)s",
    "identity:get_group": "rule:cloud_admin or rule:admin_and_matching_target_group_domain_id or rule:service_role",
    "identity:list_groups": "rule:cloud_admin or rule:admin_and_matching_domain_id or rule:service_role",
    "identity:list_groups_for_user": "rule:cloud_admin or rule:owner or rule:admin_and_matching_target_user_domain_id or rule:service_role",
    "identity:create_group": "rule:cloud_admin or rule:admin_and_matching_group_domain_id",
    "identity:update_group": "rule:cloud_admin or rule:admin_and_matching_target_group_domain_id",
    "identity:delete_group": "rule:cloud_admin or rule:admin_and_matching_target_group_domain_id",
    "identity:list_users_in_group": "rule:cloud_admin or rule:admin_and_matching_target_group_domain_id or rule:service_role",
    "identity:remove_user_from_group": "rule:cloud_admin or rule:admin_and_matching_target_group_domain_id",
    "identity:check_user_in_group": "rule:cloud_admin or rule:admin_and_matching_target_group_domain_id",
    "identity:add_user_to_group": "rule:cloud_admin or rule:admin_and_matching_target_group_domain_id",

    "identity:get_credential": "rule:admin_required",
    "identity:list_credentials": "rule:admin_required or user_id:%(user_id)s",
    "identity:create_credential": "rule:admin_required",
    "identity:update_credential": "rule:admin_required",
    "identity:delete_credential": "rule:admin_required",

    "identity:ec2_get_credential": "rule:admin_required or (rule:owner and user_id:%(target.credential.user_id)s)",
    "identity:ec2_list_credentials": "rule:admin_required or rule:owner",
    "identity:ec2_create_credential": "rule:admin_required or rule:owner",
    "identity:ec2_delete_credential": "rule:admin_required or (rule:owner and user_id:%(target.credential.user_id)s)",

    "identity:get_role": "rule:admin_required",
    "identity:list_roles": "rule:admin_required or rule:service_role",
    "identity:create_role": "rule:cloud_admin",
    "identity:update_role": "rule:cloud_admin",
    "identity:delete_role": "rule:cloud_admin",

    "identity:get_domain_role": "rule:cloud_admin or rule:get_domain_roles",
    "identity:list_domain_roles": "rule:cloud_admin or rule:list_domain_roles or rule:service_role",
    "identity:create_domain_role": "rule:cloud_admin or rule:domain_admin_matches_domain_role",
    "identity:update_domain_role": "rule:cloud_admin or rule:domain_admin_matches_target_domain_role",
    "identity:delete_domain_role": "rule:cloud_admin or rule:domain_admin_matches_target_domain_role",
    "domain_admin_matches_domain_role": "rule:admin_required and domain_id:%(role.domain_id)s",
    "get_domain_roles": "rule:domain_admin_matches_target_domain_role or rule:project_admin_matches_target_domain_role",
    "domain_admin_matches_target_domain_role": "rule:admin_required and domain_id:%(target.role.domain_id)s",
    "project_admin_matches_target_domain_role": "rule:admin_required and project_domain_id:%(target.role.domain_id)s",
    "list_domain_roles": "rule:domain_admin_matches_filter_on_list_domain_roles or rule:project_admin_matches_filter_on_list_domain_roles",
    "domain_admin_matches_filter_on_list_domain_roles": "rule:admin_required and domain_id:%(domain_id)s",
    "project_admin_matches_filter_on_list_domain_roles": "rule:admin_required and project_domain_id:%(domain_id)s",

    "identity:get_implied_role": "rule:cloud_admin",
    "identity:list_implied_roles": "rule:cloud_admin",
    "identity:create_implied_role": "rule:cloud_admin",
    "identity:delete_implied_role": "rule:cloud_admin",
    "identity:list_role_inference_rules": "rule:cloud_admin",
    "identity:check_implied_role": "rule:cloud_admin",

    "blacklist_roles": "'cloud_resource_admin':%(target.role.name)s or 'cloud_network_admin':%(target.role.name)s or 'cloud_dns_admin':%(target.role.name)s or 'dns_admin':%(target.role.name)s or 'cloud_image_admin':%(target.role.name)s or 'cloud_compute_admin':%(target.role.name)s or 'cloud_keymanager_admin':%(target.role.name)s or 'cloud_volume_admin':%(target.role.name)s or 'sharedfilesystem_admin':%(target.role.name)s or 'cloud_sharedfilesystem_admin':%(target.role.name)s or 'swiftreseller':%(target.role.name)s or 'service':%(target.role.name)s",
    "blacklist_projects": "'{{.Values.cloud_admin_project}}':%(target.project.id)s",
    "identity:check_grant": "rule:cloud_admin or rule:domain_admin_for_grants or rule:project_admin_for_grants",
    "identity:list_grants": "rule:cloud_admin or rule:domain_admin_for_list_grants or rule:project_admin_for_list_grants",
    "identity:create_grant": "rule:cloud_admin or rule:domain_admin_for_grants or rule:project_admin_for_grants",
    "identity:revoke_grant": "rule:cloud_admin or rule:domain_admin_for_grants or rule:project_admin_for_grants",
    "domain_admin_for_grants": "(rule:domain_admin_for_global_role_grants or rule:domain_admin_for_domain_role_grants) and not rule:blacklist_roles and not rule:blacklist_projects",
    "domain_admin_for_global_role_grants": "rule:admin_required and None:%(target.role.domain_id)s and rule:domain_admin_grant_match",
    "domain_admin_for_domain_role_grants": "rule:admin_required and domain_id:%(target.role.domain_id)s and rule:domain_admin_grant_match",
    "domain_admin_grant_match": "domain_id:%(domain_id)s or domain_id:%(target.project.domain_id)s",
    "project_admin_for_grants": "(rule:project_admin_for_global_role_grants or rule:project_admin_for_domain_role_grants) and not rule:blacklist_roles and not rule:blacklist_projects",
    "project_admin_for_global_role_grants": "rule:admin_required and None:%(target.role.domain_id)s and project_id:%(project_id)s",
    "project_admin_for_domain_role_grants": "rule:admin_required and project_domain_id:%(target.role.domain_id)s and project_id:%(project_id)s",
    "domain_admin_for_list_grants": "rule:admin_required and rule:domain_admin_grant_match",
    "project_admin_for_list_grants": "rule:admin_required and project_id:%(project_id)s",

    "admin_on_domain_filter": "rule:admin_required and domain_id:%(scope.domain.id)s",
    "admin_on_project_filter": "rule:admin_required and project_id:%(scope.project.id)s",
    "admin_on_domain_of_project_filter": "rule:admin_required and domain_id:%(target.project.domain_id)s",
    "identity:list_role_assignments": "rule:cloud_admin or rule:admin_on_domain_filter or rule:admin_on_project_filter or rule:service_role",
    "identity:list_role_assignments_for_tree": "rule:cloud_admin or rule:admin_on_domain_of_project_filter",
    "identity:get_policy": "rule:cloud_admin",
    "identity:list_policies": "rule:cloud_admin",
    "identity:create_policy": "rule:cloud_admin",
    "identity:update_policy": "rule:cloud_admin",
    "identity:delete_policy": "rule:cloud_admin",

    "identity:change_password": "rule:cloud_admin_or_owner",
    "identity:check_token": "rule:admin_or_owner",
    "identity:validate_token": "rule:service_admin_or_owner",
    "identity:validate_token_head": "rule:service_or_admin",
    "identity:revocation_list": "rule:service_or_admin",
    "identity:revoke_token": "rule:admin_or_owner",

    "identity:create_trust": "user_id:%(trust.trustor_user_id)s",
    "identity:list_trusts": "",
    "identity:list_roles_for_trust": "",
    "identity:get_role_for_trust": "",
    "identity:delete_trust": "",

    "identity:create_consumer": "rule:admin_required",
    "identity:get_consumer": "rule:admin_required",
    "identity:list_consumers": "rule:admin_required",
    "identity:delete_consumer": "rule:admin_required",
    "identity:update_consumer": "rule:admin_required",

    "identity:authorize_request_token": "rule:admin_required",
    "identity:list_access_token_roles": "rule:admin_required",
    "identity:get_access_token_role": "rule:admin_required",
    "identity:list_access_tokens": "rule:admin_required",
    "identity:get_access_token": "rule:admin_required",
    "identity:delete_access_token": "rule:admin_required",

    "identity:list_projects_for_endpoint": "rule:admin_required",
    "identity:add_endpoint_to_project": "rule:admin_required",
    "identity:check_endpoint_in_project": "rule:admin_required",
    "identity:list_endpoints_for_project": "rule:admin_required",
    "identity:remove_endpoint_from_project": "rule:admin_required",

    "identity:create_endpoint_group": "rule:admin_required",
    "identity:list_endpoint_groups": "rule:admin_required",
    "identity:get_endpoint_group": "rule:admin_required",
    "identity:update_endpoint_group": "rule:admin_required",
    "identity:delete_endpoint_group": "rule:admin_required",
    "identity:list_projects_associated_with_endpoint_group": "rule:admin_required",
    "identity:list_endpoints_associated_with_endpoint_group": "rule:admin_required",
    "identity:get_endpoint_group_in_project": "rule:admin_required",
    "identity:list_endpoint_groups_for_project": "rule:admin_required",
    "identity:add_endpoint_group_to_project": "rule:admin_required",
    "identity:remove_endpoint_group_from_project": "rule:admin_required",

    "identity:create_identity_provider": "rule:cloud_admin",
    "identity:list_identity_providers": "rule:cloud_admin",
    "identity:get_identity_providers": "rule:cloud_admin",
    "identity:update_identity_provider": "rule:cloud_admin",
    "identity:delete_identity_provider": "rule:cloud_admin",

    "identity:create_protocol": "rule:cloud_admin",
    "identity:update_protocol": "rule:cloud_admin",
    "identity:get_protocol": "rule:cloud_admin",
    "identity:list_protocols": "rule:cloud_admin",
    "identity:delete_protocol": "rule:cloud_admin",

    "identity:create_mapping": "rule:cloud_admin",
    "identity:get_mapping": "rule:cloud_admin",
    "identity:list_mappings": "rule:cloud_admin",
    "identity:delete_mapping": "rule:cloud_admin",
    "identity:update_mapping": "rule:cloud_admin",

    "identity:create_service_provider": "rule:cloud_admin",
    "identity:list_service_providers": "rule:cloud_admin",
    "identity:get_service_provider": "rule:cloud_admin",
    "identity:update_service_provider": "rule:cloud_admin",
    "identity:delete_service_provider": "rule:cloud_admin",

    "identity:get_auth_catalog": "",
    "identity:get_auth_projects": "",
    "identity:get_auth_domains": "",

    "identity:list_projects_for_groups": "",
    "identity:list_domains_for_groups": "",

    "identity:list_revoke_events": "",

    "identity:create_policy_association_for_endpoint": "rule:cloud_admin",
    "identity:check_policy_association_for_endpoint": "rule:cloud_admin",
    "identity:delete_policy_association_for_endpoint": "rule:cloud_admin",
    "identity:create_policy_association_for_service": "rule:cloud_admin",
    "identity:check_policy_association_for_service": "rule:cloud_admin",
    "identity:delete_policy_association_for_service": "rule:cloud_admin",
    "identity:create_policy_association_for_region_and_service": "rule:cloud_admin",
    "identity:check_policy_association_for_region_and_service": "rule:cloud_admin",
    "identity:delete_policy_association_for_region_and_service": "rule:cloud_admin",
    "identity:get_policy_for_endpoint": "rule:cloud_admin",
    "identity:list_endpoints_for_policy": "rule:cloud_admin",

    "identity:create_domain_config": "rule:cloud_admin",
    "identity:get_domain_config": "rule:cloud_admin",
    "identity:update_domain_config": "rule:cloud_admin",
    "identity:delete_domain_config": "rule:cloud_admin",
    "identity:get_domain_config_default": "rule:cloud_admin"
}
