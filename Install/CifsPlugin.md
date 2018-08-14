# Install CIFS plugin for kubernetes

The plugin from [CIFS Flexvolume Plugin][0]

## Requires (Before install)

* `mount.cifs`, on Ubuntu this is in the [cifs-utils][1] package.
* `jq`, on Ubuntu this is in the [jq][2] package.
* `mountpoint`, on Ubuntu this is in the [util-linux][3] package.
* `base64`, on Ubuntu this is in the [coreutils][4] package.

```shell
$ apt-get install -y mount.cifs jq mountpoint base64
```

## Installing

On the Kubernetes master and on each Kubernetes node run the following commands:

```bash
VOLUME_PLUGIN_DIR="/usr/libexec/kubernetes/kubelet-plugins/volume/exec"
mkdir -p "$VOLUME_PLUGIN_DIR/fstab~cifs"
cd "$VOLUME_PLUGIN_DIR/fstab~cifs"
curl -L -O https://raw.githubusercontent.com/fstab/cifs/master/cifs
chmod 755 cifs
```

To check if the installation was successful, run the following command:

```bash
VOLUME_PLUGIN_DIR="/usr/libexec/kubernetes/kubelet-plugins/volume/exec"
$VOLUME_PLUGIN_DIR/fstab~cifs/cifs init
```

It should output a JSON string containing `"status": "Success"`. This command is also run by Kubernetes itself when the cifs plugin is detected on the file system.

[0]: https://github.com/fstab/cifs
[1]: https://packages.ubuntu.com/bionic/cifs-utils
[2]: https://packages.ubuntu.com/bionic/jq
[3]: https://packages.ubuntu.com/bionic/util-linux
[4]: https://packages.ubuntu.com/bionic/coreutils