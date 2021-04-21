resource "local_file" "kubeconfig" {
  content  = templatefile("${path.module}/kubeconfig-template.tpl", { contexts = var.contexts, clusters = var.clusters, users = var.users, colors = var.colors, current_context = var.current_context })
  filename = "./${var.filename}"
}

output "kubeconfig_path" {
  value = local_file.kubeconfig.filename
}

output "kubeconfig_content" {
  value = yamldecode(local_file.kubeconfig.content)
}