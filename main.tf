resource "local_file" "kubeconfig" {
  sensitive_content = templatefile("${path.module}/kubeconfig-template.tpl", { contexts = var.contexts, clusters = var.clusters, users = var.users, colors = var.colors, current_context = var.current_context })
  filename          = "./${var.filename}"
}

output "kubeconfig_path" {
  value       = local_file.kubeconfig.filename
  description = "Path to the kubeconfig file"
}

output "kubeconfig_content" {
  value       = yamldecode(local_file.kubeconfig.sensitive_content)
  description = "HCL representation of kubeconfig file contents"
  sensitive   = true
}