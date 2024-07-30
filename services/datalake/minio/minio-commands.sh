kubectl apply -f minio-namespace.yaml
kubectl apply -f minio-tls-secret.yaml
kubectl apply -f minio-pvc.yaml
kubectl apply -f minio-console-secrets.yaml
kubectl apply -f minio-deployment.yaml
kubectl wait --for=condition=available --timeout=60s deployment/minio -n minio
kubectl apply -f minio-service.yaml
kubectl apply -f minio-ingress.yaml

# To clean up the minio deployment and minio service(Do not une unless you want to clean up the deployment)
kubectl delete -f minio-ingress.yaml
kubectl delete -f minio-service.yaml
kubectl delete -f minio-deployment.yaml
kubectl delete -f minio-console-secrets.yaml
kubectl delete -f minio-pvc.yaml
kubectl delete -f minio-tls-secret.yaml
kubectl delete -f minio-namespace.yaml
