Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id A646E130841
	for <lists.virtualization@lfdr.de>; Sun,  5 Jan 2020 14:22:20 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5697087884;
	Sun,  5 Jan 2020 13:22:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Tn0EKCAvPq1R; Sun,  5 Jan 2020 13:22:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id AAF8D864EF;
	Sun,  5 Jan 2020 13:22:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 70968C0881;
	Sun,  5 Jan 2020 13:22:18 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9FE49C0881
 for <virtualization@lists.linux-foundation.org>;
 Sun,  5 Jan 2020 13:22:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 8956A851A4
 for <virtualization@lists.linux-foundation.org>;
 Sun,  5 Jan 2020 13:22:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1yk242IQZy16
 for <virtualization@lists.linux-foundation.org>;
 Sun,  5 Jan 2020 13:22:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id AB28A85188
 for <virtualization@lists.linux-foundation.org>;
 Sun,  5 Jan 2020 13:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578230534;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=In+0vCYCUg5srKg9dQl7QsQxw+2F0g+Q33KWDu01COk=;
 b=bxbn9KHV6ZSn83bJ+czZDPwKqqKRpZIoL+/lSZzIGebsTaF1LniatIQCwBUKXXDJp+ykum
 tjAsT+wF7C9GIC0FIAMh82v4zq9+0rAuOQodDBhzA04eRB/lVq3pbBoo8jx0rkjhrnmh1U
 O8+IwDsQgSIWDp2a28yaN673TBHlnZU=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-246-ZJ_ZM4j4N6ac5ImvlX8A_w-1; Sun, 05 Jan 2020 08:22:12 -0500
Received: by mail-qv1-f69.google.com with SMTP id f16so33011572qvr.7
 for <virtualization@lists.linux-foundation.org>;
 Sun, 05 Jan 2020 05:22:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=In+0vCYCUg5srKg9dQl7QsQxw+2F0g+Q33KWDu01COk=;
 b=UpMhxmByRJUvCTvBsz5q7TDpCcnDUzVs43e0WCbGpxzB7+UJ0Gh+c5ihCZTNPcrMT2
 0VABOGUMnDbzmDDWb58pENmrBbxKAhOz7vOWHy4vBQytb+2GVz6h7cuX9JmMG8JhufM7
 YNGknOW/R+nb0JgRF1yc7NcTcI9FtTy3ZCtz2ijx0hbYLxglnNSWu9z8+kdglRNxdGLg
 6kGAvMgzLzJ1LMusz3UKTa7mcQbkSeUUBv8G5ooH5WXkgzJVteq42xqE9MkpCl1IJPBX
 mUBfCg4b4DE0aupVxzdgvFSQe/7OoT9B0f+jCRxKw3SyHn9xDRqo1SOQNpgTdyThOdkw
 ammQ==
X-Gm-Message-State: APjAAAUAi7veN3NJILgXfohgcRMh23pOh2P7dhtaWI/NI+vpHo2hQyme
 lU/suYVemCLEY7Oh2XpJf9j4ub6TmFfVT28ooC+ERZPsVhf7FUyhQQ2vvrTMpYtli2y3+F/GyQm
 8yj716JinU1Ikix/tzUzooNqwwnSi0MVoUlilwafJEQ==
X-Received: by 2002:a0c:f24a:: with SMTP id z10mr76733954qvl.33.1578230531869; 
 Sun, 05 Jan 2020 05:22:11 -0800 (PST)
X-Google-Smtp-Source: APXvYqxyUWCiAw1lxoCGQUnGp+u8A3Lfb79bSc8yodanv1kN0I5K95cgXC7zaFq0VLZPOw2HTPs0EQ==
X-Received: by 2002:a0c:f24a:: with SMTP id z10mr76733944qvl.33.1578230531679; 
 Sun, 05 Jan 2020 05:22:11 -0800 (PST)
Received: from redhat.com (bzq-79-183-34-164.red.bezeqint.net. [79.183.34.164])
 by smtp.gmail.com with ESMTPSA id g16sm19273900qkk.61.2020.01.05.05.22.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jan 2020 05:22:10 -0800 (PST)
Date: Sun, 5 Jan 2020 08:22:07 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2] virtio_net: CTRL_GUEST_OFFLOADS depends on CTRL_VQ
Message-ID: <20200105132120.92370-1-mst@redhat.com>
MIME-Version: 1.0
X-Mailer: git-send-email 2.24.1.751.gd10ce2899c
X-Mutt-Fcc: =sent
X-MC-Unique: ZJ_ZM4j4N6ac5ImvlX8A_w-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
Cc: Alistair Delva <adelva@google.com>,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, netdev@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 "David S. Miller" <davem@davemloft.net>
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

The only way for guest to control offloads (as enabled by
VIRTIO_NET_F_CTRL_GUEST_OFFLOADS) is by sending commands
through CTRL_VQ. So it does not make sense to
acknowledge VIRTIO_NET_F_CTRL_GUEST_OFFLOADS without
VIRTIO_NET_F_CTRL_VQ.

The spec does not outlaw devices with such a configuration, so we have
to support it. Simply clear VIRTIO_NET_F_CTRL_GUEST_OFFLOADS.
Note that Linux is still crashing if it tries to
change the offloads when there's no control vq.
That needs to be fixed by another patch.

Reported-by: Alistair Delva <adelva@google.com>
Reported-by: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Fixes: 3f93522ffab2 ("virtio-net: switch off offloads on demand if possible on XDP set")
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---

Same patch as v1 but update documentation so it's clear it's not
enough to fix the crash.

 drivers/net/virtio_net.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
index 4d7d5434cc5d..7b8805b47f0d 100644
--- a/drivers/net/virtio_net.c
+++ b/drivers/net/virtio_net.c
@@ -2971,6 +2971,15 @@ static int virtnet_validate(struct virtio_device *vdev)
 	if (!virtnet_validate_features(vdev))
 		return -EINVAL;
 
+	/* VIRTIO_NET_F_CTRL_GUEST_OFFLOADS does not work without
+	 * VIRTIO_NET_F_CTRL_VQ. Unfortunately spec forgot to
+	 * specify that VIRTIO_NET_F_CTRL_GUEST_OFFLOADS depends
+	 * on VIRTIO_NET_F_CTRL_VQ so devices can set the later but
+	 * not the former.
+	 */
+	if (!virtio_has_feature(vdev, VIRTIO_NET_F_CTRL_VQ))
+			__virtio_clear_bit(vdev, VIRTIO_NET_F_CTRL_GUEST_OFFLOADS);
+
 	if (virtio_has_feature(vdev, VIRTIO_NET_F_MTU)) {
 		int mtu = virtio_cread16(vdev,
 					 offsetof(struct virtio_net_config,
-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
