Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A3DD2DBB5D
	for <lists.virtualization@lfdr.de>; Wed, 16 Dec 2020 07:48:41 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id DE248872CD;
	Wed, 16 Dec 2020 06:48:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id feU3Ev++wUXJ; Wed, 16 Dec 2020 06:48:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 43E30872CE;
	Wed, 16 Dec 2020 06:48:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0BDA5C013B;
	Wed, 16 Dec 2020 06:48:39 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C43E9C013B
 for <virtualization@lists.linux-foundation.org>;
 Wed, 16 Dec 2020 06:48:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id B8879872CD
 for <virtualization@lists.linux-foundation.org>;
 Wed, 16 Dec 2020 06:48:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QpZSRCKxUlJc
 for <virtualization@lists.linux-foundation.org>;
 Wed, 16 Dec 2020 06:48:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by hemlock.osuosl.org (Postfix) with ESMTPS id DA6C5872CB
 for <virtualization@lists.linux-foundation.org>;
 Wed, 16 Dec 2020 06:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608101315;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=spj9CMYtee5G5sWC8UnW3oUIg25fvwv0Y3rRIX8a8Gc=;
 b=Mxm61wBem69FHHdu8Pc9zs2lE/NdWh0myKvs51FQAoxi073fteaUjbm7RrWXtbGvJh1N5+
 7JQfgm0MpubhlzBr7vRaOuayO2Fj9WRsaLJ+pTg4KtIPrlNMaj43OWM05Q/krnx7VqDbMD
 cAN7+XXo0snWovu3KgLCvVWUCZaTCN4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-459-PFy-QapTMuu9VuVWykG2Og-1; Wed, 16 Dec 2020 01:48:32 -0500
X-MC-Unique: PFy-QapTMuu9VuVWykG2Og-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9DBE5801A9E;
 Wed, 16 Dec 2020 06:48:30 +0000 (UTC)
Received: from jason-ThinkPad-X1-Carbon-6th.redhat.com
 (ovpn-12-210.pek2.redhat.com [10.72.12.210])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 24FDD10013C1;
 Wed, 16 Dec 2020 06:48:19 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com,
	jasowang@redhat.com
Subject: [PATCH 00/21] Control VQ support in vDPA
Date: Wed, 16 Dec 2020 14:47:57 +0800
Message-Id: <20201216064818.48239-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Cc: kvm@vger.kernel.org, lulu@redhat.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 eperezma@redhat.com, stefanha@redhat.com, eli@mellanox.com,
 lingshan.zhu@intel.com, rob.miller@broadcom.com
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Linux virtualization <virtualization.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/virtualization/>
List-Post: <mailto:virtualization@lists.linux-foundation.org>
List-Help: <mailto:virtualization-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

Hi All:

This series tries to add the support for control virtqueue in vDPA.

Control virtqueue is used by networking device for accepting various
commands from the driver. It's a must to support multiqueue and other
configurations.

When used by vhost-vDPA bus driver for VM, the control virtqueue
should be shadowed via userspace VMM (Qemu) instead of being assigned
directly to Guest. This is because Qemu needs to know the device state
in order to start and stop device correctly (e.g for Live Migration).

This requies to isolate the memory mapping for control virtqueue
presented by vhost-vDPA to prevent guest from accesing it directly.

To achieve this, vDPA introduce two new abstractions:

- address space: identified through address space id (ASID) and a set
                 of memory mapping in maintained
- virtqueue group: the minimal set of virtqueues that must share an
                 address space

Device needs to advertise the following attributes to vDPA:

- the number of address spaces supported in the device
- the number of virtqueue groups supported in the device
- the mappings from a specific virtqueue to its virtqueue groups

The mappings from virtqueue to virtqueue groups is fixed and defined
by vDPA device driver. E.g:

- For the device that has hardware ASID support, it can simply
  advertise a per virtqueue virtqueue group.
- For the device that does not have hardware ASID support, it can
  simply advertise a single virtqueue group that contains all
  virtqueues. Or if it wants a software emulated control virtqueue, it
  can advertise two virtqueue groups, one is for cvq, another is for
  the rest virtqueues.

vDPA also allow to change the association between virtqueue group and
address space. So in the case of control virtqueue, userspace
VMM(Qemu) may use a dedicated address space for the control virtqueue
group to isolate the memory mapping.

The vhost/vhost-vDPA is also extend for the userspace to:

- query the number of virtqueue groups and address spaces supported by
  the device
- query the virtqueue group for a specific virtqueue
- assocaite a virtqueue group with an address space
- send ASID based IOTLB commands

This will help userspace VMM(Qemu) to detect whether the control vq
could be supported and isolate memory mappings of control virtqueue
from the others.

To demonstrate the usage, vDPA simulator is extended to support
setting MAC address via a emulated control virtqueue.

Please review.

Changes since RFC:

- tweak vhost uAPI documentation
- switch to use device specific IOTLB really in patch 4
- tweak the commit log
- fix that ASID in vhost is claimed to be 32 actually but 16bit
  actually
- fix use after free when using ASID with IOTLB batching requests
- switch to use Stefano's patch for having separated iov
- remove unused "used_as" variable
- fix the iotlb/asid checking in vhost_vdpa_unmap()

Thanks

Jason Wang (20):
  vhost: move the backend feature bits to vhost_types.h
  virtio-vdpa: don't set callback if virtio doesn't need it
  vhost-vdpa: passing iotlb to IOMMU mapping helpers
  vhost-vdpa: switch to use vhost-vdpa specific IOTLB
  vdpa: add the missing comment for nvqs in struct vdpa_device
  vdpa: introduce virtqueue groups
  vdpa: multiple address spaces support
  vdpa: introduce config operations for associating ASID to a virtqueue
    group
  vhost_iotlb: split out IOTLB initialization
  vhost: support ASID in IOTLB API
  vhost-vdpa: introduce asid based IOTLB
  vhost-vdpa: introduce uAPI to get the number of virtqueue groups
  vhost-vdpa: introduce uAPI to get the number of address spaces
  vhost-vdpa: uAPI to get virtqueue group id
  vhost-vdpa: introduce uAPI to set group ASID
  vhost-vdpa: support ASID based IOTLB API
  vdpa_sim: advertise VIRTIO_NET_F_MTU
  vdpa_sim: factor out buffer completion logic
  vdpa_sim: filter destination mac address
  vdpasim: control virtqueue support

Stefano Garzarella (1):
  vdpa_sim: split vdpasim_virtqueue's iov field in out_iov and in_iov

 drivers/vdpa/ifcvf/ifcvf_main.c   |   9 +-
 drivers/vdpa/mlx5/net/mlx5_vnet.c |  11 +-
 drivers/vdpa/vdpa.c               |   8 +-
 drivers/vdpa/vdpa_sim/vdpa_sim.c  | 292 ++++++++++++++++++++++++------
 drivers/vhost/iotlb.c             |  23 ++-
 drivers/vhost/vdpa.c              | 246 ++++++++++++++++++++-----
 drivers/vhost/vhost.c             |  23 ++-
 drivers/vhost/vhost.h             |   4 +-
 drivers/virtio/virtio_vdpa.c      |   2 +-
 include/linux/vdpa.h              |  42 ++++-
 include/linux/vhost_iotlb.h       |   2 +
 include/uapi/linux/vhost.h        |  25 ++-
 include/uapi/linux/vhost_types.h  |  10 +-
 13 files changed, 561 insertions(+), 136 deletions(-)

-- 
2.25.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
