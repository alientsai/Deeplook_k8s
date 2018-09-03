# Deeplook_k8s

## What is this repository for ?
**Deeplook(Cityeyes) to Kubernetes.**

**Build paltform for Deeplook.**

## Deeplook Platform
![alt text](/Images/Deeplook_k8s.png "Deeplook Platform")

## Project Outline

- Install
  - [Kubernetes](./Install/Kubernetes.md)
  - [GPUforKubernetes](./Install/GPUforKubernetes.md)
  - [CifsPlugin](./Install/CifsPlugin.md)
  - [Helm](./Install/Helm.md)
- Deploy
  - [Database](./Deploy/Database/README.md)
      - cityeyes
      - paas
  - [DockerRegistry](./Deploy/DockerRegistry/README.md)
      - UI
  - [gpuPod](./Deploy/gpuPod/README.md)
      - engine
          - classify
          - clustering
  - [MapTileServer](./Deploy/MapTileServer/README.md)
  - [pgAdmin](./Deploy/pgAdmin/README.md)
  - [Rabbitmq](./Deploy/rabbitmq/README.md)
  - [Secret](./Deploy/Secret/README.md)
  - [Tomcat](./Deploy/Tomcat/README.md)
  - [Volume](./Deploy/Volume/README.md)
  - [EFK](./Deploy/EFK/README.md)

## Deeplook Network
![alt text](/Images/Cluster_network.png "Deeplook Network")

## Plaform services
|ServiceName|Type|container Port|Expose Port|Node label|namespaces|
|-|-|-|-|-|-|
|deeplook|NodePort|8080|32010|`machine:storage`|`default`|
|paas|NodePort|8080|32011|`machine:storage`|`default`|
|map|NodePort|80|32009|`machine:storage`|`default`|
|pgadmin4|NodePort|80|32008||`default`|
|registry|NodePort|5000|31115|`machine:storage`|`default`|
|registry-ui|NodePort|80|31116||`default`|
|cityeyes-postgresql|ClusterIP|5432|N/A|`machine:storage`|`default`|
|paas-postgresql|ClusterIP|5432|N/A|`machine:storage`|`default`|
|mq-rabbitmq|ClusterIP|4369,5672,25672,15672|N/A||`default`|
|engine-classify|ClusterIP|80|N/A|`gpu:1080ti`, `machine:gpu`|`default`|
|engine-clustering|ClusterIP|80|N/A|`gpu:1080ti`, `machine:gpu`|`default`|
|elasticsearch-logging|ClusterIP|9200|N/A||`kube-system`|
|kibana-logging|ClusterIP|5601|N/A||`kube-system`|

## Secret Information
|Secret Name|DATA|Deploy for|
|-|-|-|
|database-secret|1 (postgres-password)|`cityeyes-postgresql`, `paas-postgresq`|
|pagadmin-secret|2 (username, password)|`pgAdmin`|
|cifs-secret|2 (username, password)|all the samba volume|

## Volume Information

### PersistentVolume
|name|capacity|hostPath|storageClassName|
|-|-|-|-|
|pv-cityeyes|100Gi|/pgBackup_cityeyes|class-cityeyes|
|pv-paas|100Gi|/pgBackup_paas|class-paas|
|pv-registry|100Gi|/registryBackup|class-registry|

### PersistentVolumeClaim

|name|requests|storageClassName|
|-|-|-|
|pvc-cityeyes|100Gi|class-cityeyes|
|pvc-paas|100Gi|class-paas|
|pvc-registry|100Gi|class-registry|

## Deeplook Infra
![alt text](/Images/Deeplook_infra2.png "Deeplook Infra")