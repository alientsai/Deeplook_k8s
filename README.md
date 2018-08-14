# Deeplook_k8s

## What is this repository for ?
**Deeplook(Cityeyes) to Kubernetes.**

**Build paltform for Deeplook.**

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
  - [Rabbitmq](./Deploy/Rabbitmq/README.md)
  - [Secret](./Deploy/Secret/README.md)
  - [Tomcat](./Deploy/Tomcat/README.md)

## Plaform services
|ServiceName|Type|container Port|Expose Port|Node label|
|-|-|-|-|-|
|deeplook|NodePort|8080|32010||
|paas|ClusterIP|8080|N/A||
|map|NodePort|80|32009|machine: storage|
|pgadmin4|NodePort|80|32008||
|registry|NodePort|5000|31115|machine: storage|
|registry-ui|NodePort|80|31116||
|cityeyes-postgresql|ClusterIP|5432|N/A|machine: storage|
|paas-postgresql|ClusterIP|5432|N/A|machine: storage|
|mq-rabbitmq|ClusterIP|4369,5672,25672,15672|N/A||
|engine-classify|ClusterIP|80|N/A|gpu: 1080ti, machine: gpu|
|engine-clustering|ClusterIP|80|N/A|gpu: 1080ti, machine: gpu|