Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id BBCD740F435
	for <lists.virtualization@lfdr.de>; Fri, 17 Sep 2021 10:34:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6AA8C406CA;
	Fri, 17 Sep 2021 08:34:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Lchdiqov2aSr; Fri, 17 Sep 2021 08:34:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 366D1407F1;
	Fri, 17 Sep 2021 08:34:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BE15FC001E;
	Fri, 17 Sep 2021 08:34:33 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5E034C000D
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Sep 2021 08:34:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 400E7608DA
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Sep 2021 08:34:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s6_LOoGYJThM
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Sep 2021 08:34:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A3E3E60890
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Sep 2021 08:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631867670;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=mRvAXPuRtiVqIbpRHkAvC3odeA7PfoFZ93jl+i/JzVM=;
 b=bMZKrX9kZ6wlBOE0wcjyf/Bx/3+ZwCFe/I4LvtsIQQwQ/Jk8BXbS+/M9BD5k4ZFqo+CrkN
 lm3dwetv2O83RY6kHRfV/htj4QUQnAWxhX8MfPtYweUxQylhvIfjZGxyylFUtZpNNX8Qa4
 bC0h4wlpUE4FnGM4A3+SlQm1cCkrJKQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-296-wt9JcRDnMlChs4kvkhcd6g-1; Fri, 17 Sep 2021 04:34:29 -0400
X-MC-Unique: wt9JcRDnMlChs4kvkhcd6g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 480F01006AAA;
 Fri, 17 Sep 2021 08:34:27 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-234.pek2.redhat.com
 [10.72.12.234])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5B42A60C82;
 Fri, 17 Sep 2021 08:34:08 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com, jasowang@redhat.com,
 virtualization@lists.linux-foundation.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH net] virtio-net: fix pages leaking when building skb in big
 mode
Date: Fri, 17 Sep 2021 16:34:06 +0800
Message-Id: <20210917083406.75602-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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

We try to use build_skb() if we had sufficient tailroom. But we forget
to release the unused pages chained via private in big mode which will
leak pages. Fixing this by release the pages after building the skb in
big mode.

Cc: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Fixes: fb32856b16ad ("virtio-net: page_to_skb() use build_skb when there's sufficient tailroom")
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 drivers/net/virtio_net.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
index 271d38c1d9f8..79bd2585ec6b 100644
--- a/drivers/net/virtio_net.c
+++ b/drivers/net/virtio_net.c
@@ -423,6 +423,10 @@ static struct sk_buff *page_to_skb(struct virtnet_info *vi,
 
 		skb_reserve(skb, p - buf);
 		skb_put(skb, len);
+
+		page = (struct page *)page->private;
+		if (page)
+			give_pages(rq, page);
 		goto ok;
 	}
 
-- 
2.25.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
