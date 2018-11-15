# Docker image SAVE & LOAD

## Save ALL images

```shell
$ docker save -o <file name> $(docker images --format "{{.Repository}}:{{.Tag}}")
```

## Load ALL images

```shell
$ docker load -i <file name>
```

## Check images

```shell
$ docker images
```