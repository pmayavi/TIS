 - Ver info de Pods
```
kubectl get po
kubectl get pvc
```

 - Escalar, mas replicas
 ```
kubectl scale sts mongo --replicas=7
```

 - Eliminar un pod
 ```
kubectl delete po mongo-0
 ```

 - Poner los servicios
 ```
kubectl apply -f mongodb-statefulset.yaml
kubectl apply -f mongodb-svc.yaml
```

 - Correr MongoDB para editar y ver datos
 ```
kubectl run -it mongo-shell --image=mongo:4.0.17 --rm -- /bin/bash
mongo mongodb-0.mongodb
db.test.insert({ name:"master pod" })
db.test.find()
exit
```