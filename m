Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F292115A5
	for <lists.virtualization@lfdr.de>; Thu,  2 Jul 2020 00:11:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id D19DF30471;
	Wed,  1 Jul 2020 22:11:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TLEYpjTs2KuW; Wed,  1 Jul 2020 22:11:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 0E23630461;
	Wed,  1 Jul 2020 22:11:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DDFBFC0733;
	Wed,  1 Jul 2020 22:11:19 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4ED53C0733
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Jul 2020 22:11:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 3E82C8AD7F
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Jul 2020 22:11:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GVkSj6YKEtqY
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Jul 2020 22:11:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id C4C0E8AD7D
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Jul 2020 22:11:17 +0000 (UTC)
Received: from localhost (mobile-166-175-191-139.mycingular.net
 [166.175.191.139])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 22F4620780;
 Wed,  1 Jul 2020 22:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593641477;
 bh=Uu5gADrn1c8/F3DyyVDuZVDs635s6vTyqaj9liPB4zg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=U8yRMXPv35K3avDnwhvyRBDN3TNUYAo8JSlafx8DbhjvxNvecxo6SLc034QaZPn4h
 lKm1OjMxsQHLbtB1FSpdDBiwsCDxCPL4QTIgMUXfOptbU2PVJLe2Oe1Rv4KuXzxI1A
 zhmCVHmxGbIqhYSKQE5jqPLVCYeSkWEbZptbj6Cw=
From: Bjorn Helgaas <helgaas@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] virtio-mmio: Reject invalid IRQ 0 command line argument
Date: Wed,  1 Jul 2020 17:10:40 -0500
Message-Id: <20200701221040.3667868-3-helgaas@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200701221040.3667868-1-helgaas@kernel.org>
References: <20200701221040.3667868-1-helgaas@kernel.org>
MIME-Version: 1.0
Cc: Bjorn Helgaas <bhelgaas@google.com>,
 virtualization@lists.linux-foundation.org,
 "Michael S . Tsirkin" <mst@redhat.com>
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

From: Bjorn Helgaas <bhelgaas@google.com>

The "virtio_mmio.device=" command line argument allows a user to specify
the size, address, and IRQ of a virtio device.  Previously the only
requirement for the IRQ was that it be an unsigned integer.

Zero is an unsigned integer but an invalid IRQ number, and after
a85a6c86c25be ("driver core: platform: Clarify that IRQ 0 is invalid"),
attempts to use IRQ 0 cause warnings.

If the user specifies IRQ 0, return failure instead of registering a device
with IRQ 0.

Fixes: a85a6c86c25be ("driver core: platform: Clarify that IRQ 0 is invalid")
Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>
Cc: virtualization@lists.linux-foundation.org
---
 drivers/virtio/virtio_mmio.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/virtio/virtio_mmio.c b/drivers/virtio/virtio_mmio.c
index 9d16aaffca9d..627ac0487494 100644
--- a/drivers/virtio/virtio_mmio.c
+++ b/drivers/virtio/virtio_mmio.c
@@ -641,11 +641,11 @@ static int vm_cmdline_set(const char *device,
 			&vm_cmdline_id, &consumed);
 
 	/*
-	 * sscanf() must processes at least 2 chunks; also there
+	 * sscanf() must process at least 2 chunks; also there
 	 * must be no extra characters after the last chunk, so
 	 * str[consumed] must be '\0'
 	 */
-	if (processed < 2 || str[consumed])
+	if (processed < 2 || str[consumed] || irq == 0)
 		return -EINVAL;
 
 	resources[0].flags = IORESOURCE_MEM;
-- 
2.25.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
