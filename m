Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 3152A16551B
	for <lists.virtualization@lfdr.de>; Thu, 20 Feb 2020 03:32:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id F361D2051F;
	Thu, 20 Feb 2020 02:32:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h3Pm7wW7tmGX; Thu, 20 Feb 2020 02:32:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id D33D2204A7;
	Thu, 20 Feb 2020 02:32:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B4AFDC1D89;
	Thu, 20 Feb 2020 02:32:06 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D3128C013E
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 Feb 2020 02:32:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id C016882063
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 Feb 2020 02:32:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id joNoQYQEf4cF
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 Feb 2020 02:32:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 by hemlock.osuosl.org (Postfix) with ESMTPS id ABFDB82261
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 Feb 2020 02:32:04 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id d9so1140075pgu.3
 for <virtualization@lists.linux-foundation.org>;
 Wed, 19 Feb 2020 18:32:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id;
 bh=zr5u8Chlfff2X4LtdmxMDdWIdJ3E6W1Jd7u1xAH1pgY=;
 b=YqLME2Upvbgry5x4ZwXh9NuaSkibHeECcLimobVcOq4rOxlslvdQi8bQpj47MPJpsT
 XZtF06I6/FVkWNuddpU0pb2IaHw9VWTjxq8wbM85XIePqlc8tqUew/GVhGEinnKRLCpz
 AswZ5COmSocVAf7kBzRzLtMgqRMw4d2zALjO31HxM/Bc97gieySrjgjX+Pr9z0JjyBz7
 zc009QD4iwZcjRkF0Rzk0AyezUcy1IwKYG3kAH1vvIXeFdiZo0yBCMuZYYcMtgM8xkq0
 a6GcBN8UlwayRhqvIdv5xrOXcR2p5NIBW9eDQjUc60ESzxdh2DbKy0NM3T43pDPM4SI3
 9kFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
 bh=zr5u8Chlfff2X4LtdmxMDdWIdJ3E6W1Jd7u1xAH1pgY=;
 b=Lz0PgCjiMaqS8RgFmNQiglXA887XN09AGMRmgpZqra9fuRjCXi0pLXM8/6iI3o0gFU
 XTDHLdIPNsLnFQa/uMtB7NNY43tqVTz/Fr7pvR3TJ5B9liGTDgx2r1pQJx8h88hsuiUg
 noNqNRd1fJrWH2sgZe+a0CB/xKDGi1KiIpS9cnGStX0QMkv0UWHtmdumDXqD5S/DVW6+
 34ojpQDZPnTdtdeaASIRncLtI5z0EXXq8t2J+OnstjaawfaAid0+NUGuNteC503izLWu
 GnbMNjvAVUSRqgwu6AeUHo3/F8WpaEh6EJYRuoJFBnnFeK1srvE6S/BWEQq39QVdNX7d
 zDLQ==
X-Gm-Message-State: APjAAAW+QtqhV9x4Y6E27hJyg+gfiW3zKVwuUHjobsLVcvRmunIjta6q
 jdQYARMBF60p/p1Il+HXJww=
X-Google-Smtp-Source: APXvYqyep9F5J3KoDhiCL/yaP5HvZoAj87AsHQagc3pwSgMRkO7tnGn55MApTjed/2XjmAO6L8mFMQ==
X-Received: by 2002:a63:8c5c:: with SMTP id q28mr30401414pgn.324.1582165924216; 
 Wed, 19 Feb 2020 18:32:04 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id l12sm1049427pgj.16.2020.02.19.18.32.02
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 19 Feb 2020 18:32:03 -0800 (PST)
From: Guenter Roeck <linux@roeck-us.net>
To: "Michael S . Tsirkin" <mst@redhat.com>
Subject: [PATCH] virtio_balloon: Fix build error seen with
 CONFIG_BALLOON_COMPACTION=n
Date: Wed, 19 Feb 2020 18:31:56 -0800
Message-Id: <20200220023156.20636-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.17.1
Cc: linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

0day reports:

drivers//virtio/virtio_balloon.c: In function 'virtballoon_probe':
drivers//virtio/virtio_balloon.c:960:1: error:
	label 'out_del_vqs' defined but not used [-Werror=unused-label]

This is seen with CONFIG_BALLOON_COMPACTION=n.

Reported-by: kbuild test robot <lkp@intel.com>
Fixes: 1ad6f58ea936 ("virtio_balloon: Fix memory leaks on errors in virtballoon_probe()")
Cc: David Hildenbrand <david@redhat.com>
Cc: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/virtio/virtio_balloon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/virtio/virtio_balloon.c b/drivers/virtio/virtio_balloon.c
index 7bfe365d9372..341458fd95ca 100644
--- a/drivers/virtio/virtio_balloon.c
+++ b/drivers/virtio/virtio_balloon.c
@@ -959,8 +959,8 @@ static int virtballoon_probe(struct virtio_device *vdev)
 	iput(vb->vb_dev_info.inode);
 out_kern_unmount:
 	kern_unmount(balloon_mnt);
-#endif
 out_del_vqs:
+#endif
 	vdev->config->del_vqs(vdev);
 out_free_vb:
 	kfree(vb);
-- 
2.17.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
