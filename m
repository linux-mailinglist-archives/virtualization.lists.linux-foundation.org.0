Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4AB1B0E7B
	for <lists.virtualization@lfdr.de>; Mon, 20 Apr 2020 16:34:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 478BF84B89;
	Mon, 20 Apr 2020 14:34:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EWUOrFa2-nKb; Mon, 20 Apr 2020 14:34:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1C80C86460;
	Mon, 20 Apr 2020 14:34:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0F51DC0177;
	Mon, 20 Apr 2020 14:34:35 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EAE1EC0177
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Apr 2020 14:34:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id E1BFE84B89
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Apr 2020 14:34:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qbMOUnj86j7A
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Apr 2020 14:34:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 19AB384AC4
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Apr 2020 14:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587393270;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=QKgQlmHl/vlNhHGtLDszGPS70GFdJJv30q0eyxymYP8=;
 b=TUAKkkcAPRD+FoHSsvNTrzV8G5iGoVXWH/ATz8QYO7UMUCPZ0bdTt8hj3xK3YI0rqVJTMj
 ZGcq/Uz5VSkbtwfwJTW1GNHAT+Okc7tLaa/fqTrIMA1C5CJDnxG3grOGtexsLmPw4xd0km
 amsroRdOFc+b9fi723Fa7Clle/vY/Mc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-458-odwlkHEPMEiYw7cjBh9aaQ-1; Mon, 20 Apr 2020 10:34:27 -0400
X-MC-Unique: odwlkHEPMEiYw7cjBh9aaQ-1
Received: by mail-wm1-f72.google.com with SMTP id u11so3564450wmc.7
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Apr 2020 07:34:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=QKgQlmHl/vlNhHGtLDszGPS70GFdJJv30q0eyxymYP8=;
 b=Q0Zt7/SKAuOh1Lx+h5EF4uNSrVtcvY1Ow7qCXEXQu/tlb0AD2NZooC5KCqFINT028X
 OICdOKwM5Q1wvVKwKhcr8ffzljK3R7WwrSWeLI3f5a64X9E9YU7CEpGML73mMYMTsP1m
 a8LiTZXFczsQlHWPmnAUjc6v2w5kuNKLbYBDRPpb3OdD8Tr5NbsMvfiL9oLBVykcOSb6
 c6BUZXwSIN61+x1sHGKvzDelOxe1TaJEU5Zdm+LqgXXCOTLi892d7XSYETepgOpW2Odk
 g1YlJ+ZHB5eMHOmVts2NXGYV6N4r2ErISyAorjcz2+Cuq39tvDX3e0I/drRcHsqH4RV/
 xIng==
X-Gm-Message-State: AGi0Pua9Teq0HoSWKU1lypuKLZjaZiAUM8l0z6vpmrHJdEOunsQ11gD7
 EglkRHvZdlRPUb05X9/j5ofaBGI8M8yOxIgnwrhfdULE0SYgh+Hmle/0ahWImP1Yob0+P3p4oJH
 BR7ElVGNxq1sXHNyK7yfvfLBSXQQ3znpWZX5bl1G2jg==
X-Received: by 2002:a5d:4e02:: with SMTP id p2mr19097337wrt.302.1587393266215; 
 Mon, 20 Apr 2020 07:34:26 -0700 (PDT)
X-Google-Smtp-Source: APiQypJPCB2aIBVyG+epiQn8wefNJaBqE0mL7KfjY5M7sLpr1ftDgKPHhXnntLSPOZw2XTiIctqPcQ==
X-Received: by 2002:a5d:4e02:: with SMTP id p2mr19097299wrt.302.1587393265925; 
 Mon, 20 Apr 2020 07:34:25 -0700 (PDT)
Received: from redhat.com (bzq-79-183-51-3.red.bezeqint.net. [79.183.51.3])
 by smtp.gmail.com with ESMTPSA id u12sm1690368wmu.25.2020.04.20.07.34.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2020 07:34:25 -0700 (PDT)
Date: Mon, 20 Apr 2020 10:34:23 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v4] vhost: disable for OABI
Message-ID: <20200420143229.245488-1-mst@redhat.com>
MIME-Version: 1.0
X-Mailer: git-send-email 2.24.1.751.gd10ce2899c
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Richard Earnshaw <Richard.Earnshaw@arm.com>, kvm@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Christoph Hellwig <hch@infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sudeep Dutt <sudeep.dutt@intel.com>, "David S. Miller" <davem@davemloft.net>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>, netdev@vger.kernel.org,
 virtualization@lists.linux-foundation.org, Ard Biesheuvel <ardb@kernel.org>
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

vhost is currently broken on the some ARM configs.

The reason is that the ring element addresses are passed between
components with different alignments assumptions. Thus, if
guest selects a pointer and host then gets and dereferences
it, then alignment assumed by the host's compiler might be
greater than the actual alignment of the pointer.
compiler on the host from assuming pointer is aligned.

This actually triggers on ARM with -mabi=apcs-gnu - which is a
deprecated configuration. With this OABI, compiler assumes that
all structures are 4 byte aligned - which is stronger than
virtio guarantees for available and used rings, which are
merely 2 bytes. Thus a guest without -mabi=apcs-gnu running
on top of host with -mabi=apcs-gnu will be broken.

