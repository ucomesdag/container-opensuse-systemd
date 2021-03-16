OpenSUSE Systemd Container Image
=======================

This Containerfile can build containers capable to use systemd.

[![opensuse build status](https://quay.io/repository/ucomesdag/opensuse/status "Container Repository on Quay")](https://quay.io/repository/ucomesdag/opensuse)

Branches
--------

This repository has one branche that relates to OpenSUSE a version.

|Branch |OpenSUSE Version|Container image tag|
|-------|----------------|-------------------|
|main   |latest (15.2)   |latest             |

Manually starting
-----------------

```
podman run \
  --tty \
  --privileged \
  --volume /sys/fs/cgroup:/sys/fs/cgroup:ro \
  quay.io/ucomesdag/opensuse
```
