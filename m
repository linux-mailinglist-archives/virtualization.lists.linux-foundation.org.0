Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B511A5E95
	for <lists.virtualization@lfdr.de>; Sun, 12 Apr 2020 14:51:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8793B85EC0;
	Sun, 12 Apr 2020 12:51:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jy4pAigeuF1r; Sun, 12 Apr 2020 12:51:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id CBB2D85C67;
	Sun, 12 Apr 2020 12:51:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9700DC1D89;
	Sun, 12 Apr 2020 12:51:02 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 60E4FC0172
 for <virtualization@lists.linux-foundation.org>;
 Sun, 12 Apr 2020 12:51:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 4B89C85C9E
 for <virtualization@lists.linux-foundation.org>;
 Sun, 12 Apr 2020 12:51:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AFQxgYClIZ4L
 for <virtualization@lists.linux-foundation.org>;
 Sun, 12 Apr 2020 12:51:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 7D38F853B9
 for <virtualization@lists.linux-foundation.org>;
 Sun, 12 Apr 2020 12:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586695859;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=J+P6WFvAHjtNNYxSujhikQ/SLnkXm6oAjgZY+UpbQI8=;
 b=YxAuh2Vvl0KJx8xKNIA/PD5TijePMZZWdMc9FSF4TkCygt9UceKToKcg6nvyqVXSMvDqVs
 rDuoPgTTjLzMXGpkcB/VLMBrsnsKDWAeRZfGJGopNiBWbYeoC5y+uJmCuWRxEjznOzgE+I
 LEgtK96jWN6fRT+qRyYfFFnjSqKUBxs=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-148-kxDJLj0HNY2IxU7x3JZT7Q-1; Sun, 12 Apr 2020 08:50:56 -0400
X-MC-Unique: kxDJLj0HNY2IxU7x3JZT7Q-1
Received: by mail-wr1-f69.google.com with SMTP id t8so4875275wrq.22
 for <virtualization@lists.linux-foundation.org>;
 Sun, 12 Apr 2020 05:50:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=J+P6WFvAHjtNNYxSujhikQ/SLnkXm6oAjgZY+UpbQI8=;
 b=d2ljQoQ3U/PbRe1/NrUrq3+YDSrW94gSlsVU2ywzEwL2KikACtG7t/Bsa9KuMJco92
 WyVAPvPZoPZpHa+3gY9G5b4eE9a8Vsaf/xuSfx9VtLYDAvzveu6qgQFT7BEXCuIB8KKo
 FenjYF++f9sTil9Vja+f0MkdDjbL10nj7Rg7bAYEsdaRh4FdWI9GCWWspOes+1tVWnaF
 cd1ReSai83S3fbXKjb3y/oOEo3mtCR/3A/VxBQkhGxnhGivPW83Dy4YXOTIKXyzoH+l+
 KQqVbo+CkDVbuIDm85NnUXcg53qLROrDjlgUaVKFJNQUDwSCmu4oRZxWwOwdafSLtaCR
 I8hw==
X-Gm-Message-State: AGi0PubntY5IZ0UEVHQsKENqoOXlGs/cAKbQyFf2gO8YwSg7mDslaPVc
 RQnoJoL+L1FdQE3ag5Yyx5Oty37HpqD75whwNBW+PlMEWdDIGPxzVu69AadWVk8ZV737j8cA+74
 KHtjoowkZpDEHPG47/7qhpO8d0dxssFI8xUzGOda9tA==
X-Received: by 2002:adf:ed01:: with SMTP id a1mr14380001wro.18.1586695855350; 
 Sun, 12 Apr 2020 05:50:55 -0700 (PDT)
X-Google-Smtp-Source: APiQypIUhlFj+KOcSj2QR37FIgHBt0IwiNyC4XwCoIuZzbiBL5BykeS8EPIx8I2HyZxUPmIjnjTv0Q==
X-Received: by 2002:adf:ed01:: with SMTP id a1mr14379984wro.18.1586695855098; 
 Sun, 12 Apr 2020 05:50:55 -0700 (PDT)
