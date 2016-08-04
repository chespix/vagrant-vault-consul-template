class profiles::docker_engine {
  include 'docker'

  vcsrepo { '/usr/lib/vault-ui':
  ensure   => present,
  provider => git,
  source   => 'git://github.com/nyxcharon/vault-ui.git',
  }

  docker::image { 'vault-ui':
    docker_dir => '/usr/lib/vault-ui'
  }

  docker::run { 'vault-ui':
  image   => 'vault-ui',
  ports   => ['3030', '8080'],
  expose  => ['3030', '8080'],
  env     => ['VAULT_HOST=vault-01.example.com', 'CONSUL_HOST=vault-01.example.com'],
}

}
