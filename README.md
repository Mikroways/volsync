# VolSync

VolSync asynchronously replicates Kubernetes persistent volumes between clusters
using either [rsync](https://rsync.samba.org/) or [rclone](https://rclone.org/).
It also supports creating backups of persistent volumes via
[restic](https://restic.net/).

[![Documentation
Status](https://readthedocs.org/projects/volsync/badge/?version=latest)](https://volsync.readthedocs.io/en/latest/?badge=latest)
[![Go Report
Card](https://goreportcard.com/badge/github.com/backube/volsync)](https://goreportcard.com/report/github.com/backube/volsync)
[![codecov](https://codecov.io/gh/backube/volsync/branch/main/graph/badge.svg)](https://codecov.io/gh/backube/volsync)
![maturity](https://img.shields.io/static/v1?label=maturity&message=alpha&color=red)

![Documentation](https://github.com/backube/volsync/workflows/Documentation/badge.svg)
![operator](https://github.com/backube/volsync/workflows/operator/badge.svg)

---

## Motivation

This repository creates an Volsync docker image based on the official Volsync
image in the [quay.io/backube/volsync](https://quay.io/repository/backube/volsync?tab=tags).
The _client.sh_ script is being modified so that Rsync does **NOT** try to
set the ownership of the files that copies to the server. 

This change was motivated by the fact that it is not possible to execute against
an EFS volume created with [Dynamic Provisioning](https://aws.amazon.com/blogs/containers/introducing-efs-csi-dynamic-provisioning/) commands like _chown_ or _chgrp_. This is because EFS CSI Dynamic Provisioning uses [Access Points](https://docs.aws.amazon.com/efs/latest/ug/efs-access-points.html) that enforce user identity for all file system requests that are made through the access point. 

## Docker image

To create a new version of the image:

1. Make the corresponding changes to either the Dockerfile or the _client.sh_
   script.
2. Create a tag with the form `v<0-9>.<0-9>.<0-9>`
