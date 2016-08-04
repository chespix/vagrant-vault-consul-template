class roles::secrets_manager_server {
  contain ::profiles::vault_server

  $services = hiera_hash('consul::services')

  unless empty($services) {
    create_resources('::consul::service', $services)
  }

}
