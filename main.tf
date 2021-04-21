resource "local_file" "kubeconfig" {
  content  = templatefile("${path.module}/kubeconfig-template.tpl", { contexts = var.contexts, clusters = var.clusters, users = var.users, colors = var.colors, current_context = var.current_context })
  filename = "./${var.filename}"
}