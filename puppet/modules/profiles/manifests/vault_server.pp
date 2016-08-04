class profiles::vault_server {
  include ::vault

  class { '::profiles::service_discovery':
    config => {
      bootstrap_expect => 1,
      client_addr      => '0.0.0.0',
      data_dir         => '/opt/consul',
      datacenter       => 'dc1',
      log_level        => 'INFO',
      node_name        => $::hostname,
      server           => true,
      ui_dir           => '/opt/consul/ui',
    }
  }
}
