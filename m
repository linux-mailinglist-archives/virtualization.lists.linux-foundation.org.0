Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C56A2FB44A
	for <lists.virtualization@lfdr.de>; Tue, 19 Jan 2021 09:39:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 03E8A8480D;
	Tue, 19 Jan 2021 08:39:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VZciD9-w3Tuw; Tue, 19 Jan 2021 08:39:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7835384589;
	Tue, 19 Jan 2021 08:39:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5116CC013A;
	Tue, 19 Jan 2021 08:39:07 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id ADC27C013A
 for <virtualization@lists.linux-foundation.org>;
 Tue, 19 Jan 2021 08:39:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id A188385045
 for <virtualization@lists.linux-foundation.org>;
 Tue, 19 Jan 2021 08:39:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w3WSScmJa-nw
 for <virtualization@lists.linux-foundation.org>;
 Tue, 19 Jan 2021 08:39:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id AA6E885039
 for <virtualization@lists.linux-foundation.org>;
 Tue, 19 Jan 2021 08:39:04 +0000 (UTC)
IronPort-SDR: 6oedO0A2cfOwxp/1PRF19VcR9XHx8GP5zqghNb5p+FWp9f9rHjS9lqmX4uSmg0fBtGq5QZbdGY
 02VOLYdf+hnw==
X-IronPort-AV: E=McAfee;i="6000,8403,9868"; a="179045927"
X-IronPort-AV: E=Sophos;i="5.79,358,1602572400"; d="scan'208";a="179045927"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2021 00:38:58 -0800
IronPort-SDR: AN5c3Fix14TeV7kwmediJVK6pFrdw5/g8QMfZppW9F92edn8IZTgd6qEZAGapwXo47aUOMbt7T
 EHxWelGlDLzg==
X-IronPort-AV: E=Sophos;i="5.79,358,1602572400"; d="scan'208";a="402291605"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2021 00:38:58 -0800
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: virtualization@lists.linux-foundation.org
Subject: [RFC 0/3] Introduce Vdmabuf driver
Date: Tue, 19 Jan 2021 00:28:09 -0800
Message-Id: <20210119082812.822291-1-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Cc: dongwon.kim@intel.com
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

The Virtual dmabuf or Virtio based dmabuf (Vdmabuf) driver can be used
to "transfer" a page-backed dmabuf created in the Guest to the Host
without making any copies. A use-case where this driver would be a good 
fit is a multi-GPU system (perhaps one discrete and one integrated)
where one of the GPUs does not have access to the display/connectors/outputs.
This could be a embedded system design decision or a restriction made at
the firmware/BIOS level. When such a GPU is passthrough'd to a Guest OS,
this driver can help in transferring the scanout buffer(s) (rendered
using the native rendering stack) to the Host for the purpose of
displaying them.

The userspace component running in the Guest that transfers the dmabuf
is referred to as the producer or exporter and its counterpart running
in the Host is referred to as importer or consumer. For instance, a
Wayland compositor would potentially be a producer and Qemu UI would
be a consumer. It is the producer's responsibility to not reuse or
destroy the shared buffer while it is still being used by the consumer.
The consumer would send a release cmd indicating that it is done after
which the shared buffer can be safely used again by the producer. One
way the producer can prevent accidental re-use of the shared buffer is
to lock the buffer when it exports it and unlock it after it gets a 
release cmd. As an example, the GBM API provides a simple way to lock 
and unlock a surface's buffers.

For each dmabuf that is to be shared with the Host, a 128-bit unique
ID is generated that identifies this buffer across the whole system.
This ID is a combination of the Qemu process ID, a counter and a
randomizer. We could potentially use UUID API but we currently use
the above mentioned combination to identify the source of the buffer
at any given time for bookkeeping.

Vivek Kasireddy (3):
  virtio: Introduce Vdmabuf driver
  vhost: Add Vdmabuf backend
  vfio: Share the KVM instance with Vdmabuf

 drivers/vfio/vfio.c                 |    9 +
 drivers/vhost/Kconfig               |    9 +
 drivers/vhost/Makefile              |    3 +
 drivers/vhost/vdmabuf.c             | 1332 +++++++++++++++++++++++++++
 drivers/virtio/Kconfig              |    8 +
 drivers/virtio/Makefile             |    1 +
 drivers/virtio/virtio_vdmabuf.c     |  973 +++++++++++++++++++
 include/linux/virtio_vdmabuf.h      |  271 ++++++
 include/uapi/linux/virtio_ids.h     |    1 +
 include/uapi/linux/virtio_vdmabuf.h |   99 ++
 10 files changed, 2706 insertions(+)
 create mode 100644 drivers/vhost/vdmabuf.c
 create mode 100644 drivers/virtio/virtio_vdmabuf.c
 create mode 100644 include/linux/virtio_vdmabuf.h
 create mode 100644 include/uapi/linux/virtio_vdmabuf.h

-- 
2.26.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
