Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 82420199ED3
	for <lists.virtualization@lfdr.de>; Tue, 31 Mar 2020 21:19:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id F3C8586DE6;
	Tue, 31 Mar 2020 19:19:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y1c177OswG_8; Tue, 31 Mar 2020 19:19:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2289E86DE1;
	Tue, 31 Mar 2020 19:19:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 01794C07FF;
	Tue, 31 Mar 2020 19:19:43 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5BB99C07FF
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Mar 2020 19:19:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 5311186D01
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Mar 2020 19:19:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1lvo-3MZjg5j
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Mar 2020 19:19:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 154FA86CB3
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Mar 2020 19:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585682378;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=0IfbKcvIcmN0WMW+gq6VvzM1ouYbOK6lV9wgE4RKQWc=;
 b=dHA8mlbHtX0v1cGwCRSTQih37n0Hdhs48RmGj3OUzlGHCAoZd+1AWJJs7qVbIhK5JfDwtE
 WliWEzgAqArMdFn/lGHFFpA4/8zl2I8zWyBD8Xh5OK0YU7gCVIxFJH/J5glAO1AWUIb7A1
 22DChr2RyRHtsmYLGlMdfr8AdHgyLpQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-201-HqrgYJN2MaSWt_wOi80Cqw-1; Tue, 31 Mar 2020 15:19:37 -0400
X-MC-Unique: HqrgYJN2MaSWt_wOi80Cqw-1
Received: by mail-wr1-f69.google.com with SMTP id h14so13367312wrr.12
 for <virtualization@lists.linux-foundation.org>;
 Tue, 31 Mar 2020 12:19:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=0IfbKcvIcmN0WMW+gq6VvzM1ouYbOK6lV9wgE4RKQWc=;
 b=khnlZ6Y8kYw98yPMwciWbxPszu3rAA4qY5x1XkFEzOuXttALW4Yb6oQC4ROpUNhQqo
 bkewmEJER09kqTRM/dbhvP+GZctw+buGqyhdfhs1M1Xboycxi++ricY9Ri3kvGyvFIoy
 RYwWdJCN4y+phJrxjxiYLrvd0PoBfJ+DSoYacC2hiuGR3S3aHhMSUaXtcnwWpM6LzgxF
 OrwL7k8UvMId7c1L49JAYSJqc8Slv0iKCh3Dtz87KyVuHee3SSEDzpNxra2Du83PU+vf
 2nAoSSE0/NHbUgNZGaFL1GoAQc5c/PyMUTiXHsvp3GZGnDzKiLpnTD4PfGaBj+A7PTdQ
 YFpw==
X-Gm-Message-State: ANhLgQ3nXDitMtWGhw2ZZm9BH62ELLA9da59shwOgqexT+zGw0n4Moa7
 OV6e5RK2mG6MFJKnz3ZAfNcSq0Q4nGgbGFxltTjZg2NUV1eSJq9cCRVY9uw51Y7/H7kgHqw86lm
 YD9pBQ43xXnXRajaud7VwLxQgwCoDnjP1aUVqRYZa4g==
X-Received: by 2002:adf:a1d6:: with SMTP id v22mr22564891wrv.416.1585682376133; 
 Tue, 31 Mar 2020 12:19:36 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vu2xlJgmTza5dDHi7A+t9Wih6f98CSATtc1FXRvBFpYcTJRvETxc9Lb0w/9E67SGOaoydrTIw==
X-Received: by 2002:adf:a1d6:: with SMTP id v22mr22564872wrv.416.1585682375933; 
 Tue, 31 Mar 2020 12:19:35 -0700 (PDT)
Received: from redhat.com (bzq-79-176-51-222.red.bezeqint.net. [79.176.51.222])
 by smtp.gmail.com with ESMTPSA id y189sm5131865wmb.26.2020.03.31.12.19.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Mar 2020 12:19:35 -0700 (PDT)
Date: Tue, 31 Mar 2020 15:19:33 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] vdpa: move to drivers/vdpa
Message-ID: <20200331191825.249436-1-mst@redhat.com>
MIME-Version: 1.0
X-Mailer: git-send-email 2.24.1.751.gd10ce2899c
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Randy Dunlap <rdunlap@infradead.org>,
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

We have both vhost and virtio drivers that depend on vdpa.
It's easier to locate it at a top level directory otherwise
we run into issues e.g. if vhost is built-in but virtio
is modular.  Let's just move it up a level.

Reported-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---

