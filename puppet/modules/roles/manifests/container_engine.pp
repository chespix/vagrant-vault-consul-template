class roles::container_engine {
  contain ::profiles::service_discovery
  contain ::profiles::docker_engine

  $services = hiera_hash('consul::services')

  unless empty($services) {
    create_resources('::consul::service', $services)
  }

}
