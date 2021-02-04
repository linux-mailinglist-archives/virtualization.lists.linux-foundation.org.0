Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id E971630F980
	for <lists.virtualization@lfdr.de>; Thu,  4 Feb 2021 18:23:49 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 92AEB86096;
	Thu,  4 Feb 2021 17:23:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ScVSKNfnDmzq; Thu,  4 Feb 2021 17:23:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2DDD686D2B;
	Thu,  4 Feb 2021 17:23:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 134C3C013A;
	Thu,  4 Feb 2021 17:23:25 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3D0F3C013A
 for <virtualization@lists.linux-foundation.org>;
 Thu,  4 Feb 2021 17:23:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 0EF8B275B0
 for <virtualization@lists.linux-foundation.org>;
 Thu,  4 Feb 2021 17:23:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GLM+C9mdhKfP
 for <virtualization@lists.linux-foundation.org>;
 Thu,  4 Feb 2021 17:23:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by silver.osuosl.org (Postfix) with ESMTPS id 347DA275A5
 for <virtualization@lists.linux-foundation.org>;
 Thu,  4 Feb 2021 17:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612459402;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gaOUQVR7Wx+SxzXq3TAALhEP5fcuShfQOmKenfaaVIY=;
 b=FhBuooRqHzyP6EnF9YwQdndL7ORQxx9WzMqkz5ZJ5PY1ykP05bifIqZGR9xMGPUFu0bEfQ
 vbXWwlocT0uxtWzSqWzesRpmY7y5JU2nPBa3MxYOYeJGudX3vnRJcMpvHntCiMrgCRpZmz
 nGMWuzXhHao8tWOqoLSxrrXx2+9dPmA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-582-p4l9wAVbNUSpywhcEUC-CA-1; Thu, 04 Feb 2021 12:23:20 -0500
X-MC-Unique: p4l9wAVbNUSpywhcEUC-CA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 74CE9425CB;
 Thu,  4 Feb 2021 17:23:19 +0000 (UTC)
Received: from steredhat.redhat.com (ovpn-113-213.ams2.redhat.com
 [10.36.113.213])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5024760937;
 Thu,  4 Feb 2021 17:23:17 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: virtualization@lists.linux-foundation.org
Subject: [PATCH v3 05/13] vringh: implement vringh_kiov_advance()
Date: Thu,  4 Feb 2021 18:22:22 +0100
Message-Id: <20210204172230.85853-6-sgarzare@redhat.com>
In-Reply-To: <20210204172230.85853-1-sgarzare@redhat.com>
References: <20210204172230.85853-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Cc: Laurent Vivier <lvivier@redhat.com>, Max Gurtovoy <mgurtovoy@nvidia.com>,
 kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 linux-kernel@vger.kernel.org, Xie Yongji <xieyongji@bytedance.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
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

In some cases, it may be useful to provide a way to skip a number
of bytes in a vringh_kiov.

Let's implement vringh_kiov_advance() for this purpose, reusing the
code from vringh_iov_xfer().
We replace that code calling the new vringh_kiov_advance().

Acked-by: Jason Wang <jasowang@redhat.com>
Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
 include/linux/vringh.h |  2 ++
 drivers/vhost/vringh.c | 41 +++++++++++++++++++++++++++++------------
 2 files changed, 31 insertions(+), 12 deletions(-)

diff --git a/include/linux/vringh.h b/include/linux/vringh.h
index 9c077863c8f6..755211ebd195 100644
--- a/include/linux/vringh.h
+++ b/include/linux/vringh.h
@@ -199,6 +199,8 @@ static inline void vringh_kiov_cleanup(struct vringh_kiov *kiov)
 	kiov->iov = NULL;
 }
 
+void vringh_kiov_advance(struct vringh_kiov *kiov, size_t len);
+
 int vringh_getdesc_kern(struct vringh *vrh,
 			struct vringh_kiov *riov,
 			struct vringh_kiov *wiov,
diff --git a/drivers/vhost/vringh.c b/drivers/vhost/vringh.c
index 2a88e087afd8..4af8fa259d65 100644
--- a/drivers/vhost/vringh.c
+++ b/drivers/vhost/vringh.c
@@ -75,6 +75,34 @@ static inline int __vringh_get_head(const struct vringh *vrh,
 	return head;
 }
 
+/**
+ * vringh_kiov_advance - skip bytes from vring_kiov
+ * @iov: an iov passed to vringh_getdesc_*() (updated as we consume)
+ * @len: the maximum length to advance
+ */
+void vringh_kiov_advance(struct vringh_kiov *iov, size_t len)
+{
+	while (len && iov->i < iov->used) {
+		size_t partlen = min(iov->iov[iov->i].iov_len, len);
+
+		iov->consumed += partlen;
+		iov->iov[iov->i].iov_len -= partlen;
+		iov->iov[iov->i].iov_base += partlen;
+
+		if (!iov->iov[iov->i].iov_len) {
+			/* Fix up old iov element then increment. */
+			iov->iov[iov->i].iov_len = iov->consumed;
+			iov->iov[iov->i].iov_base -= iov->consumed;
+
+			iov->consumed = 0;
+			iov->i++;
+		}
+
+		len -= partlen;
+	}
+}
+EXPORT_SYMBOL(vringh_kiov_advance);
+
 /* Copy some bytes to/from the iovec.  Returns num copied. */
 static inline ssize_t vringh_iov_xfer(struct vringh *vrh,
 				      struct vringh_kiov *iov,
@@ -95,19 +123,8 @@ static inline ssize_t vringh_iov_xfer(struct vringh *vrh,
 		done += partlen;
 		len -= partlen;
 		ptr += partlen;
-		iov->consumed += partlen;
-		iov->iov[iov->i].iov_len -= partlen;
-		iov->iov[iov->i].iov_base += partlen;
 
-		if (!iov->iov[iov->i].iov_len) {
-			/* Fix up old iov element then increment. */
-			iov->iov[iov->i].iov_len = iov->consumed;
-			iov->iov[iov->i].iov_base -= iov->consumed;
-
-			
-			iov->consumed = 0;
-			iov->i++;
-		}
+		vringh_kiov_advance(iov, partlen);
 	}
 	return done;
 }
-- 
2.29.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
