helm repo add bitnami https://charts.bitnami.com/bitnami
helm install my-release bitnami/redis

# Test purpose
kubectl port-forward redis-cluster-0 7000:6379

# Si besoin de plus costaud
# https://rancher.com/blog/2019/deploying-redis-cluster