The correct fix is to force alignment of structures - however
that is an intrusive fix that's best deferred until the next release.

We didn't previously support such ancient systems at all - this surfaced
after vdpa support prompted removing dependency of vhost on
VIRTULIZATION. So for now, let's just add something along the lines of

	depends on !ARM || AEABI

to the virtio Kconfig declaration, and add a comment that it has to do
with struct member alignment.

Note: we can't make VHOST and VHOST_RING themselves have
a dependency since these are selected. Add a new symbol for that.

We should be able to drop this dependency down the road.

Fixes: 20c384f1ea1a0bc7 ("vhost: refine vhost and vringh kconfig")
Suggested-by: Ard Biesheuvel <ardb@kernel.org>
Suggested-by: Richard Earnshaw <Richard.Earnshaw@arm.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---

changes from v3:
	update commit log clarifying the motivation and that
	it's a temporary fix.

	suggested by Christoph Hellwig

 drivers/misc/mic/Kconfig |  2 +-
 drivers/net/caif/Kconfig |  2 +-
 drivers/vdpa/Kconfig     |  2 +-
 drivers/vhost/Kconfig    | 17 +++++++++++++----
 4 files changed, 16 insertions(+), 7 deletions(-)

diff --git a/drivers/misc/mic/Kconfig b/drivers/misc/mic/Kconfig
index 8f201d019f5a..3bfe72c59864 100644
--- a/drivers/misc/mic/Kconfig
+++ b/drivers/misc/mic/Kconfig
@@ -116,7 +116,7 @@ config MIC_COSM
 
 config VOP
 	tristate "VOP Driver"
-	depends on VOP_BUS
+	depends on VOP_BUS && VHOST_DPN
 	select VHOST_RING
 	select VIRTIO
 	help
diff --git a/drivers/net/caif/Kconfig b/drivers/net/caif/Kconfig
index 9db0570c5beb..661c25eb1c46 100644
--- a/drivers/net/caif/Kconfig
+++ b/drivers/net/caif/Kconfig
@@ -50,7 +50,7 @@ config CAIF_HSI
 
 config CAIF_VIRTIO
 	tristate "CAIF virtio transport driver"
-	depends on CAIF && HAS_DMA
+	depends on CAIF && HAS_DMA && VHOST_DPN
 	select VHOST_RING
 	select VIRTIO
 	select GENERIC_ALLOCATOR
diff --git a/drivers/vdpa/Kconfig b/drivers/vdpa/Kconfig
index 3e1ceb8e9f2b..e8140065c8a5 100644
--- a/drivers/vdpa/Kconfig
+++ b/drivers/vdpa/Kconfig
@@ -10,7 +10,7 @@ if VDPA
 
 config VDPA_SIM
 	tristate "vDPA device simulator"
-	depends on RUNTIME_TESTING_MENU && HAS_DMA
+	depends on RUNTIME_TESTING_MENU && HAS_DMA && VHOST_DPN
 	select VHOST_RING
 	default n
 	help
diff --git a/drivers/vhost/Kconfig b/drivers/vhost/Kconfig
index 2c75d164b827..c4f273793595 100644
--- a/drivers/vhost/Kconfig
+++ b/drivers/vhost/Kconfig
@@ -13,6 +13,15 @@ config VHOST_RING
 	  This option is selected by any driver which needs to access
 	  the host side of a virtio ring.
 
+config VHOST_DPN
+	bool
+	depends on !ARM || AEABI
+	default y
+	help
+	  Anything selecting VHOST or VHOST_RING must depend on VHOST_DPN.
+	  This excludes the deprecated ARM ABI since that forces a 4 byte
+	  alignment on all structs - incompatible with virtio spec requirements.
+
 config VHOST
 	tristate
 	select VHOST_IOTLB
@@ -28,7 +37,7 @@ if VHOST_MENU
 
 config VHOST_NET
 	tristate "Host kernel accelerator for virtio net"
-	depends on NET && EVENTFD && (TUN || !TUN) && (TAP || !TAP)
+	depends on NET && EVENTFD && (TUN || !TUN) && (TAP || !TAP) && VHOST_DPN
 	select VHOST
 	---help---
 	  This kernel module can be loaded in host kernel to accelerate
@@ -40,7 +49,7 @@ config VHOST_NET
 
 config VHOST_SCSI
 	tristate "VHOST_SCSI TCM fabric driver"
-	depends on TARGET_CORE && EVENTFD
+	depends on TARGET_CORE && EVENTFD && VHOST_DPN
 	select VHOST
 	default n
 	---help---
@@ -49,7 +58,7 @@ config VHOST_SCSI
 
 config VHOST_VSOCK
 	tristate "vhost virtio-vsock driver"
-	depends on VSOCKETS && EVENTFD
+	depends on VSOCKETS && EVENTFD && VHOST_DPN
 	select VHOST
 	select VIRTIO_VSOCKETS_COMMON
 	default n
@@ -63,7 +72,7 @@ config VHOST_VSOCK
 
 config VHOST_VDPA
 	tristate "Vhost driver for vDPA-based backend"
-	depends on EVENTFD
+	depends on EVENTFD && VHOST_DPN
 	select VHOST
 	depends on VDPA
 	help
-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
