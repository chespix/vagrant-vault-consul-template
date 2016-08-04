class profiles::service_discovery(
  $config = {},
) {
  contain ::dnsmasq
  contain ::resolv_conf

  package {'unzip':
    ensure => present
  }

  if empty($config) {
    include ::consul
  }
  else {
    class { '::consul':
      config_hash => $config,
    }
  }

  Class['::dnsmasq'] -> Class['::resolv_conf']

  Package['unzip'] -> Class['::consul']
}
