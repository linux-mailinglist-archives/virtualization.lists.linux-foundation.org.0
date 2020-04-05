Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC9C19E9D7
	for <lists.virtualization@lfdr.de>; Sun,  5 Apr 2020 10:14:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 00C1A87606;
	Sun,  5 Apr 2020 08:14:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HvlQm8POMOD6; Sun,  5 Apr 2020 08:14:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id ED078875DC;
	Sun,  5 Apr 2020 08:14:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C0C2AC0177;
	Sun,  5 Apr 2020 08:14:09 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4A56FC0177
 for <virtualization@lists.linux-foundation.org>;
 Sun,  5 Apr 2020 08:14:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 3F7E98593F
 for <virtualization@lists.linux-foundation.org>;
 Sun,  5 Apr 2020 08:14:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3U9taducHGlQ
 for <virtualization@lists.linux-foundation.org>;
 Sun,  5 Apr 2020 08:14:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 9C50185531
 for <virtualization@lists.linux-foundation.org>;
 Sun,  5 Apr 2020 08:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586074446;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=ouQfW90npHD033GMDM+a2FinSD7SQ9pCB41aFB2pv8M=;
 b=TF4MhJ8ilZ3z80sTnRyU8vqcXjxl5/ufWgK9Q9ebcq65MmGWE/zHOGqO81+0J9+uBQWPuw
 SmQsFhEBY0DjroWq0UQWiXhVch+tIZVeMlkAZqmS/gFJ74AsalcKVHQSzmeqUcYAYOx66g
 NKB7KBrTumYAJIPGUaJdvSl5UoeoOT4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-10--gS3on7jNRulJe-9xylklw-1; Sun, 05 Apr 2020 04:14:04 -0400
X-MC-Unique: -gS3on7jNRulJe-9xylklw-1
Received: by mail-wr1-f70.google.com with SMTP id t25so6114233wrb.16
 for <virtualization@lists.linux-foundation.org>;
 Sun, 05 Apr 2020 01:14:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=ouQfW90npHD033GMDM+a2FinSD7SQ9pCB41aFB2pv8M=;
 b=HnVZafmS8+PxpQEyTcQWpQyYDUq93gytG36VGKbA+i9CEq5JeGkMIDUgs3vGt/Aeiu
 PRiUSdJw0UYQW5JoOwGcclmlvF/FbDwej6zO4yfvbhUFKZBQVb9jQy0JxDygXzLPSIgr
 gSu+i3HaDWVk7p5iLomYjQBQkH4ZFqVx164pCBiTGMhno0AXx47PzSImXGrB9ap5mERE
 LsA/3zQ9zjdgZMHsBYSK/lS2FEJaVXdrZYI0I90SVVmgZ5CixKnzlzNkWyepWmsMGa+Y
 0F9NEXU37UF8gSYPGD4rrlnV1SgKrrVqGbx9UfyyIQ6qUuFbKjqF9YHV9V7bKVPUuwkO
 S1zQ==
X-Gm-Message-State: AGi0PubIThOOZljAS3IsoE5UQErXgchguiEIVb5jaZKpmlmL5TfjAhnb
 UOu0PSdI0XE/fDc2mq3a3F492LUDEAvg0daevITh9VHxeDPhpKzu51gh46/Tax2xqUJBKg8Ciwk
 ej2POQvk7WRH/N5dqV7up9xmMOPoni7Rx89qs+a/UQQ==
X-Received: by 2002:a1c:96cf:: with SMTP id
 y198mr16757527wmd.186.1586074443074; 
 Sun, 05 Apr 2020 01:14:03 -0700 (PDT)
X-Google-Smtp-Source: APiQypLsqstklH0xgI1XJZTMg34Svue6TUFMK2IJ5TbkAsLUDmWLphQPBmK7xc/ECUJgj3fwvYDLwg==
X-Received: by 2002:a1c:96cf:: with SMTP id
 y198mr16757512wmd.186.1586074442920; 
 Sun, 05 Apr 2020 01:14:02 -0700 (PDT)
Received: from redhat.com (bzq-79-176-51-222.red.bezeqint.net. [79.176.51.222])
 by smtp.gmail.com with ESMTPSA id h188sm5491054wme.8.2020.04.05.01.14.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Apr 2020 01:14:02 -0700 (PDT)
Date: Sun, 5 Apr 2020 04:14:00 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] vdpa-sim: depend on HAS_DMA
Message-ID: <20200405081355.2870-1-mst@redhat.com>
MIME-Version: 1.0
X-Mailer: git-send-email 2.24.1.751.gd10ce2899c
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: virtualization@lists.linux-foundation.org
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

set_dma_ops isn't available on all architectures:

        make ARCH=um
...

   drivers/vdpa/vdpa_sim/vdpa_sim.c: In function 'vdpasim_create':
>> drivers/vdpa/vdpa_sim/vdpa_sim.c:324:2: error: implicit declaration of function 'set_dma_ops'; did you mean 'set_groups'?
+[-Werror=implicit-function-declaration]
     set_dma_ops(dev, &vdpasim_dma_ops);
     ^~~~~~~~~~~
     set_groups

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 drivers/vdpa/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/vdpa/Kconfig b/drivers/vdpa/Kconfig
index 08b615f2da39..d0cb0e583a5d 100644
--- a/drivers/vdpa/Kconfig
+++ b/drivers/vdpa/Kconfig
@@ -14,7 +14,7 @@ if VDPA_MENU
 
 config VDPA_SIM
 	tristate "vDPA device simulator"
-	depends on RUNTIME_TESTING_MENU
+	depends on RUNTIME_TESTING_MENU && HAS_DMA
 	select VDPA
 	select VHOST_RING
 	select VHOST_IOTLB
-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
