# Deploy Samba

## Need deploy on `sotrage` node (The folder`/deepkook_media` existed node).

Use `docker` deploy. \
**Mount config files need absolute path!**

```shell
$ docker run -it -p 139:139 -p 445:445 -p 137:137/udp -p 138:138/udp --name samba -v /deeplook_media/:/deeplook_media -v /Deeplook_k8s/Deploy/Samba/conf/:/etc/samba/  -d dperson/samba -s "public;/share"
```

Image from registry :
```shell
$ docker run -it -p 139:139 -p 445:445 -p 137:137/udp -p 138:138/udp --name samba -v /deeplook_media/:/deeplook_media -v /Deeplook_k8s/Deploy/Samba/conf/:/etc/samba/  -d 140.96.29.86:31115/dperson/samba -s "public;/share"
```

### Mount samba on linux

```shell
$ mount -t cifs //140.96.29.171/snakeeyes /mysmb -o username=user,vers=1.0
```

### Umount samba on linux

```
$ umount /mysmb
```

### Mount samba on windows

#### 1: Right click
![alt text](/Images/Mount_Sammba_win.png)

#### 2: Input location
![alt text](/Images/Mount_Sammba_win2.png)

#### 3: Use it
![alt text](/Images/Mount_Sammba_win3.png)