Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id B902C73754
	for <lists.virtualization@lfdr.de>; Wed, 24 Jul 2019 21:07:16 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 3B7CF14F0;
	Wed, 24 Jul 2019 18:59:36 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 251A61826
	for <virtualization@lists.linux-foundation.org>;
	Tue,  2 Jul 2019 10:05:23 +0000 (UTC)
X-Greylist: delayed 00:05:13 by SQLgrey-1.7.6
Received: from pb-smtp1.pobox.com (pb-smtp1.pobox.com [64.147.108.70])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id C0B9A782
	for <virtualization@lists.linux-foundation.org>;
	Tue,  2 Jul 2019 10:05:22 +0000 (UTC)
Received: from pb-smtp1.pobox.com (unknown [127.0.0.1])
	by pb-smtp1.pobox.com (Postfix) with ESMTP id 78F6F150648;
	Tue,  2 Jul 2019 06:00:08 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id; s=sasl; bh=jSkAOz/JekATy7foxdB+etb0MM8
	=; b=Nu4e5+Rr11XSEzSxsh1fblnkiCsBys6TGOx1H+wftnRg9w/DZc4S0LbDGRs
	IG7pJeYlsZv4HUFY6Vt9TyO2fU9RpsEUfj8b46vY1kRxKUkIche2CeJTSUt4FZzu
	01P+Z8Pz/VGptGyV9NL0Un0jaaXSRz9FYq0AICuFtTe3nyEw=
Received: from pb-smtp1.nyi.icgroup.com (unknown [127.0.0.1])
	by pb-smtp1.pobox.com (Postfix) with ESMTP id 6F0FB150647;
	Tue,  2 Jul 2019 06:00:08 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=foobox.net;
	h=from:to:cc:subject:date:message-id; s=mesmtp;
	bh=+lliQuyIZpwTTjuKcii3RwNj8j3p9yrnj96NIgycEdI=;
	b=Cd5c12n9DuxQL3zSs6SvDOfTmku8Scl02n/j++sp6rYpuTMcRduQS17Devr9u2uztVFzZBuUdNgiqDtwIOy7cMeBvQD4zx+w7eyUR6JYAO9iFRXbxQ3OPb62WnMO8hXC8k6DigEHTq38cb1mCBgxT0FXknvEmVXgG9euUCv2F3w=
Received: from imatushchak-HP-ZBook-14u-G4.synapse.com (unknown
	[195.238.93.241])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by pb-smtp1.pobox.com (Postfix) with ESMTPSA id EFE20150646;
	Tue,  2 Jul 2019 06:00:06 -0400 (EDT)
From: Ihor Matushchak <ihor.matushchak@foobox.net>
To: mst@redhat.com
Subject: [PATCH] virtio-mmio: add error check for platform_get_irq
Date: Tue,  2 Jul 2019 12:59:18 +0300
Message-Id: <20190702095918.12852-1-ihor.matushchak@foobox.net>
X-Mailer: git-send-email 2.17.1
X-Pobox-Relay-ID: 2BE6FA06-9CB0-11E9-877C-46F8B7964D18-19565117!pb-smtp1.pobox.com
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
X-Mailman-Approved-At: Wed, 24 Jul 2019 18:59:23 +0000
Cc: ihor.matushchak@foobox.net, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Linux virtualization <virtualization.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/virtualization>,
	<mailto:virtualization-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/virtualization/>
List-Post: <mailto:virtualization@lists.linux-foundation.org>
List-Help: <mailto:virtualization-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/virtualization>,
	<mailto:virtualization-request@lists.linux-foundation.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

in vm_find_vqs() irq has a wrong type
so, in case of no IRQ resource defined,
wrong parameter will be passed to request_irq()

Signed-off-by: Ihor Matushchak <ihor.matushchak@foobox.net>
---
 drivers/virtio/virtio_mmio.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/virtio/virtio_mmio.c b/drivers/virtio/virtio_mmio.c
index f363fbeb5ab0..60dde8ed163b 100644
--- a/drivers/virtio/virtio_mmio.c
+++ b/drivers/virtio/virtio_mmio.c
@@ -463,9 +463,14 @@ static int vm_find_vqs(struct virtio_device *vdev, unsigned nvqs,
 		       struct irq_affinity *desc)
 {
 	struct virtio_mmio_device *vm_dev = to_virtio_mmio_device(vdev);
-	unsigned int irq = platform_get_irq(vm_dev->pdev, 0);
+	int irq = platform_get_irq(vm_dev->pdev, 0);
 	int i, err, queue_idx = 0;
 
+	if (irq < 0) {
+		dev_err(&vdev->dev, "no IRQ resource defined\n");
+		return -ENODEV;
+	}
+
 	err = request_irq(irq, vm_interrupt, IRQF_SHARED,
 			dev_name(&vdev->dev), vm_dev);
 	if (err)
-- 
2.17.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