Randy I'd say the issue you are reporting (vhost=y, virtio=m)
is esoteric enough not to require a rebase for this.
So I'd just apply this on top.
Do you agree?

 MAINTAINERS                                   | 1 +
 drivers/Kconfig                               | 2 ++
 drivers/Makefile                              | 1 +
 drivers/{virtio => }/vdpa/Kconfig             | 0
 drivers/{virtio => }/vdpa/Makefile            | 0
 drivers/{virtio => }/vdpa/ifcvf/Makefile      | 0
 drivers/{virtio => }/vdpa/ifcvf/ifcvf_base.c  | 0
 drivers/{virtio => }/vdpa/ifcvf/ifcvf_base.h  | 0
 drivers/{virtio => }/vdpa/ifcvf/ifcvf_main.c  | 0
 drivers/{virtio => }/vdpa/vdpa.c              | 0
 drivers/{virtio => }/vdpa/vdpa_sim/Makefile   | 0
 drivers/{virtio => }/vdpa/vdpa_sim/vdpa_sim.c | 0
 drivers/virtio/Kconfig                        | 2 --
 13 files changed, 4 insertions(+), 2 deletions(-)
 rename drivers/{virtio => }/vdpa/Kconfig (100%)
 rename drivers/{virtio => }/vdpa/Makefile (100%)
 rename drivers/{virtio => }/vdpa/ifcvf/Makefile (100%)
 rename drivers/{virtio => }/vdpa/ifcvf/ifcvf_base.c (100%)
 rename drivers/{virtio => }/vdpa/ifcvf/ifcvf_base.h (100%)
 rename drivers/{virtio => }/vdpa/ifcvf/ifcvf_main.c (100%)
 rename drivers/{virtio => }/vdpa/vdpa.c (100%)
 rename drivers/{virtio => }/vdpa/vdpa_sim/Makefile (100%)
 rename drivers/{virtio => }/vdpa/vdpa_sim/vdpa_sim.c (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 70c47bc55343..7cfa55c765fd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17695,6 +17695,7 @@ L:	virtualization@lists.linux-foundation.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/virtio/
 F:	drivers/virtio/
+F:	drivers/vdpa/
 F:	tools/virtio/
 F:	drivers/net/virtio_net.c
 F:	drivers/block/virtio_blk.c
diff --git a/drivers/Kconfig b/drivers/Kconfig
index 7a6d8b2b68b4..ac23d520e916 100644
--- a/drivers/Kconfig
+++ b/drivers/Kconfig
@@ -138,6 +138,8 @@ source "drivers/virt/Kconfig"
 
 source "drivers/virtio/Kconfig"
 
+source "drivers/vdpa/Kconfig"
+
 source "drivers/vhost/Kconfig"
 
 source "drivers/hv/Kconfig"
diff --git a/drivers/Makefile b/drivers/Makefile
index 31cf17dee252..21688f3b1588 100644
--- a/drivers/Makefile
+++ b/drivers/Makefile
@@ -42,6 +42,7 @@ obj-$(CONFIG_DMADEVICES)	+= dma/
 obj-y				+= soc/
 
 obj-$(CONFIG_VIRTIO)		+= virtio/
+obj-$(CONFIG_VDPA)		+= vdpa/
 obj-$(CONFIG_XEN)		+= xen/
 
 # regulators early, since some subsystems rely on them to initialize
diff --git a/drivers/virtio/vdpa/Kconfig b/drivers/vdpa/Kconfig
similarity index 100%
rename from drivers/virtio/vdpa/Kconfig
rename to drivers/vdpa/Kconfig
diff --git a/drivers/virtio/vdpa/Makefile b/drivers/vdpa/Makefile
similarity index 100%
rename from drivers/virtio/vdpa/Makefile
rename to drivers/vdpa/Makefile
diff --git a/drivers/virtio/vdpa/ifcvf/Makefile b/drivers/vdpa/ifcvf/Makefile
similarity index 100%
rename from drivers/virtio/vdpa/ifcvf/Makefile
rename to drivers/vdpa/ifcvf/Makefile
diff --git a/drivers/virtio/vdpa/ifcvf/ifcvf_base.c b/drivers/vdpa/ifcvf/ifcvf_base.c
similarity index 100%
rename from drivers/virtio/vdpa/ifcvf/ifcvf_base.c
rename to drivers/vdpa/ifcvf/ifcvf_base.c
diff --git a/drivers/virtio/vdpa/ifcvf/ifcvf_base.h b/drivers/vdpa/ifcvf/ifcvf_base.h
similarity index 100%
rename from drivers/virtio/vdpa/ifcvf/ifcvf_base.h
rename to drivers/vdpa/ifcvf/ifcvf_base.h
diff --git a/drivers/virtio/vdpa/ifcvf/ifcvf_main.c b/drivers/vdpa/ifcvf/ifcvf_main.c
similarity index 100%
rename from drivers/virtio/vdpa/ifcvf/ifcvf_main.c
rename to drivers/vdpa/ifcvf/ifcvf_main.c
diff --git a/drivers/virtio/vdpa/vdpa.c b/drivers/vdpa/vdpa.c
similarity index 100%
rename from drivers/virtio/vdpa/vdpa.c
rename to drivers/vdpa/vdpa.c
diff --git a/drivers/virtio/vdpa/vdpa_sim/Makefile b/drivers/vdpa/vdpa_sim/Makefile
similarity index 100%
rename from drivers/virtio/vdpa/vdpa_sim/Makefile
rename to drivers/vdpa/vdpa_sim/Makefile
diff --git a/drivers/virtio/vdpa/vdpa_sim/vdpa_sim.c b/drivers/vdpa/vdpa_sim/vdpa_sim.c
similarity index 100%
rename from drivers/virtio/vdpa/vdpa_sim/vdpa_sim.c
rename to drivers/vdpa/vdpa_sim/vdpa_sim.c
diff --git a/drivers/virtio/Kconfig b/drivers/virtio/Kconfig
index 99e424570644..2aadf398d8cc 100644
--- a/drivers/virtio/Kconfig
+++ b/drivers/virtio/Kconfig
@@ -109,5 +109,3 @@ config VIRTIO_MMIO_CMDLINE_DEVICES
 	 If unsure, say 'N'.
 
 endif # VIRTIO_MENU
-
-source "drivers/virtio/vdpa/Kconfig"
-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
