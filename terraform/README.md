# kubectl

*Ejemplo de uso de kubectl con el config:*

`kubectl --kubeconfig=_"kubeconfig.yaml"_ get nodes`

*Uso guardando la config con CLI de Digital Ocean:*

`doctl kubernetes cluster kubeconfig save _1234567890_`

---
### Infraestructura:
- Instalar Ingress Nginx Controller:

```bash
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx

helm repo update

helm install ingress-nginx ingress-nginx/ingress-nginx
```

- Actualizar Ingress Nginx Controller:

```bash
helm upgrade nginx-ingress ingress-nginx/ingress-nginx
```
