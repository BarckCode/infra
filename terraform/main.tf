data "digitalocean_kubernetes_versions" "data_versions" {
    version_prefix = "1.19."
}

resource "digitalocean_kubernetes_cluster" "barckcode" {
    name = "barckcode"
    region = "fra1"
    auto_upgrade = true
    version = data.digitalocean_kubernetes_versions.data_versions.latest_version

    node_pool {
        name = "minions"
        size = "s-1vcpu-2gb"
        auto_scale = false
        node_count = 1
    }
}