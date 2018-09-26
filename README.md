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
  - [gpuPod](./Deploy/gpuPod/README.md)
      - engine
          - classify
          - clustering
  - [MapTileServer](./Deploy/MapTileServer/README.md)
  - [pgAdmin](./Deploy/pgAdmin/README.md)
  - [Rabbitmq](./Deploy/rabbitmq/README.md)
  - [Secret](./Deploy/Secret/README.md)
  - [Tomcat](./Deploy/Tomcat/README.md)
      - deeplook
      - paas
      - acl
  - [Volume](./Deploy/Volume/README.md)
  - [EFK](./Deploy/EFK/README.md)

## Deeplook Network
![alt text](/Images/Cluster_network.png "Deeplook Network")

## Plaform services
|ServiceName|Type|container Port|Expose Port|Node label|namespaces|
|-|-|-|-|-|-|
|deeplook|ClusterIP|8080|N/A|`machine:storage`|`default`|
|paas|ClusterIP|8080|N/A|`machine:storage`|`default`|
|acl|ClusterIP|8080|N/A|`machine:storage`|`default`|
|map|NodePort|80|32009|`machine:storage`|`default`|
|pgadmin4|NodePort|80|32008||`default`|
|registry|NodePort|5000|31115|`machine:storage`|`default`|
|registry-ui|NodePort|80|31116||`default`|
|cityeyes-postgresql-expose|ClusterIP|5432|32006||`default`|
|paas-postgresql-expose|ClusterIP|5432|32004||`default`|
|acldb-expose|ClusterIP|3306|32004||`default`|
|cityeyes-postgresql|ClusterIP|5432|N/A|`machine:storage`|`default`|
|paas-postgresql|ClusterIP|5432|N/A|`machine:storage`|`default`|
|acldb|ClusterIP|3306|N/A|`machine:storage`|`default`|
|mq-rabbitmq|ClusterIP|4369,5672,25672,15672|N/A||`default`|
|mq-rabbitmq-expose|NodePort|15672|32007||`default`|
|nfs-server|ClusterIP(10.100.95.27)|2049, 20048, 111|N/A|`machine:storage`|`default`|
|nfs-maven-server|ClusterIP(10.100.55.66)|2049, 20048, 111|N/A|`machine:storage`|`default`|
|engine-classify|N/A|N/A|N/A|`gpu:1080ti`, `machine:gpu`|`default`|
|engine-clustering|N/A|N/A|N/A|`gpu:1080ti`, `machine:gpu`|`default`|
|elasticsearch-logging|ClusterIP|9200|N/A||`kube-system`|
|kibana-logging|ClusterIP|5601|N/A||`kube-system`|

## Secret Information
|Secret Name|DATA|Deploy for|
|-|-|-|
|database-secret|1 (postgres-password)|`cityeyes-postgresql`, `paas-postgresq`|
|pagadmin-secret|2 (username, password)|`pgAdmin`|
|cifs-secret|2 (username, password)|all the samba volume|

## Service URL
|ServiceName|URL|
|-|-|
|deeplook_paas|http://140.96.29.86:32011/PaaS|
|deeplook_cityeyes|http://140.96.29.86:32010/CityEyes|
|OpenMap Tiles Map Server|http://140.96.29.86:32009|
|pgAdmin4|http://140.96.29.86:32008|
|Docker Registry UI|http://140.96.29.86:31116|
|kibana|https://140.96.29.86:6443/api/v1/namespaces/kube-system/services/kibana-logging/proxy/|
|kubernetes-dashboard|https://140.96.29.86:6443/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/|


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