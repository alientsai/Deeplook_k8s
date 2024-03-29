# Deeplook_k8s

## What is this repository for ?
**Deeplook(Cityeyes) to Kubernetes.**

**Build paltform for Deeplook.**

## Deeplook Platform
![alt text](/Images/Deeplook_k8s.png "Deeplook Platform")

## Project Outline

- [Install](./Install/README.md)
  - [Kubernetes](./Install/Kubernetes.md)
  - [GPUforKubernetes](./Install/GPUforKubernetes.md)
  - [CifsPlugin](./Install/CifsPlugin.md)
  - [Helm](./Install/Helm.md)
- [Deploy](./Deploy/README.md)
  - [Database](./Deploy/Database/README.md)
      - cityeyes
      - paas
  - [DockerRegistry](./Deploy/DockerRegistry/README.md)
      - UI
  - [Engine](./Deploy/Engine/README.md)
      - merge
  - [gpuPod](./Deploy/gpuPod/README.md)
      - engine
          - classify
          - clustering
  - [Tomcat](./Deploy/Tomcat/README.md)
      - deeplook
      - paas
      - acl
  - [MapTileServer](./Deploy/MapTileServer/README.md)
  - [pgAdmin](./Deploy/pgAdmin/README.md)
  - [Rabbitmq](./Deploy/rabbitmq/README.md)
  - [Secret](./Deploy/Secret/README.md)
  - [Volume](./Deploy/Volume/README.md)
  - [InitialData](./Deploy/InitialData/README.md)
  - [EFK](./Deploy/EFK/README.md)
  - [nginx](./Deploy/nginx/README.md)
  - [Ingress](./Deploy/Ingress/README.md)
  - [Samba](./Deploy/Samba/README.md)

## Deeplook Network
![alt text](/Images/Cluster_network.png "Deeplook Network")

## Plaform services
|ServiceName|Type|container Port|Expose Port|Node label|namespaces|
|-|-|-|-|-|-|
|deeplook|ClusterIP|8080|N/A|`machine:storage`|`default`|
|paas|ClusterIP|8080|N/A|`machine:storage`|`default`|
|acl|ClusterIP|8080|N/A|`machine:storage`|`default`|
|map|ClusterIP|80|N/A|`machine:storage`|`default`|
|cityeyes-postgresql-expose|ClusterIP|5432|32006||`default`|
|paas-postgresql-expose|ClusterIP|5432|32005||`default`|
|acldb-expose|ClusterIP|3306|32004||`default`|
|cityeyes-postgresql|ClusterIP|5432|N/A|`machine:storage`|`default`|
|paas-postgresql|ClusterIP|5432|N/A|`machine:storage`|`default`|
|acldb|ClusterIP|3306|N/A|`machine:storage`|`default`|
|nginx|ClusterIP|80|N/A||`default`|
|mq-rabbitmq|ClusterIP|4369,5672,25672,15672|N/A||`default`|
|mq-rabbitmq-expose|NodePort|5672,15672|31072,31075||`default`|
|nfs-server|ClusterIP(10.100.95.27)|2049, 20048, 111|N/A|`machine:storage`|`default`|
|nfs-maven-server|ClusterIP(10.100.55.66)|2049, 20048, 111|N/A|`machine:storage`|`default`|
|engine-classify|N/A|N/A|N/A|`gpu:1080ti`, `machine:gpu`|`default`|
|engine-clustering|N/A|N/A|N/A|`gpu:1080ti`, `machine:gpu`|`default`|
|elasticsearch-logging|ClusterIP|9200|N/A||`kube-system`|
|kibana-logging|ClusterIP|5601|N/A||`kube-system`|
|pgadmin4|NodePort|80|32008||`default`|
|registry|NodePort|5000|31115|`machine:storage`|`default`|
|registry-ui|NodePort|80|31116||`default`|

## Secret Information
|Secret Name|DATA|Deploy for|
|-|-|-|
|database-secret|1 (postgres-password)|`cityeyes-postgresql`, `paas-postgresq`|
|pagadmin-secret|2 (username, password)|`pgAdmin`|
|cifs-secret|2 (username, password)|all the samba volume|

## Service URL
|ServiceName|URL|
|-|-|
|deeplook_cityeyes|http://${Master IP}|
|deeplook_paas|http://${Master IP}/PaaS/|
|OpenMap Tiles Map Server|http://${Master IP}/map/|
|Rabbitmq manager|http://${Master IP}/rabbitmq/|
|pgAdmin4|http://${Master IP}:32008|
|Docker Registry UI|http://${Master IP}:31116|
|kibana|https://${Master IP}:6443/api/v1/namespaces/kube-system/services/kibana-logging/proxy/|
|kubernetes-dashboard|https://${Master IP}:6443/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/|


## Volume Information

### PersistentVolume
|name|capacity|hostPath|storageClassName|
|-|-|-|-|
|pv-cityeyes|100Gi|/pgBackup_cityeyes|class-cityeyes|
|pv-paas|100Gi|/pgBackup_paas|class-paas|
|pv-acl|100Gi|/mysqlBackup_acl|class-acl|
|pv-registry|100Gi|/registryBackup|class-registry|
|pv-map|100Gi|/mapBackup|class-map|
|pv-maven|100Gi|/mavenRepo|class-maven|
|pv-media|100Gi|/deeplook_media|class-media|

### PersistentVolumeClaim

|name|requests|storageClassName|
|-|-|-|
|pvc-cityeyes|100Gi|class-cityeyes|
|pvc-paas|100Gi|class-paas|
|pvc-acl|100Gi|class-acl|
|pvc-registry|100Gi|class-registry|
|pvc-map|100Gi|class-map|
|pvc-maven|100Gi|class-maven|
|pvc-media|100Gi|class-media|

## Deeplook Infra
![alt text](/Images/Deeplook_infra2.png "Deeplook Infra")

# Contribution

* A40503
* Kevin Huang
* Yenhsuan

# Change log

* `1.3.0` : Add **Offline** install & deploy. 
* `1.2.0` : Add helm charts. Change to helm install from local chart. CNI and gpu-pulgin deploy from local file. PaaS deploy use [aquamars00/deeplook_paas](https://hub.docker.com/r/aquamars00/deeplook_paas/) image.
* `1.1.0` : Add install & deploy videos. Fix Ingress deploy failed.
* `1.0.0` : Available cross node share data. Add NFS, Ingress, samba, merge engine.
* `0.9.0` : Available singe node.