output "admin_ssh_private" {
  value = "${tls_private_key.admin_ssh.private_key_pem}"
}

output "admin_ssh_public" {
  value = "${tls_private_key.admin_ssh.public_key_pem}"
}

output "dev_ssh_private" {
  value = "${tls_private_key.dev_ssh.private_key_pem}"
}

output "dev_ssh_public" {
  value = "${tls_private_key.dev_ssh.public_key_pem}"
}

output "prod_ssh_private" {
  value = "${tls_private_key.prod_ssh.private_key_pem}"
}

output "prod_ssh_public" {
  value = "${tls_private_key.prod_ssh.public_key_pem}"
}
