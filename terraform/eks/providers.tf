provider "rancher2" {
  api_url    = "https://rancher.k3s.gaocho.wescale.fr/v3"
  access_key = "token-7zg8v"
  secret_key = "2tt9hcqgkwzb9jsh95b85xh9dnxgxjc9l72xzrv2strzbfwwlnrdwl"
}

provider "aws" {
  region = "eu-west-1"
}

