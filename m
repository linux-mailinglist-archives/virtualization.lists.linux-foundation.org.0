Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B2A62B1F54
	for <lists.virtualization@lfdr.de>; Fri, 13 Nov 2020 16:57:21 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id D87DB878F6;
	Fri, 13 Nov 2020 15:57:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2HvDWyJ6jnxb; Fri, 13 Nov 2020 15:57:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6F883878EF;
	Fri, 13 Nov 2020 15:57:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4F50EC0800;
	Fri, 13 Nov 2020 15:57:19 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 65AA7C0800
 for <virtualization@lists.linux-foundation.org>;
 Fri, 13 Nov 2020 15:57:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 5426287516
 for <virtualization@lists.linux-foundation.org>;
 Fri, 13 Nov 2020 15:57:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JgnSZ3Op+cbv
 for <virtualization@lists.linux-foundation.org>;
 Fri, 13 Nov 2020 15:57:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by hemlock.osuosl.org (Postfix) with ESMTPS id BE3BE874EB
 for <virtualization@lists.linux-foundation.org>;
 Fri, 13 Nov 2020 15:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605283035;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=60wJj95OB0HMoxRPwUZqpPdQUOWeJPZmog9M4skpc20=;
 b=IYrDgPJcuLF6w+Oq9TfceCa4wZaO28wig4kavSHNMo/VpdllfoAGNVvNTITUZ4UxYo+tPi
 KP19riRYbMKSCjRutW9fVuOnI6ZYICzxzs2KYcVtcES26fV4LNXtt8SRe+HD9mJMdwu70+
 ST07xNPebKL0t2BJV+mxGSxmYe7hMJ4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-403--STiG3t2NrKA4VtThMO5tw-1; Fri, 13 Nov 2020 10:57:13 -0500
X-MC-Unique: -STiG3t2NrKA4VtThMO5tw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D357C1868401;
 Fri, 13 Nov 2020 15:57:12 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-113-83.ams2.redhat.com [10.36.113.83])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4364710013BD;
 Fri, 13 Nov 2020 15:57:08 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] vdpasim: fix "mac_pton" undefined error
Date: Fri, 13 Nov 2020 16:57:06 +0100
Message-Id: <20201113155706.599434-1-lvivier@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Cc: Laurent Vivier <lvivier@redhat.com>,
 virtualization@lists.linux-foundation.org, kernel test robot <lkp@intel.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
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

   ERROR: modpost: "mac_pton" [drivers/vdpa/vdpa_sim/vdpa_sim.ko] undefined!

mac_pton() is defined in lib/net_utils.c and is not built if NET is not set.

Select GENERIC_NET_UTILS as vdpasim doesn't depend on NET.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 drivers/vdpa/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/vdpa/Kconfig b/drivers/vdpa/Kconfig
index d7d32b656102..358f6048dd3c 100644
--- a/drivers/vdpa/Kconfig
+++ b/drivers/vdpa/Kconfig
@@ -13,6 +13,7 @@ config VDPA_SIM
 	depends on RUNTIME_TESTING_MENU && HAS_DMA
 	select DMA_OPS
 	select VHOST_RING
+	select GENERIC_NET_UTILS
 	default n
 	help
 	  vDPA networking device simulator which loop TX traffic back
-- 
2.28.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
