# kubectl

*Ejemplo de uso de kubectl con el config:*

`kubectl --kubeconfig="kubeconfig.yaml" get nodes`

*Uso guardando la config con CLI de Digital Ocean:*

`doctl kubernetes cluster kubeconfig save 1234567890`

> 1234567890 == Al token correspondiente.

---
### Terraform:

Hay que exportar la variable de entorno:
`TF_VAR_do_token=9876543210`

> 9876543210 == Al token correspondiente.

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
