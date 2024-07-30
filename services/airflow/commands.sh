kubectl apply -f namespace.yaml
kubectl apply -f postgres-pvc.yaml
kubectl create secret generic airflow-postgresql --from-literal=postgres-password='Itversity123' -n airflow
kubectl apply -f postgres-deployment.yaml
kubectl apply -f postgres-service.yaml
kubectl apply -f airflow-db-init-job.yaml
kubectl apply -f redis-deployment.yaml
kubectl apply -f redis-service.yaml
kubectl apply -f webserver-deployment.yaml
kubectl apply -f scheduler-deployment.yaml
kubectl apply -f webserver-service.yaml