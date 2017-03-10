
# ssh keypair
resource "tls_private_key" "admin_ssh" {
  algorithm = "RSA"
}

# Export admin ssh key to file
resource "null_resource" "admin_private" {
  depends_on = ["tls_private_key.admin_ssh"]

  provisioner "local-exec" {
    command = "echo '${tls_private_key.admin_ssh.private_key_pem}' > ${var.allspark_ssh_dir}/allspark_admin_rsa && chmod 600 ${var.allspark_ssh_dir}/allspark_admin_rsa"
  }
}

resource "null_resource" "admin_public" {
  depends_on = ["tls_private_key.admin_ssh"]

  provisioner "local-exec" {
    command = "echo '${tls_private_key.admin_ssh.public_key_pem}' > ${var.allspark_ssh_dir}/allspark_admin_rsa.pub && chmod 600 ${var.allspark_ssh_dir}/allspark_admin_rsa.pub"
  }
}


resource "tls_private_key" "dev_ssh" {
  algorithm = "RSA"
}

resource "null_resource" "dev_private" {
  depends_on = ["tls_private_key.dev_ssh"]

  provisioner "local-exec" {
    command = "echo '${tls_private_key.dev_ssh.private_key_pem}' > ${var.allspark_ssh_dir}/allspark_dev_rsa && chmod 600 ${var.allspark_ssh_dir}/allspark_dev_rsa"
  }
}

resource "null_resource" "dev_public" {
  depends_on = ["tls_private_key.dev_ssh"]

  provisioner "local-exec" {
    command = "echo '${tls_private_key.dev_ssh.public_key_pem}' > ${var.allspark_ssh_dir}/allspark_dev_rsa.pub && chmod 600 ${var.allspark_ssh_dir}/allspark_dev_rsa.pub"
  }
}

resource "tls_private_key" "prod_ssh" {
  algorithm = "RSA"
}

resource "null_resource" "prod_private" {
  depends_on = ["tls_private_key.prod_ssh"]

  provisioner "local-exec" {
    command = "echo '${tls_private_key.prod_ssh.private_key_pem}' > ${var.allspark_ssh_dir}/allspark_prod_rsa && chmod 600 ${var.allspark_ssh_dir}/allspark_prod_rsa"
  }
}

resource "null_resource" "prod_public" {
  depends_on = ["tls_private_key.prod_ssh"]

  provisioner "local-exec" {
    command = "echo '${tls_private_key.prod_ssh.public_key_pem}' > ${var.allspark_ssh_dir}/allspark_prod_rsa.pub && chmod 600 ${var.allspark_ssh_dir}/allspark_prod_rsa.pub"
  }
}
