Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F5573757
	for <lists.virtualization@lfdr.de>; Wed, 24 Jul 2019 21:07:35 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id ACB7814F4;
	Wed, 24 Jul 2019 18:59:36 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 164101B93
	for <virtualization@lists.linux-foundation.org>;
	Tue,  2 Jul 2019 14:49:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from pb-smtp2.pobox.com (pb-smtp2.pobox.com [64.147.108.71])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 7A30A84C
	for <virtualization@lists.linux-foundation.org>;
	Tue,  2 Jul 2019 14:49:11 +0000 (UTC)
Received: from pb-smtp2.pobox.com (unknown [127.0.0.1])
	by pb-smtp2.pobox.com (Postfix) with ESMTP id 8C46416D894;
	Tue,  2 Jul 2019 10:49:09 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=pobox.com; h=from:to:cc
	:subject:date:message-id:in-reply-to:references; s=sasl; bh=iuSC
	QH936PalZ9sl8D0wOAB5/XY=; b=m5DbVkGciCn5BhProSSHQyKURPn08TD/oOV9
	n9ypbv/aQyHbhCqQh1ZbtcZp3Lv/EVhrjEB4hDWXHp6jhFjFbStuTYYnGYeU4XsG
	a4dzj7x6zc/t+Ti22COnS7cwxVFujK89dJKV4qXjkKmMHCe28qnSN164joG47hce
	u9pyYWI=
Received: from pb-smtp2.nyi.icgroup.com (unknown [127.0.0.1])
	by pb-smtp2.pobox.com (Postfix) with ESMTP id 842C916D893;
	Tue,  2 Jul 2019 10:49:09 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=foobox.net;
	h=from:to:cc:subject:date:message-id:in-reply-to:references; s=mesmtp; 
	bh=ruAx3BEDVnp34U2vU44ihcx7aAUaxt7IiCC+TdX+HDg=;
	b=FNrVrwbKKseslOXVKSfBcO245Z0WYyp8uhNrfJ068us5oGFMH/LTptbl6nO94kFbBr0OMDmFanTtypwWuXBUAgm2WDKvmcwbvN8vjwUBOT3d9FWSzI07+D21m0QWKli0YuwnVKfkzh7vRVTBkCVgLnteTOeTP8B19mhq+fTqpaE=
Received: from imatushchak-HP-ZBook-14u-G4.synapse.com (unknown
	[195.238.93.241])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by pb-smtp2.pobox.com (Postfix) with ESMTPSA id 1B4D516D890;
	Tue,  2 Jul 2019 10:49:07 -0400 (EDT)
From: Ihor Matushchak <ihor.matushchak@foobox.net>
To: mst@redhat.com
Subject: [PATCH v2] virtio-mmio: add error check for platform_get_irq
Date: Tue,  2 Jul 2019 17:48:18 +0300
Message-Id: <20190702144818.32648-1-ihor.matushchak@foobox.net>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <156207429000.5051.5975712347598980745@silver>
References: <156207429000.5051.5975712347598980745@silver>
X-Pobox-Relay-ID: 8C16B0BA-9CD8-11E9-800F-72EEE64BB12D-19565117!pb-smtp2.pobox.com
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
X-Mailman-Approved-At: Wed, 24 Jul 2019 18:59:23 +0000
Cc: ihor.matushchak@foobox.net, linux-kernel@vger.kernel.org,
	iivanov.xz@gmail.com, virtualization@lists.linux-foundation.org
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
Changes in v2:
Don't overwrite error code value.

 drivers/virtio/virtio_mmio.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/virtio/virtio_mmio.c b/drivers/virtio/virtio_mmio.c
index f363fbeb5ab0..e09edb5c5e06 100644
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
+		dev_err(&vdev->dev, "Cannot get IRQ resource\n");
+		return irq;
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
