Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id CC4CC601E44
	for <lists.virtualization@lfdr.de>; Tue, 18 Oct 2022 02:08:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF1758130D;
	Tue, 18 Oct 2022 00:08:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF1758130D
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mteIK7vM
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d_cm2Thus6ZW; Tue, 18 Oct 2022 00:08:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id A735F81384;
	Tue, 18 Oct 2022 00:08:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A735F81384
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 95377C0070;
	Tue, 18 Oct 2022 00:08:47 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B4E4BC002D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 18 Oct 2022 00:08:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8254540523
 for <virtualization@lists.linux-foundation.org>;
 Tue, 18 Oct 2022 00:08:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8254540523
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.a=rsa-sha256 header.s=k20201202 header.b=mteIK7vM
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bx2pZRYR14IF
 for <virtualization@lists.linux-foundation.org>;
 Tue, 18 Oct 2022 00:08:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A7FE640185
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A7FE640185
 for <virtualization@lists.linux-foundation.org>;
 Tue, 18 Oct 2022 00:08:37 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 98FFA6131F;
 Tue, 18 Oct 2022 00:08:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A707FC433D7;
 Tue, 18 Oct 2022 00:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666051716;
 bh=emSaidC54a4a3vn+jLHbDp+jF/rF/FT0aZombicKFVk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mteIK7vMX/wNtHTXh+4o5nQ8LSxxXA9v+1/GXo2KbHAPrpeL31daaWxih4B/tESf6
 OTpHQkn7fp0dZCPTR3l0385psHEWq58GZ0r8uAPg9ciMUHuaoaAb8caamNJvmO+rrw
 6ChyImw7WxLw5HQ51JMQ/56t30PqNc7Mj4ii88exg1WIHK7YbGKTxwB6eBeiPBLJ4n
 zyV1/nOQ3DTamYrpM56g1woUPOlbOdtrOdMmb+mdgyxD5M2pbmjM135j32hMMHXMhK
 dIaJBROXnhKR1Y5o8m5adyAXd0CQ4jSX0oSnq5WbQzZXMYhZ6i3zOeLIzx5CFF6tXd
 XBdbZCapiY0wQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.0 31/32] virtio_pci: don't try to use intxif pin is
 zero
Date: Mon, 17 Oct 2022 20:07:28 -0400
Message-Id: <20221018000729.2730519-31-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221018000729.2730519-1-sashal@kernel.org>
References: <20221018000729.2730519-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Sasha Levin <sashal@kernel.org>, "Michael S . Tsirkin" <mst@redhat.com>,
 virtualization@lists.linux-foundation.org,
 Angus Chen <angus.chen@jaguarmicro.com>
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

From: Angus Chen <angus.chen@jaguarmicro.com>

[ Upstream commit 71491c54eafa318fdd24a1f26a1c82b28e1ac21d ]

The background is that we use dpu in cloud computing,the arch is x86,80
cores. We will have a lots of virtio devices,like 512 or more.
When we probe about 200 virtio_blk devices,it will fail and
the stack is printed as follows:

[25338.485128] virtio-pci 0000:b3:00.0: virtio_pci: leaving for legacy driver
[25338.496174] genirq: Flags mismatch irq 0. 00000080 (virtio418) vs. 00015a00 (timer)
[25338.503822] CPU: 20 PID: 5431 Comm: kworker/20:0 Kdump: loaded Tainted: G           OE    --------- -  - 4.18.0-305.30.1.el8.x86_64
[25338.516403] Hardware name: Inspur NF5280M5/YZMB-00882-10E, BIOS 4.1.21 08/25/2021
[25338.523881] Workqueue: events work_for_cpu_fn
[25338.528235] Call Trace:
[25338.530687]  dump_stack+0x5c/0x80
[25338.534000]  __setup_irq.cold.53+0x7c/0xd3
[25338.538098]  request_threaded_irq+0xf5/0x160
[25338.542371]  vp_find_vqs+0xc7/0x190
[25338.545866]  init_vq+0x17c/0x2e0 [virtio_blk]
[25338.550223]  ? ncpus_cmp_func+0x10/0x10
[25338.554061]  virtblk_probe+0xe6/0x8a0 [virtio_blk]
[25338.558846]  virtio_dev_probe+0x158/0x1f0
[25338.562861]  really_probe+0x255/0x4a0
[25338.566524]  ? __driver_attach_async_helper+0x90/0x90
[25338.571567]  driver_probe_device+0x49/0xc0
[25338.575660]  bus_for_each_drv+0x79/0xc0
[25338.579499]  __device_attach+0xdc/0x160
[25338.583337]  bus_probe_device+0x9d/0xb0
[25338.587167]  device_add+0x418/0x780
[25338.590654]  register_virtio_device+0x9e/0xe0
[25338.595011]  virtio_pci_probe+0xb3/0x140
[25338.598941]  local_pci_probe+0x41/0x90
[25338.602689]  work_for_cpu_fn+0x16/0x20
[25338.606443]  process_one_work+0x1a7/0x360
[25338.610456]  ? create_worker+0x1a0/0x1a0
[25338.614381]  worker_thread+0x1cf/0x390
[25338.618132]  ? create_worker+0x1a0/0x1a0
[25338.622051]  kthread+0x116/0x130
[25338.625283]  ? kthread_flush_work_fn+0x10/0x10
[25338.629731]  ret_from_fork+0x1f/0x40
[25338.633395] virtio_blk: probe of virtio418 failed with error -16

The log :
"genirq: Flags mismatch irq 0. 00000080 (virtio418) vs. 00015a00 (timer)"
was printed because of the irq 0 is used by timer exclusive,and when
vp_find_vqs call vp_find_vqs_msix and returns false twice (for
whatever reason), then it will call vp_find_vqs_intx as a fallback.
Because vp_dev->pci_dev->irq is zero, we request irq 0 with
flag IRQF_SHARED, and get a backtrace like above.

According to PCI spec about "Interrupt Pin" Register (Offset 3Dh):
"The Interrupt Pin register is a read-only register that identifies the
 legacy interrupt Message(s) the Function uses. Valid values are 01h, 02h,
 03h, and 04h that map to legacy interrupt Messages for INTA,
 INTB, INTC, and INTD respectively. A value of 00h indicates that the
 Function uses no legacy interrupt Message(s)."

So if vp_dev->pci_dev->pin is zero, we should not request legacy
interrupt.

Signed-off-by: Angus Chen <angus.chen@jaguarmicro.com>
Suggested-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20220930000915.548-1-angus.chen@jaguarmicro.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/virtio/virtio_pci_common.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/virtio/virtio_pci_common.c b/drivers/virtio/virtio_pci_common.c
index ad258a9d3b9f..4df77eeb4d16 100644
--- a/drivers/virtio/virtio_pci_common.c
+++ b/drivers/virtio/virtio_pci_common.c
@@ -409,6 +409,9 @@ int vp_find_vqs(struct virtio_device *vdev, unsigned int nvqs,
 	err = vp_find_vqs_msix(vdev, nvqs, vqs, callbacks, names, false, ctx, desc);
 	if (!err)
 		return 0;
+	/* Is there an interrupt pin? If not give up. */
+	if (!(to_vp_device(vdev)->pci_dev->pin))
+		return err;
 	/* Finally fall back to regular interrupts. */
 	return vp_find_vqs_intx(vdev, nvqs, vqs, callbacks, names, ctx);
 }
-- 
2.35.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
