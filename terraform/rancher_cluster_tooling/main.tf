locals {
  cluster_name = var.cluster_name
}

data "rancher2_cluster" "target" {
  name = local.cluster_name
}

resource "rancher2_catalog_v2" "grafana" {
  cluster_id = data.rancher2_cluster.target.id
  name = "grafana"
  url = "https://grafana.github.io/helm-charts"
}

resource "rancher2_app_v2" "loki" {
  cluster_id = data.rancher2_cluster.target.id
  name = "loki"
  namespace = "cattle-logging-system"
  repo_name = "grafana"
  chart_name = "loki"
}

resource "rancher2_app_v2" "logging" {
  cluster_id = data.rancher2_cluster.target.id
  name = "rancher-logging"
  namespace = "cattle-logging-system"
  repo_name = "rancher-charts"
  chart_name = "rancher-logging"
  values = file("${abspath(path.root)}/logging.values.yml")
}

resource "rancher2_app_v2" "monitoring" {
  cluster_id = data.rancher2_cluster.target.id
  name = "rancher-monitoring"
  namespace = "cattle-monitoring-system"
  repo_name = "rancher-charts"
  chart_name = "rancher-monitoring"
  values = file("${abspath(path.root)}/monitoring.values.yml")
}