
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
    command = "ssh-keygen -f ${path.cwd}${var.ssh_dir}/allspark.rsa -t rsa -N ''"
  }

}
