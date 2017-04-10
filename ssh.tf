
# ssh keypair
resource "tls_private_key" "ssh" {
  algorithm = "RSA"
}

# Export admin ssh key to file
resource "null_resource" "ssh_key_gen_dir" {
  provisioner "local-exec" {
    command = "mkdir -p ${path.cwd}${var.ssh_dir}"
  }
}

resource "null_resource" "ssh_key_gen" {
  depends_on = ["null_resource.ssh_key_gen_dir"]

  provisioner "local-exec" {
    command = "mkdir -p ${path.cwd}${var.ssh_dir}"
  }

  provisioner "local-exec" {
    command = "echo -n '${tls_private_key.ssh.private_key_pem}' > ${path.cwd}${var.ssh_dir}/allspark_rsa && chmod 600 ${path.cwd}${var.ssh_dir}/allspark_rsa"
  }

  provisioner "local-exec" {
    command = "echo -n '${tls_private_key.ssh.public_key_pem}' > ${path.cwd}${var.ssh_dir}/allspark_rsa.pub && chmod 600 ${path.cwd}${var.ssh_dir}/allspark_rsa.pub"
  }
}
