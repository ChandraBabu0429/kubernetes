kubectl apply -f superset-namespace.yaml

# If you have existing SSL certificates use the following command to create secret
kubectl create secret tls itversity-tls \
    --cert=certs/itversity_ssl_chained.crt \
    --key=certs/itversity_ssl.key \
    --namespace=superset

kubectl apply -f superset-postgres-pvc.yaml
kubectl apply -f superset-postgres-secret.yaml
kubectl apply -f superset-postgres-deployment.yaml
kubectl apply -f superset-postgres-service.yaml
kubectl create configmap superset-config --from-file=superset_config.py -n superset
kubectl apply -f superset-deployment.yaml
kubectl apply -f superset-service.yaml
kubectl apply -f superset-ingress.yaml

kubectl delete -f superset-ingress.yaml
kubectl delete -f superset-service.yaml
kubectl delete -f superset-deployment.yaml
kubectl delete configmap superset-config -n superset
kubectl delete -f superset-postgres-service.yaml
kubectl delete -f superset-postgres-deployment.yaml
kubectl delete -f superset-postgres-secret.yaml
kubectl delete -f superset-postgres-pvc.yaml
kubectl delete -f superset-namespace.yaml

kubectl delete -f superset-ingress.yaml
kubectl delete -f superset-service.yaml
kubectl delete -f superset-deployment.yaml
kubectl delete configmap superset-config -n superset

kubectl create configmap superset-config --from-file=superset_config.py -n superset
kubectl apply -f superset-deployment.yaml
kubectl apply -f superset-service.yaml
kubectl apply -f superset-ingress.yaml