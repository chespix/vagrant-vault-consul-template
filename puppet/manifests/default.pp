node /vault-\d+/ {
  include ::roles::secrets_manager_server
}

node /engine-\d+/ {
  include ::roles::container_engine
}
