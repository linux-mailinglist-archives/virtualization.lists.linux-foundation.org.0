Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C501F18EF
	for <lists.virtualization@lfdr.de>; Mon,  8 Jun 2020 14:43:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 9A70A21538;
	Mon,  8 Jun 2020 12:43:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D+t5M0TpD2wC; Mon,  8 Jun 2020 12:43:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 39DF42155C;
	Mon,  8 Jun 2020 12:43:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EEEFEC016F;
	Mon,  8 Jun 2020 12:43:25 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 305E2C016F
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 12:43:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 1E62886DC5
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 12:43:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kCEcb6yfuoVM
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 12:43:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 4B18886DB2
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 12:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591620203;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=utvLOGjABWchDzVBBNcvjGgT0Uw4uVA8BCJYHrkDTYE=;
 b=Sis7YQTmLOEr9lcHIxHMHPNydPIJiBUNxGDke4ArM3JLj1ytHKQ8uIrPRqYpAOwohtzmUk
 0MOTMWl9l79yVBoMcbdEmyFf57Y5d9+OzF3RJ6z1mPqeYm1CfaaxWr61btdjXRlbIIusSb
 TeRsC7+wJPBbJ3+vfJGjuvxpz5yZa+E=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-163-IOzf5WyDPQSvLz5OseusBg-1; Mon, 08 Jun 2020 08:42:59 -0400
X-MC-Unique: IOzf5WyDPQSvLz5OseusBg-1
Received: by mail-wm1-f72.google.com with SMTP id r1so1538541wmh.7
 for <virtualization@lists.linux-foundation.org>;
 Mon, 08 Jun 2020 05:42:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=utvLOGjABWchDzVBBNcvjGgT0Uw4uVA8BCJYHrkDTYE=;
 b=YrMCS76e7J0lLnqW3kuOmZyX4c6IsPhJVsf4S6gnd/iwsbgya/WI8IDWNbT4UneyPD
 gvle92jNSk3HYAhfmLhOOrUsNE8saEqGfrBQ8S/RPLvdVZlSYvaWOE57eoCChZ1R8Hdq
 /E9XJAGC/cWauaMZ9KVOmXcY8Qyo7lXpTVZ4My4H/vZmRgNq6y4iwNxCT59DLpmo8c+D
 VcQV4X7cBX4hugJCn64iRb2U0APi5M8do+GFFTPxsfYhKmuGAL3c0K/vLpzKt9WIYBLg
 zca5ThxyO/zEZGI1XhwYbFU9HOb3E5act+9tl2Rb469+rTYpXNfTTIk0LuzSpnXVdg25
 HP8Q==
X-Gm-Message-State: AOAM532YevW9twj5eE/1jiPUSyZK8IzYPvmUGD93pKiAPXGNqKIauN+W
 iphDc6QGD9SLh8lPAoS/iCYtcUh/S/97rPTZxQE3xc2pmVUjOdQoybwwP8g9ojf0GVxiAu9tO+v
 NsMV0BNuZfETc9ShncAgXQ1hVfz0j1j3rsnMK++C7LQ==
X-Received: by 2002:a1c:5411:: with SMTP id i17mr17027054wmb.137.1591620178212; 
 Mon, 08 Jun 2020 05:42:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxxHCDKaiMql4q+MgfnmT9afh3wFAhLtf//8SgAbDqi4VLnsVn3wc/xBGn3Rmk2vnzUyPWpJw==
X-Received: by 2002:a1c:5411:: with SMTP id i17mr17027042wmb.137.1591620178029; 
 Mon, 08 Jun 2020 05:42:58 -0700 (PDT)
Received: from redhat.com (bzq-109-64-41-91.red.bezeqint.net. [109.64.41.91])
 by smtp.gmail.com with ESMTPSA id
 g82sm22458959wmf.1.2020.06.08.05.42.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 05:42:57 -0700 (PDT)
Date: Mon, 8 Jun 2020 08:42:56 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] vhost/test: fix up after API change
Message-ID: <20200608124254.727184-1-mst@redhat.com>
MIME-Version: 1.0
X-Mailer: git-send-email 2.24.1.751.gd10ce2899c
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: netdev@vger.kernel.org, Zhu Lingshan <lingshan.zhu@intel.com>,
 kvm@vger.kernel.org, virtualization@lists.linux-foundation.org
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

Pass a flag to request kernel thread use.

Fixes: 01fcb1cbc88e ("vhost: allow device that does not depend on vhost worker")
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 drivers/vhost/test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/vhost/test.c b/drivers/vhost/test.c
index f55cb584b84a..12304eb8da15 100644
--- a/drivers/vhost/test.c
+++ b/drivers/vhost/test.c
@@ -122,7 +122,7 @@ static int vhost_test_open(struct inode *inode, struct file *f)
 	vqs[VHOST_TEST_VQ] = &n->vqs[VHOST_TEST_VQ];
 	n->vqs[VHOST_TEST_VQ].handle_kick = handle_vq_kick;
 	vhost_dev_init(dev, vqs, VHOST_TEST_VQ_MAX, UIO_MAXIOV + 64,
-		       VHOST_TEST_PKT_WEIGHT, VHOST_TEST_WEIGHT, NULL);
+		       VHOST_TEST_PKT_WEIGHT, VHOST_TEST_WEIGHT, true, NULL);
 
 	f->private_data = n;
 
-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
