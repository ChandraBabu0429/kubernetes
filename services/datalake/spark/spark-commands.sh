kubectl apply -f spark-namespace.yml
kubectl apply -f metastore/spark-postgres-pvc.yaml
kubectl apply -f metastore/spark-postgres-secret.yaml
kubectl apply -f metastore/spark-postgres-deployment.yaml
kubectl apply -f metastore/spark-postgres-service.yaml
kubectl apply -f metastore/spark-hive-config.yaml
kubectl apply -f metastore/spark-metastore-init.yaml
kubectl apply -f metastore/spark-metastore-deployment.yaml
kubectl apply -f metastore/spark-metastore-service.yaml
kubectl apply -f spark-configmap.yaml
kubectl apply -f spark-master-deployment.yaml
kubectl apply -f spark-master-service.yaml
kubectl apply -f spark-worker-deployment.yaml
kubectl apply -f spark-worker-service.yaml

kubectl delete -f metastore/spark-metastore-service.yaml
kubectl delete -f metastore/spark-metastore-deployment.yaml
kubectl delete -f metastore/spark-metastore-init.yaml
kubectl delete -f metastore/spark-hive-config.yaml
kubectl delete -f metastore/spark-postgres-service.yaml
kubectl delete -f metastore/spark-postgres-deployment.yaml
kubectl delete -f metastore/spark-postgres-secret.yaml
kubectl delete -f metastore/spark-postgres-pvc.yaml
kubectl delete -f spark-worker-service.yaml
kubectl delete -f spark-worker-deployment.yaml
kubectl delete -f spark-master-service.yaml
kubectl delete -f spark-master-deployment.yaml
kubectl delete -f spark-namespace.yml
