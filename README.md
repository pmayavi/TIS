 - Ver info de Pods
```
kubectl get po
kubectl get pvc
```

 - Escalar, mas replicas
 ```
kubectl scale sts mongodb --replicas=4
```

 - Eliminar un pod
 ```
kubectl delete po mongodb-0
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
db.test.deleteOne({ name:"master pod" })
db.test.find()
exit
```

[Demostracion del funcionamiento](https://youtu.be/9xfggCAFM_k?si=_1aq2S_Rew7ys1K0)