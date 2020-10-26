# azure-arc-multi-cluster
Azure Arc Multi Customer, Multi Cluster with multi apps

> k8s cluster: **mansfieldarcaks**
> rg: **mansfield**
> acr: **mansfieldacr.azurecr.io**

## Gitops /w Helm + app repo  (https://github.com/joalmeid/azure-arc-multi-cluster branch:helm-kustomize)

az k8sconfiguration create --name mansfieldarcaks-config --cluster-name mansfieldarcaks --resource-group mansfield --operator-instance-name shs-helmk-cluster-config --operator-namespace azure-helmk-voting --operator-params='--git-readonly --git-path=clusters/cxname-edgename --git-branch helm-kustomize' --enable-helm-operator --helm-operator-version='0.6.0' --helm-operator-params='--set helm.versions=v3' --repository-url https://github.com/joalmeid/azure-arc-multi-cluster --scope cluster --cluster-type connectedClusters --debug

az k8sconfiguration show --name mansfieldarcaks-config --cluster-name mansfieldarcaks --resource-group mansfield --cluster-type connectedClusters

kubectl get ns --show-labels
kubectl -n azure-voting get deploy  -o wide

kubectl wait --for=condition=released helmrelease/azure-voting -n azure-helmk-voting
kubectl describe helmrelease azure-voting

kubectl port-forward -n azure-helmk-voting svc/azure-voting-frontend 8080:80

az k8sconfiguration delete --name mansfieldarcaks-config  --cluster-name mansfieldarcaks --resource-group mansfield --cluster-type connectedClusters --yes
