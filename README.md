# All Things Kubernetes

My References:
* [Working with kubeadm](https://kubernetes.io/docs/setup/independent/install-kubeadm/)
* [Ultimate Kubernetes Bootcamp](https://schoolofdevops.github.io/ultimate-kubernetes-bootcamp/)
* [Multi Node Kubernetes Cluster with Vagrant, VirtualBox and Kubeadm](https://medium.com/@wso2tech/multi-node-kubernetes-cluster-with-vagrant-virtualbox-and-kubeadm-9d3eaac28b98)
* [Kubernetes in Vagrant with kubeadm](https://medium.com/@lizrice/kubernetes-in-vagrant-with-kubeadm-21979ded6c63)
* [pod does not exist/could not find the requested resource](https://medium.com/@joatmon08/playing-with-kubeadm-in-vagrant-machines-part-2-bac431095706)
* [Nodeport VS ClusterIP VS LoadBalancer](https://medium.com/google-cloud/kubernetes-nodeport-vs-loadbalancer-vs-ingress-when-should-i-use-what-922f010849e0)
* [Using MetalLB for local workstation LB](https://metallb.universe.tf/)
* [Rancher QuickStart](https://rancher.com/docs/rancher/v2.x/en/quick-start-guide/deployment/quickstart-manual-setup/)

MetalLB Specific
```
kubectl apply -f https://raw.githubusercontent.com/google/metallb/v0.8.1/manifests/metallb.yaml
```
To utilize MetalLB for the config, ensure you deploy the Vagrantfile.PublicNetwork stack.

**Rancher Notes**
* Run on the rancher node
```
sudo docker run -d --restart=unless-stopped -p 80:80 -p 443:443 rancher/rancher
```
* Configure via rancher GUI and add custom cluster. Run docker command on kube node. Wait until cluster state is Active.

**Docker Shortcuts**

Delete failed builds:
```
$ docker rm $(docker ps -a -q -f status=exited)
$ docker images
$ docker rmi <imageID>
```

Build and push:
```
$ docker login -u <user>
$ docker build -t <user>/<image>:[version/latest]
$ docker push <user>/<image>:[version/latest]
```

Test your new image:
```
$ docker run -it -p <port_on_host>:<port_on_container> <user>/<image>:[version/latest] /bin/sh
```

Run your new image:
```
$ docker run -d -p <port_on_host>:<port_on_container> --name <somename> --rm <user>/<image>:[version/latest]
```

**Other Tips**
Watch out for ^M at the end of a line:
```
$ vi -f <filename>
$ vim -b <filename>
$ dos2unix <filename>
$ vi :e ++ff=dos, :set ff=unix
```
