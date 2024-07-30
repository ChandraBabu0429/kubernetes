kubectl create secret generic memberlist --from-literal=secretkey="$(openssl rand -base64 128)" -n metallb-system

#Use the following commands to setup metallb load balancer and do change config file(metallb-config) with appropriate addresses
kubectl apply -f metallb-native.yaml
kubectl apply -f metallb-config.yml
kubectl apply -f l2advertisement.yml
kubectl apply -f metallb-role.yml
kubectl apply -f metallb-rolebinding.yml


# To clean up the metallb service(Do not une unless you want to clean up the deployment)
kubectl delete -f metallb-rolebinding.yml
kubectl delete -f metallb-role.yml
kubectl delete -f l2advertisement.yml
kubectl delete -f metallb-config.yml
kubectl delete -f metallb-native.yaml

kubectl delete -f https://raw.githubusercontent.com/metallb/metallb/v0.13.10/config/manifests/metallb-native.yaml