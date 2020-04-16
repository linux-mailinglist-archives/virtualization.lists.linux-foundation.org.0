Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id A54E81AD2C5
	for <lists.virtualization@lfdr.de>; Fri, 17 Apr 2020 00:20:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0592F87F3F;
	Thu, 16 Apr 2020 22:20:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id laXjGptFIJrk; Thu, 16 Apr 2020 22:20:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5DA8487E27;
	Thu, 16 Apr 2020 22:20:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 42FF4C0172;
	Thu, 16 Apr 2020 22:20:49 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 72147C0172
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Apr 2020 22:20:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 689CA8604A
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Apr 2020 22:20:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id diqR6TBoajEH
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Apr 2020 22:20:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id CAC5085FDE
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Apr 2020 22:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587075634;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=LKcXo+p/uaeU/hsHRyKbdRNMgG4/p28XvmGbqiu1vto=;
 b=dOZzcdvTG/kq0rjyejkakZQpi4LHvNjir2fnFR/oCyczBLD0gqpkftyQZo6f8Zzi7Da0yj
 HdxYXpQlowfQH2/NGVMJxCH1OFGW6uepEriqdOqlX6P5lOyeu3YYfmFDhTrGyQsm5GRgdP
 w80JrTlPWQoQkFlhUbjxHEFy7KzmzeI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-211-pKyJ8XOmOB66JnwcS4kdBg-1; Thu, 16 Apr 2020 18:20:24 -0400
X-MC-Unique: pKyJ8XOmOB66JnwcS4kdBg-1
Received: by mail-wr1-f69.google.com with SMTP id a3so2483779wro.1
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Apr 2020 15:20:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=LKcXo+p/uaeU/hsHRyKbdRNMgG4/p28XvmGbqiu1vto=;
 b=hAKFom+wJ609Ym3yHtz9mSMDQ33sRr9MaAuapra4BMM2fdde068TNnLsWf0AJ6dqhr
 /Fmj88GVjv/93gDxSkXJislEPBItsOZokdyGQrlPtmadoY92ZDIhYug0DsmN/lRVo2mk
 zrwjh1OSBtLGZI/3Y3XJaGCPpA6RrCIDUenSC2Agg7Ay1fjnHPLvfpfeCstfrYWlwHqG
 DVEPv0va50+75CRuvLg1fTU8fKBI2L9mvwTHmst4Dv8UrG3KseCxoGg+SMJgOiuswPar
 fpoVxp9QWZMbt3+hiH3CDcClh+tbltoMMyE8m4stPouDLFaEbn9MxvvPp1ddHtwN0EIS
 1U6A==
X-Gm-Message-State: AGi0PuYCb03TOzLwpkZfhB1gO5mPLyA1v77b6qhqWpjs/4rNz+LSfyPP
 OuWqUMy6BRmVtl35SmWVcdqVse5Xliht3axSpN0Xwa58MzNjgAzB/gaytDwTylsK8lLzvG+Raro
 uVUGUW66F7snnNrPrgch519OllqWK+/oCTTvwUNzesA==
X-Received: by 2002:a7b:c955:: with SMTP id i21mr43715wml.25.1587075622981;
 Thu, 16 Apr 2020 15:20:22 -0700 (PDT)
X-Google-Smtp-Source: APiQypLTMzBiCaoZdbA9StOEic7q7PuNDUniFaAXDS0fu05xLaJzs2UfTHwtFzY0cbIA235H0bagiw==
X-Received: by 2002:a7b:c955:: with SMTP id i21mr43692wml.25.1587075622724;
 Thu, 16 Apr 2020 15:20:22 -0700 (PDT)
Received: from redhat.com (bzq-79-183-51-3.red.bezeqint.net. [79.183.51.3])
 by smtp.gmail.com with ESMTPSA id g186sm5712499wmg.36.2020.04.16.15.20.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Apr 2020 15:20:22 -0700 (PDT)
Date: Thu, 16 Apr 2020 18:20:20 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3] vhost: disable for OABI
Message-ID: <20200416221902.5801-1-mst@redhat.com>
MIME-Version: 1.0
X-Mailer: git-send-email 2.24.1.751.gd10ce2899c
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Richard Earnshaw <Richard.Earnshaw@arm.com>, kvm@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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

The reason is that that uses apcs-gnu which is the ancient OABI that is been
deprecated for a long time.

Given that virtio support on such ancient systems is not needed in the
first place, let's just add something along the lines of

	depends on !ARM || AEABI

to the virtio Kconfig declaration, and add a comment that it has to do
with struct member alignment.

Note: we can't make VHOST and VHOST_RING themselves have
a dependency since these are selected. Add a new symbol for that.

Link: https://lore.kernel.org/r/20200406121233.109889-3-mst@redhat.com
Suggested-by: Ard Biesheuvel <ardb@kernel.org>
Suggested-by: Richard Earnshaw <Richard.Earnshaw@arm.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---

Changes from v2:
	- drop prompt from VHOST_DPN
	- typo fix in commit log
	- OABI is a possible ARM config but not the default one

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
index 71d9a64f2c7d..ee35f8261a88 100644
--- a/drivers/vdpa/Kconfig
+++ b/drivers/vdpa/Kconfig
@@ -10,7 +10,7 @@ if VDPA
 
 config VDPA_SIM
 	tristate "vDPA device simulator"
-	depends on RUNTIME_TESTING_MENU && HAS_DMA
+	depends on RUNTIME_TESTING_MENU && HAS_DMA && VHOST_DPN
 	select VHOST_RING
 	select VHOST_IOTLB
 	default n
diff --git a/drivers/vhost/Kconfig b/drivers/vhost/Kconfig
index e79cbbdfea45..d9b3a3ec765a 100644
--- a/drivers/vhost/Kconfig
+++ b/drivers/vhost/Kconfig
@@ -12,6 +12,15 @@ config VHOST_RING
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
@@ -27,7 +36,7 @@ if VHOST_MENU
 
 config VHOST_NET
 	tristate "Host kernel accelerator for virtio net"
-	depends on NET && EVENTFD && (TUN || !TUN) && (TAP || !TAP)
+	depends on NET && EVENTFD && (TUN || !TUN) && (TAP || !TAP) && VHOST_DPN
 	select VHOST
 	---help---
 	  This kernel module can be loaded in host kernel to accelerate
@@ -39,7 +48,7 @@ config VHOST_NET
 
 config VHOST_SCSI
 	tristate "VHOST_SCSI TCM fabric driver"
-	depends on TARGET_CORE && EVENTFD
+	depends on TARGET_CORE && EVENTFD && VHOST_DPN
 	select VHOST
 	default n
 	---help---
@@ -48,7 +57,7 @@ config VHOST_SCSI
 
 config VHOST_VSOCK
 	tristate "vhost virtio-vsock driver"
-	depends on VSOCKETS && EVENTFD
+	depends on VSOCKETS && EVENTFD && VHOST_DPN
 	select VHOST
 	select VIRTIO_VSOCKETS_COMMON
 	default n
@@ -62,7 +71,7 @@ config VHOST_VSOCK
 
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
