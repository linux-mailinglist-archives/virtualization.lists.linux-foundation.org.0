Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 1549D649ABF
	for <lists.virtualization@lfdr.de>; Mon, 12 Dec 2022 10:10:51 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 47D6A81366;
	Mon, 12 Dec 2022 09:10:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 47D6A81366
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FfpnJJZm
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rU7Rj7UO1OIT; Mon, 12 Dec 2022 09:10:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 2F4128135E;
	Mon, 12 Dec 2022 09:10:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F4128135E
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8714AC0035;
	Mon, 12 Dec 2022 09:10:47 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A497FC002D
 for <virtualization@lists.linux-foundation.org>;
 Mon, 12 Dec 2022 09:10:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8491660AC0
 for <virtualization@lists.linux-foundation.org>;
 Mon, 12 Dec 2022 09:10:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8491660AC0
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=FfpnJJZm
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SsIbAXSrM74y
 for <virtualization@lists.linux-foundation.org>;
 Mon, 12 Dec 2022 09:10:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AFAFF60A93
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AFAFF60A93
 for <virtualization@lists.linux-foundation.org>;
 Mon, 12 Dec 2022 09:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670836241;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=js5jlF3yTN3u8DK/CNDR5RCWPJzXAeH4KJeogte/M2c=;
 b=FfpnJJZm+F3ftYmlbcNGiaRzNZdfoaFSHUoRWa2WxztF6bnEx1p5Fv64lsGikZNzMgfGnP
 lq5B0TySMtxhaWa3TOmP5Efwn+VFQiSdgrliSYsRui4dGbKZZc0L/MXFSjzuPVxQYJfieK
 KW8/xsVufM0CZX/BHzFOItk3bbZDJxQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-210-RVzAPNIxNYiHJkzms2wBpw-1; Mon, 12 Dec 2022 04:10:36 -0500
X-MC-Unique: RVzAPNIxNYiHJkzms2wBpw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0159B81173A;
 Mon, 12 Dec 2022 09:10:36 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-186.pek2.redhat.com
 [10.72.12.186])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3082B2166B26;
 Mon, 12 Dec 2022 09:10:31 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com, jasowang@redhat.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com
Subject: [PATCH net] virtio-net: correctly enable callback during start_xmit
Date: Mon, 12 Dec 2022 17:10:29 +0800
Message-Id: <20221212091029.54390-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
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

Commit a7766ef18b33("virtio_net: disable cb aggressively") enables
virtqueue callback via the following statement:

        do {
           ......
	} while (use_napi && kick &&
               unlikely(!virtqueue_enable_cb_delayed(sq->vq)));

This will cause a missing call to virtqueue_enable_cb_delayed() when
kick is false. Fixing this by removing the checking of the kick from
the condition to make sure callback is enabled correctly.

Fixes: a7766ef18b33 ("virtio_net: disable cb aggressively")
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
The patch is needed for -stable.
---
 drivers/net/virtio_net.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
index 86e52454b5b5..44d7daf0267b 100644
--- a/drivers/net/virtio_net.c
+++ b/drivers/net/virtio_net.c
@@ -1834,8 +1834,8 @@ static netdev_tx_t start_xmit(struct sk_buff *skb, struct net_device *dev)
 
 		free_old_xmit_skbs(sq, false);
 
-	} while (use_napi && kick &&
-	       unlikely(!virtqueue_enable_cb_delayed(sq->vq)));
+	} while (use_napi &&
+		 unlikely(!virtqueue_enable_cb_delayed(sq->vq)));
 
 	/* timestamp packet in software */
 	skb_tx_timestamp(skb);
-- 
2.25.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
