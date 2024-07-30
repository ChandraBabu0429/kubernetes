kubectl apply -f airflow-namespace.yaml

kubectl create secret tls itversity-tls \
    --cert=certs/itversity_ssl_chained.crt \
    --key=certs/itversity_ssl.key \
    --namespace=airflow

kubectl apply -f airflow-postgres-pvc.yaml
kubectl apply -f airflow-postgres-secret.yaml
kubectl apply -f airflow-postgres-deployment.yaml
kubectl apply -f airflow-postgres-service.yaml
kubectl apply -f airflow-db-init-job.yaml
kubectl apply -f airflow-redis-deployment.yaml
kubectl apply -f airflow-redis-service.yaml
kubectl apply -f airflow-webserver-deployment.yaml
kubectl apply -f airflow-webserver-service.yaml
kubectl apply -f airflow-scheduler-deployment.yaml
kubectl apply -f airflow-ingress.yaml

# Monitoring commands
kubectl get pods -n airflow

# Delete commands
kubectl delete -f airflow-ingress.yaml
kubectl delete -f airflow-scheduler-deployment.yaml
kubectl delete -f airflow-webserver-service.yaml
kubectl delete -f airflow-webserver-deployment.yaml
kubectl delete -f airflow-redis-service.yaml
kubectl delete -f airflow-redis-deployment.yaml
kubectl delete -f airflow-db-init-job.yaml
kubectl delete -f airflow-postgres-service.yaml
kubectl delete -f airflow-postgres-deployment.yaml
kubectl delete -f airflow-postgres-secret.yaml
kubectl delete -f airflow-postgres-pvc.yaml
kubectl delete -f airflow-namespace.yaml
