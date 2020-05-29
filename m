Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C9F01E77A3
	for <lists.virtualization@lfdr.de>; Fri, 29 May 2020 10:03:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 6856720456;
	Fri, 29 May 2020 08:03:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CYf7a5HY6mfp; Fri, 29 May 2020 08:03:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 87B16203A7;
	Fri, 29 May 2020 08:03:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5B09EC016F;
	Fri, 29 May 2020 08:03:23 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 530B8C016F
 for <virtualization@lists.linux-foundation.org>;
 Fri, 29 May 2020 08:03:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 4200A888CE
 for <virtualization@lists.linux-foundation.org>;
 Fri, 29 May 2020 08:03:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B0QZzxHAs1SV
 for <virtualization@lists.linux-foundation.org>;
 Fri, 29 May 2020 08:03:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 35A0A889CA
 for <virtualization@lists.linux-foundation.org>;
 Fri, 29 May 2020 08:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590739399;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=3sCGk2CMdXKSPjF97sMoZKCNplEGrPAt2s8qgubR3U8=;
 b=Gc4L+6+Q2gEOUJC2zYfMfR2qC+x/VcQFlJXPZaXtdEdodNktu7tDP2/yH3WA6TpoT7Rot4
 od+bh31xYV4Os0fYjWvTrQRLNJii752qeaRf3nYsAzfq2kUmI8KwAMRWL4kBR3mKHIoazB
 VVqU3TxPRqCEPUxGmfyE5B52JUcc80k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-36-vz3bxBC7PT6Fd61srtV9jg-1; Fri, 29 May 2020 04:03:17 -0400
X-MC-Unique: vz3bxBC7PT6Fd61srtV9jg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6B0801855A14;
 Fri, 29 May 2020 08:03:15 +0000 (UTC)
Received: from jason-ThinkPad-X1-Carbon-6th.redhat.com
 (ovpn-13-231.pek2.redhat.com [10.72.13.231])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DCEA499DE6;
 Fri, 29 May 2020 08:03:06 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com,
	jasowang@redhat.com
Subject: [PATCH 0/6] vDPA: doorbell mapping
Date: Fri, 29 May 2020 16:02:57 +0800
Message-Id: <20200529080303.15449-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Cc: shahafs@mellanox.com, lulu@redhat.com, kvm@vger.kernel.org,
 saugatm@xilinx.com, netdev@vger.kernel.org, mhabets@solarflare.com,
 vmireyno@marvell.com, linux-kernel@vger.kernel.org, gdawar@xilinx.com,
 virtualization@lists.linux-foundation.org, eperezma@redhat.com,
 hanand@xilinx.com, zhangweining@ruijie.com.cn, eli@mellanox.com,
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

Hi all:

This series introduce basic functionality of doorbell mapping support
for vhost-vDPA. Userspace program may use mmap() to map a the doorbell
of a specific virtqueue into its address space. This is help to reudce
the syscall or vmexit overhead.

A new vdpa_config_ops was introduced to report the location of the
doorbell, vhost_vdpa may then choose to map the doorbell when:

- The doorbell register is localted at page boundary
- The doorbell register does not share page with non doorbell
  registers.

With these two requriements, doorbells layout could be modelled more
easily from guest (e.g Qemu's page-per-vq model) and it would be more
safe to avoid exposing other registers to userspace directly.

IFCVF was reported to support this feature but unfortuantely the one I
used does not meet those requirements. So a new virtio-pci driver for
vDPA bus is introduced, and I verify this with page-per-vq=on with a
userspace vhost-vdpa driver in guest.

Please review.

Thanks

Jason Wang (6):
  vhost: allow device that does not depend on vhost worker
  vhost: use mmgrab() instead of mmget() for non worker device
  vdpa: introduce get_vq_notification method
  vhost_vdpa: support doorbell mapping via mmap
  vdpa: introduce virtio pci driver
  vdpa: vp_vdpa: report doorbell location

 drivers/vdpa/Kconfig           |   6 +
 drivers/vdpa/Makefile          |   1 +
 drivers/vdpa/vp_vdpa/Makefile  |   2 +
 drivers/vdpa/vp_vdpa/vp_vdpa.c | 604 +++++++++++++++++++++++++++++++++
 drivers/vhost/net.c            |   2 +-
 drivers/vhost/scsi.c           |   2 +-
 drivers/vhost/vdpa.c           |  61 +++-
 drivers/vhost/vhost.c          |  80 +++--
 drivers/vhost/vhost.h          |   2 +
 drivers/vhost/vsock.c          |   2 +-
 include/linux/vdpa.h           |  16 +
 11 files changed, 753 insertions(+), 25 deletions(-)
 create mode 100644 drivers/vdpa/vp_vdpa/Makefile
 create mode 100644 drivers/vdpa/vp_vdpa/vp_vdpa.c

-- 
2.20.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
