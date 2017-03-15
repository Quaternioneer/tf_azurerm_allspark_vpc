
# ssh keypair
resource "tls_private_key" "admin_ssh" {
  algorithm = "RSA"
}

resource "tls_private_key" "prod_ssh" {
  algorithm = "RSA"
}

resource "tls_private_key" "dev_ssh" {
  algorithm = "RSA"
}

# Export admin ssh key to file
resource "null_resource" "ssh_key_gen_dir" {
  provisioner "local-exec" {
    command = "mkdir -p ${path.cwd}${var.allspark_ssh_dir}"
  }
}

resource "null_resource" "ssh_key_gen" {
  depends_on = ["null_resource.ssh_key_gen_dir"]

  provisioner "local-exec" {
    command = "mkdir -p ${path.cwd}${var.allspark_ssh_dir}"
  }

  provisioner "local-exec" {
    command = "echo '${tls_private_key.admin_ssh.private_key_pem}' > ${path.cwd}${var.allspark_ssh_dir}/allspark_admin_rsa && chmod 600 ${path.cwd}${var.allspark_ssh_dir}/allspark_admin_rsa"
  }

  provisioner "local-exec" {
    command = "echo '${tls_private_key.admin_ssh.public_key_pem}' > ${path.cwd}${var.allspark_ssh_dir}/allspark_admin_rsa.pub && chmod 600 ${path.cwd}${var.allspark_ssh_dir}/allspark_admin_rsa.pub"
  }

  provisioner "local-exec" {
    command = "chmod 600 ${path.cwd}${var.allspark_ssh_dir}/allspark_admin_rsa.pub"
  }

  provisioner "local-exec" {
    command = "echo '${tls_private_key.dev_ssh.private_key_pem}' > ${path.cwd}${var.allspark_ssh_dir}/allspark_dev_rsa && chmod 600 ${path.cwd}${var.allspark_ssh_dir}/allspark_dev_rsa"
  }

  provisioner "local-exec" {
    command = "echo '${tls_private_key.dev_ssh.public_key_pem}' > ${path.cwd}${var.allspark_ssh_dir}/allspark_dev_rsa.pub && chmod 600 ${path.cwd}${var.allspark_ssh_dir}/allspark_dev_rsa.pub"
  }

  provisioner "local-exec" {
    command = "echo '${tls_private_key.prod_ssh.private_key_pem}' > ${path.cwd}${var.allspark_ssh_dir}/allspark_prod_rsa && chmod 600 ${path.cwd}${var.allspark_ssh_dir}/allspark_prod_rsa"
  }

  provisioner "local-exec" {
    command = "echo '${tls_private_key.prod_ssh.public_key_pem}' > ${path.cwd}${var.allspark_ssh_dir}/allspark_prod_rsa.pub && chmod 600 ${path.cwd}${var.allspark_ssh_dir}/allspark_prod_rsa.pub"
  }
}
