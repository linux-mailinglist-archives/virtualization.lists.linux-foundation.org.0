Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id C637919C3AD
	for <lists.virtualization@lfdr.de>; Thu,  2 Apr 2020 16:13:03 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 1DBA6214EC;
	Thu,  2 Apr 2020 14:13:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LefTY28gawk7; Thu,  2 Apr 2020 14:13:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 5960120529;
	Thu,  2 Apr 2020 14:13:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2A404C07FF;
	Thu,  2 Apr 2020 14:13:01 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 533DBC07FF
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Apr 2020 14:13:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 4CC9985A72
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Apr 2020 14:13:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GzIr1iW8kBlQ
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Apr 2020 14:12:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id DC43A857E2
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Apr 2020 14:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585836777;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=Lsas7jxJ1WMu8rRlGVbgJ8eIsxujsCQQeq8BgBAYBkI=;
 b=QuydfkPkaT5EqKrihALsPA4Hgbm80XmOiuqS+91eEkAr/IFCGIUPoHf1kaHsreszkfn4fd
 HdhRRiQxkLmfdeQ7jALZccT+C3eOmt/YCBYRcLaw5R0J9VOUuYu72U7wn3zVNnFWhBq+vg
 4p5mdQJirngAEwKEI9/463QxlpN0kWo=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-228-qGwPxvXkO-CkWmlEBHZSUg-1; Thu, 02 Apr 2020 10:12:55 -0400
X-MC-Unique: qGwPxvXkO-CkWmlEBHZSUg-1
Received: by mail-qv1-f72.google.com with SMTP id z4so2812708qvj.2
 for <virtualization@lists.linux-foundation.org>;
 Thu, 02 Apr 2020 07:12:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=Lsas7jxJ1WMu8rRlGVbgJ8eIsxujsCQQeq8BgBAYBkI=;
 b=g7+8vWeExnMhYua/3iZiOP8H6y6eJ18MUHSmd01aPPoyzlw2nnKZazU85Wj4JDdjGN
 /6FgYopJw11Cz422eJwMG4aMlqt2i1Wpl89/215PD4a1BIZbNvRCV05lkhwDFuuuG6/a
 lfEfcvRd6Oiafpy41h/aHmMnCUj0Y7q98pKfY/kbeyklnSM4ZDFKB3/y+pR2uQc/uPpj
 h/FP2SpM5LZzGibO1/LoNXLJZcI76QeQEM4+giC/MnKuRt2tKWEQAIPwKX36+fGYmlZM
 v72h96P3uq3npFEKGUIIKgpXa5/uxSRUQ7QkjcypiDvyobLmOgxkPgv7/GnyDVvvEdBN
 Okag==
X-Gm-Message-State: AGi0Pua96KBiOzWz+BMVVdL5O546AsACvMWVSJyIrxkOWh+ysQ/iMUG7
 Bv8hf9IsDpVMXd/GB3VBycm3Pk3mlmoBi1qp4UhF+GQdlbTERPjNmuZrUZPVC9FZIlByTdGu6rj
 1d8m2c4jd8esUuLCHW4PsxioVYpdG/SJ8Rv9cgRV1Cg==
X-Received: by 2002:a37:7c81:: with SMTP id x123mr3569408qkc.287.1585836775149; 
 Thu, 02 Apr 2020 07:12:55 -0700 (PDT)
X-Google-Smtp-Source: APiQypLfJWfDXTGKKPJbCvXgetpUrdL/5Wc33Wc2j+KEgqsWojCWykGbIs6gJg6z/V4LYFVIdSjzNQ==
X-Received: by 2002:a37:7c81:: with SMTP id x123mr3569380qkc.287.1585836774834; 
 Thu, 02 Apr 2020 07:12:54 -0700 (PDT)
Received: from redhat.com (bzq-79-176-51-222.red.bezeqint.net. [79.176.51.222])
 by smtp.gmail.com with ESMTPSA id b7sm3553494qkc.61.2020.04.02.07.12.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Apr 2020 07:12:53 -0700 (PDT)
Date: Thu, 2 Apr 2020 10:12:50 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] vhost: drop vring dependency on iotlb
Message-ID: <20200402141207.32628-1-mst@redhat.com>
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

vringh can now be built without IOTLB.
Select IOTLB directly where it's used.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---

This is on top of my previous patch (in vhost tree now).

 drivers/vdpa/Kconfig  | 1 +
 drivers/vhost/Kconfig | 1 -
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/vdpa/Kconfig b/drivers/vdpa/Kconfig
index 7db1460104b7..08b615f2da39 100644
--- a/drivers/vdpa/Kconfig
+++ b/drivers/vdpa/Kconfig
@@ -17,6 +17,7 @@ config VDPA_SIM
 	depends on RUNTIME_TESTING_MENU
 	select VDPA
 	select VHOST_RING
+	select VHOST_IOTLB
 	default n
 	help
 	  vDPA networking device simulator which loop TX traffic back
diff --git a/drivers/vhost/Kconfig b/drivers/vhost/Kconfig
index 21feea0d69c9..bdd270fede26 100644
--- a/drivers/vhost/Kconfig
+++ b/drivers/vhost/Kconfig
@@ -6,7 +6,6 @@ config VHOST_IOTLB
 
 config VHOST_RING
 	tristate
-	select VHOST_IOTLB
 	help
 	  This option is selected by any driver which needs to access
 	  the host side of a virtio ring.
-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