Received: from redhat.com (bzq-79-183-51-3.red.bezeqint.net. [79.183.51.3])
 by smtp.gmail.com with ESMTPSA id b11sm10866184wrq.26.2020.04.12.05.50.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Apr 2020 05:50:54 -0700 (PDT)
Date: Sun, 12 Apr 2020 08:50:52 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2] vdpa: make vhost, virtio depend on menu
Message-ID: <20200412125018.74964-1-mst@redhat.com>
MIME-Version: 1.0
X-Mailer: git-send-email 2.24.1.751.gd10ce2899c
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: netdev@vger.kernel.org, kvm@vger.kernel.org,
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

If user did not configure any vdpa drivers, neither vhost
nor virtio vdpa are going to be useful. So there's no point
in prompting for these and selecting vdpa core automatically.
Simplify configuration by making virtio and vhost vdpa
drivers depend on vdpa menu entry. Once done, we no longer
need a separate menu entry, so also get rid of this.
While at it, fix up the IFC entry: VDPA->vDPA for consistency
with other places.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---

changes from v1:
	fix up virtio vdpa Kconfig

 drivers/vdpa/Kconfig   | 16 +++++-----------
 drivers/vhost/Kconfig  |  2 +-
 drivers/virtio/Kconfig |  2 +-
 3 files changed, 7 insertions(+), 13 deletions(-)

diff --git a/drivers/vdpa/Kconfig b/drivers/vdpa/Kconfig
index d0cb0e583a5d..71d9a64f2c7d 100644
--- a/drivers/vdpa/Kconfig
+++ b/drivers/vdpa/Kconfig
@@ -1,21 +1,16 @@
 # SPDX-License-Identifier: GPL-2.0-only
-config VDPA
-	tristate
+menuconfig VDPA
+	tristate "vDPA drivers"
 	help
 	  Enable this module to support vDPA device that uses a
 	  datapath which complies with virtio specifications with
 	  vendor specific control path.
 
-menuconfig VDPA_MENU
-	bool "VDPA drivers"
-	default n
-
-if VDPA_MENU
+if VDPA
 
 config VDPA_SIM
 	tristate "vDPA device simulator"
 	depends on RUNTIME_TESTING_MENU && HAS_DMA
-	select VDPA
 	select VHOST_RING
 	select VHOST_IOTLB
 	default n
@@ -25,9 +20,8 @@ config VDPA_SIM
 	  development of vDPA.
 
 config IFCVF
-	tristate "Intel IFC VF VDPA driver"
+	tristate "Intel IFC VF vDPA driver"
 	depends on PCI_MSI
-	select VDPA
 	default n
 	help
 	  This kernel module can drive Intel IFC VF NIC to offload
@@ -35,4 +29,4 @@ config IFCVF
 	  To compile this driver as a module, choose M here: the module will
 	  be called ifcvf.
 
-endif # VDPA_MENU
+endif # VDPA
diff --git a/drivers/vhost/Kconfig b/drivers/vhost/Kconfig
index cb6b17323eb2..e79cbbdfea45 100644
--- a/drivers/vhost/Kconfig
+++ b/drivers/vhost/Kconfig
@@ -64,7 +64,7 @@ config VHOST_VDPA
 	tristate "Vhost driver for vDPA-based backend"
 	depends on EVENTFD
 	select VHOST
-	select VDPA
+	depends on VDPA
 	help
 	  This kernel module can be loaded in host kernel to accelerate
 	  guest virtio devices with the vDPA-based backends.
diff --git a/drivers/virtio/Kconfig b/drivers/virtio/Kconfig
index 2aadf398d8cc..395c3f4d49cb 100644
--- a/drivers/virtio/Kconfig
+++ b/drivers/virtio/Kconfig
@@ -45,7 +45,7 @@ config VIRTIO_PCI_LEGACY
 
 config VIRTIO_VDPA
 	tristate "vDPA driver for virtio devices"
-	select VDPA
+	depends on VDPA
 	select VIRTIO
 	help
 	  This driver provides support for virtio based paravirtual
-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
