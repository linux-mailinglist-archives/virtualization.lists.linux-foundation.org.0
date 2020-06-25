Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C70920A065
	for <lists.virtualization@lfdr.de>; Thu, 25 Jun 2020 15:58:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id B5C5B87D42;
	Thu, 25 Jun 2020 13:58:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pVcVkOks9jU5; Thu, 25 Jun 2020 13:58:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id BDDDB87B49;
	Thu, 25 Jun 2020 13:58:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9603CC016F;
	Thu, 25 Jun 2020 13:58:03 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B97B4C016F
 for <virtualization@lists.linux-foundation.org>;
 Thu, 25 Jun 2020 13:58:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id AC7E8231C8
 for <virtualization@lists.linux-foundation.org>;
 Thu, 25 Jun 2020 13:58:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j6xYMR5+b7c4
 for <virtualization@lists.linux-foundation.org>;
 Thu, 25 Jun 2020 13:58:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by silver.osuosl.org (Postfix) with ESMTPS id 74EF623115
 for <virtualization@lists.linux-foundation.org>;
 Thu, 25 Jun 2020 13:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593093480;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=a3sOV0ZHvCtW1jwkrpJy23JJcAH66RTksrishZc28jc=;
 b=PetJQ8y+OzCpFSulrN/65rFUs534LBsehjMrEkhdXMwuAtt8+JN9ENwMmgKA3VsSFRR4Rv
 chXB/HoDpYhfkPewYvDOw9O5n34I/CnlP87lJP6sQ37J1x4AXZF5vHc63DM/5gTMpXPWZF
 9Uu9B2gQUwmeUnxnCDN6dgXUg1TZS4o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-274-rMkuzU0sPliCfnKdECi-2w-1; Thu, 25 Jun 2020 09:57:58 -0400
X-MC-Unique: rMkuzU0sPliCfnKdECi-2w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6E5751940920;
 Thu, 25 Jun 2020 13:57:57 +0000 (UTC)
Received: from localhost (ovpn-115-49.ams2.redhat.com [10.36.115.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CCF521DC;
 Thu, 25 Jun 2020 13:57:53 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: kvm@vger.kernel.org
Subject: [RFC 0/3] virtio: NUMA-aware memory allocation
Date: Thu, 25 Jun 2020 14:57:49 +0100
Message-Id: <20200625135752.227293-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 virtualization@lists.linux-foundation.org
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

These patches are not ready to be merged because I was unable to measure a
performance improvement. I'm publishing them so they are archived in case
someone picks up this work again in the future.

The goal of these patches is to allocate virtqueues and driver state from the
device's NUMA node for optimal memory access latency. Only guests with a vNUMA
topology and virtio devices spread across vNUMA nodes benefit from this.  In
other cases the memory placement is fine and we don't need to take NUMA into
account inside the guest.

These patches could be extended to virtio_net.ko and other devices in the
future. I only tested virtio_blk.ko.

The benchmark configuration was designed to trigger worst-case NUMA placement:
 * Physical NVMe storage controller on host NUMA node 0
 * IOThread pinned to host NUMA node 0
 * virtio-blk-pci device in vNUMA node 1
 * vCPU 0 on host NUMA node 1 and vCPU 1 on host NUMA node 0
 * vCPU 0 in vNUMA node 0 and vCPU 1 in vNUMA node 1

The intent is to have .probe() code run on vCPU 0 in vNUMA node 0 (host NUMA
node 1) so that memory is in the wrong NUMA node for the virtio-blk-pci devic=
e.
Applying these patches fixes memory placement so that virtqueues and driver
state is allocated in vNUMA node 1 where the virtio-blk-pci device is located.

The fio 4KB randread benchmark results do not show a significant improvement:

Name                  IOPS   Error
virtio-blk        42373.79 =C2=B1 0.54%
virtio-blk-numa   42517.07 =C2=B1 0.79%

Stefan Hajnoczi (3):
  virtio-pci: use NUMA-aware memory allocation in probe
  virtio_ring: use NUMA-aware memory allocation in probe
  virtio-blk: use NUMA-aware memory allocation in probe

 include/linux/gfp.h                |  2 +-
 drivers/block/virtio_blk.c         |  7 +++++--
 drivers/virtio/virtio_pci_common.c | 16 ++++++++++++----
 drivers/virtio/virtio_ring.c       | 26 +++++++++++++++++---------
 mm/page_alloc.c                    |  2 +-
 5 files changed, 36 insertions(+), 17 deletions(-)

--=20
2.26.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
