Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id A032149321F
	for <lists.virtualization@lfdr.de>; Wed, 19 Jan 2022 02:06:36 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 84E9080C0F;
	Wed, 19 Jan 2022 01:06:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3CtCPC8Kt-Kk; Wed, 19 Jan 2022 01:06:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 33C9180C14;
	Wed, 19 Jan 2022 01:06:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9147CC0077;
	Wed, 19 Jan 2022 01:06:32 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0F469C002F
 for <virtualization@lists.linux-foundation.org>;
 Wed, 19 Jan 2022 01:06:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F08A560E5C
 for <virtualization@lists.linux-foundation.org>;
 Wed, 19 Jan 2022 01:06:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kViA41Vq3Z7z
 for <virtualization@lists.linux-foundation.org>;
 Wed, 19 Jan 2022 01:06:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 22EE060E4B
 for <virtualization@lists.linux-foundation.org>;
 Wed, 19 Jan 2022 01:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642554388;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ImiqTxopVLTtvSM55Cynu1Q1h7pH3jQwIeRhaY7hQ3w=;
 b=SYVFSJ6Fyc8s1aQFJUvfOorNCEMDqrLhJ7uddGRqxtrsWVAq4nYb7uUHoo7qBZsOV/R1jE
 CGgG718gXwX8QDBBg8jwda2YkeRFfphA2+K1vcKEo0KDtMrQw12DqxIpPIyrUldsppb/F6
 oHmyvzFFt7rfKW1MnkyKGAv5Isgo6kQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-47-EfUcQnguNzuSVIiYGC-5rg-1; Tue, 18 Jan 2022 20:06:25 -0500
X-MC-Unique: EfUcQnguNzuSVIiYGC-5rg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A45F8814243;
 Wed, 19 Jan 2022 01:06:23 +0000 (UTC)
Received: from gshan.redhat.com (ovpn-12-147.pek2.redhat.com [10.72.12.147])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 83C0E5C25D;
 Wed, 19 Jan 2022 01:06:07 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: virtualization@lists.linux-foundation.org
Subject: [PATCH v3] drivers/virtio: Enable virtio mem for ARM64
Date: Wed, 19 Jan 2022 09:05:51 +0800
Message-Id: <20220119010551.181405-1-gshan@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=gshan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: Jonathan.Cameron@huawei.com, mst@redhat.com, shan.gavin@gmail.com,
 linux-arm-kernel@lists.infradead.org
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

This enables virtio-mem device support by allowing to enable the
corresponding kernel config option (CONFIG_VIRTIO_MEM) on the
architecture.

Signed-off-by: Gavin Shan <gshan@redhat.com>
Acked-by: David Hildenbrand <david@redhat.com>
Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
---
v3: Pick ack-by tags from Jonathan and Michael
---
 drivers/virtio/Kconfig | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/virtio/Kconfig b/drivers/virtio/Kconfig
index 34f80b7a8a64..74c8b0c7bc33 100644
--- a/drivers/virtio/Kconfig
+++ b/drivers/virtio/Kconfig
@@ -106,7 +106,7 @@ config VIRTIO_BALLOON
 config VIRTIO_MEM
 	tristate "Virtio mem driver"
 	default m
-	depends on X86_64
+	depends on X86_64 || ARM64
 	depends on VIRTIO
 	depends on MEMORY_HOTPLUG
 	depends on MEMORY_HOTREMOVE
@@ -116,8 +116,9 @@ config VIRTIO_MEM
 	 This driver provides access to virtio-mem paravirtualized memory
 	 devices, allowing to hotplug and hotunplug memory.
 
-	 This driver was only tested under x86-64, but should theoretically
-	 work on all architectures that support memory hotplug and hotremove.
+	 This driver was only tested under x86-64 and arm64, but should
+	 theoretically work on all architectures that support memory hotplug
+	 and hotremove.
 
 	 If unsure, say M.
 
-- 
2.23.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
