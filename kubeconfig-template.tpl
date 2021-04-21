apiVersion: v1
kind: Config
preferences:
  colors: ${colors}
current-context: ${current_context}
clusters: 
%{ for cluster in clusters ~}
- cluster:
    %{~ if cluster.certificate_authority_data != null && cluster.insecure_skip_tls_verify != true ~}
    certificate-authority-data: ${cluster.certificate_authority_data}
    %{~ endif ~}
    %{~ if cluster.server != null ~}
    server: ${cluster.server}
    %{~ endif ~}
    %{~ if cluster.insecure_skip_tls_verify == true ~}
    insecure-skip-tls-verify: true
    %{~ endif ~}
  name: ${cluster.name}
%{~ endfor }
contexts: 
%{ for context in contexts ~}
- context:
    %{~ if context.cluster_name != null ~}
    cluster: ${context.cluster_name}
    %{~ endif ~}
    %{~ if context.namespace != null ~}
    namespace: ${context.namespace}
    %{~ endif ~}
    %{~ if context.user != null ~}
    user: ${context.user}
    %{~ endif ~}
  name: ${context.name}
%{~ endfor }
users: 
%{ for user in users ~}
- name: ${user.name}
  user:
    %{~ if user.username != null ~}
    username: ${user.username}
    %{~ endif ~}
    %{~ if user.password != null ~}
    password: ${user.password}
    %{~ endif ~}
    %{~ if user.token != null ~}
    token: ${user.token}
    %{~ endif ~}
    %{~ if user.client_certificate_data != null ~}
    client-certificate-data: ${user.client_certificate_data}
    %{~ endif ~}
    %{~ if user.client_key_data != null ~}
    client-key-data: ${user.client_key_data}
    %{~ endif ~}
%{~ endfor ~}