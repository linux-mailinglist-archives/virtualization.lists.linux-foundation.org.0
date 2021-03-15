Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id D5CDB33C205
	for <lists.virtualization@lfdr.de>; Mon, 15 Mar 2021 17:35:46 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7F04B41503;
	Mon, 15 Mar 2021 16:35:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ccIIrC-MlWmE; Mon, 15 Mar 2021 16:35:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id 57F3F4310B;
	Mon, 15 Mar 2021 16:35:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0653CC0001;
	Mon, 15 Mar 2021 16:35:44 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DB243C0001
 for <virtualization@lists.linux-foundation.org>;
 Mon, 15 Mar 2021 16:35:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C93EE47E3B
 for <virtualization@lists.linux-foundation.org>;
 Mon, 15 Mar 2021 16:35:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vODeFqKsNdvI
 for <virtualization@lists.linux-foundation.org>;
 Mon, 15 Mar 2021 16:35:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DFD3A4954E
 for <virtualization@lists.linux-foundation.org>;
 Mon, 15 Mar 2021 16:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615826140;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yS6yhrkWA8GbBenFIxogYtiFYE6uOSKcO/K046TS5vQ=;
 b=C7KIbyXN3Mx94b7ZUcpVBjntTGDj6OayjUu5h6UDSvTckJ23PjnR0hjdS8ENicZwAnbJh7
 VpMGvwOj+5OWwwmM8OUfjilG7Qzm2q8eXMWRyYLlPGTO+Qs4fWadvJ5nXCrbR/XadmZWNG
 8AC+aaSSDSe9mUS7xTx/7lpyMBeCIRQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-356-3PfeEznlOUi2AgTM_nG-EA-1; Mon, 15 Mar 2021 12:35:39 -0400
X-MC-Unique: 3PfeEznlOUi2AgTM_nG-EA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A0B5C800C78;
 Mon, 15 Mar 2021 16:35:37 +0000 (UTC)
Received: from steredhat.redhat.com (ovpn-114-1.ams2.redhat.com [10.36.114.1])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 376F72C169;
 Mon, 15 Mar 2021 16:35:29 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: virtualization@lists.linux-foundation.org
Subject: [PATCH v4 04/14] vringh: explain more about cleaning riov and wiov
Date: Mon, 15 Mar 2021 17:34:40 +0100
Message-Id: <20210315163450.254396-5-sgarzare@redhat.com>
In-Reply-To: <20210315163450.254396-1-sgarzare@redhat.com>
References: <20210315163450.254396-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Cc: Laurent Vivier <lvivier@redhat.com>, Max Gurtovoy <mgurtovoy@nvidia.com>,
 kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Xie Yongji <xieyongji@bytedance.com>, Stefan Hajnoczi <stefanha@redhat.com>
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

riov and wiov can be reused with subsequent calls of vringh_getdesc_*().

Let's add a paragraph in the documentation of these functions to better
explain when riov and wiov need to be cleaned up.

Acked-by: Jason Wang <jasowang@redhat.com>
Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
 drivers/vhost/vringh.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/vhost/vringh.c b/drivers/vhost/vringh.c
index bee63d68201a..2a88e087afd8 100644
--- a/drivers/vhost/vringh.c
+++ b/drivers/vhost/vringh.c
@@ -662,7 +662,10 @@ EXPORT_SYMBOL(vringh_init_user);
  * *head will be vrh->vring.num.  You may be able to ignore an invalid
  * descriptor, but there's not much you can do with an invalid ring.
  *
- * Note that you may need to clean up riov and wiov, even on error!
+ * Note that you can reuse riov and wiov with subsequent calls. Content is
+ * overwritten and memory reallocated if more space is needed.
+ * When you don't have to use riov and wiov anymore, you should clean up them
+ * calling vringh_iov_cleanup() to release the memory, even on error!
  */
 int vringh_getdesc_user(struct vringh *vrh,
 			struct vringh_iov *riov,
@@ -932,7 +935,10 @@ EXPORT_SYMBOL(vringh_init_kern);
  * *head will be vrh->vring.num.  You may be able to ignore an invalid
  * descriptor, but there's not much you can do with an invalid ring.
  *
- * Note that you may need to clean up riov and wiov, even on error!
+ * Note that you can reuse riov and wiov with subsequent calls. Content is
+ * overwritten and memory reallocated if more space is needed.
+ * When you don't have to use riov and wiov anymore, you should clean up them
+ * calling vringh_kiov_cleanup() to release the memory, even on error!
  */
 int vringh_getdesc_kern(struct vringh *vrh,
 			struct vringh_kiov *riov,
@@ -1292,7 +1298,10 @@ EXPORT_SYMBOL(vringh_set_iotlb);
  * *head will be vrh->vring.num.  You may be able to ignore an invalid
  * descriptor, but there's not much you can do with an invalid ring.
  *
- * Note that you may need to clean up riov and wiov, even on error!
+ * Note that you can reuse riov and wiov with subsequent calls. Content is
+ * overwritten and memory reallocated if more space is needed.
+ * When you don't have to use riov and wiov anymore, you should clean up them
+ * calling vringh_kiov_cleanup() to release the memory, even on error!
  */
 int vringh_getdesc_iotlb(struct vringh *vrh,
 			 struct vringh_kiov *riov,
-- 
2.30.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
