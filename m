Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2BB2B1C23
	for <lists.virtualization@lfdr.de>; Fri, 13 Nov 2020 14:48:54 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 3DBB0204C2;
	Fri, 13 Nov 2020 13:48:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Cdwd+2JNNTZt; Fri, 13 Nov 2020 13:48:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id BEE452E219;
	Fri, 13 Nov 2020 13:48:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A5F4BC0891;
	Fri, 13 Nov 2020 13:48:52 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 11802C0800
 for <virtualization@lists.linux-foundation.org>;
 Fri, 13 Nov 2020 13:48:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 07B142E20E
 for <virtualization@lists.linux-foundation.org>;
 Fri, 13 Nov 2020 13:48:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5z6EIGO9LAqn
 for <virtualization@lists.linux-foundation.org>;
 Fri, 13 Nov 2020 13:48:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by silver.osuosl.org (Postfix) with ESMTPS id E63F52E162
 for <virtualization@lists.linux-foundation.org>;
 Fri, 13 Nov 2020 13:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605275329;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zahLTNS43nRj+vHGeTYURaqz9Ba56dxaMqAEL8MHFEM=;
 b=H7bBtU2iEqhLeg9AtTjjYBUEZ+3T+y/XlKFOjEI2hgMCg/nqaqMxNuwNuetqatzYdZQC8u
 0mHu8+c/pzqltHqoNKlLNL6PodsX/rF5js23xMTt5TSYWW+0y0BRo0r25Rd4FI5vi8bg9C
 cZliriPBRqa26gNtpZHOdl9D5a6RPGk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-284-XNL1iMqPN5OBFqQ7ctti7g-1; Fri, 13 Nov 2020 08:48:48 -0500
X-MC-Unique: XNL1iMqPN5OBFqQ7ctti7g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 072748030A7;
 Fri, 13 Nov 2020 13:48:47 +0000 (UTC)
Received: from steredhat.redhat.com (ovpn-114-21.ams2.redhat.com
 [10.36.114.21])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 306005D9F3;
 Fri, 13 Nov 2020 13:48:45 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: virtualization@lists.linux-foundation.org
Subject: [PATCH RFC 11/12] vringh: allow vringh_iov_xfer() to skip bytes when
 ptr is NULL
Date: Fri, 13 Nov 2020 14:47:11 +0100
Message-Id: <20201113134712.69744-12-sgarzare@redhat.com>
In-Reply-To: <20201113134712.69744-1-sgarzare@redhat.com>
References: <20201113134712.69744-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Cc: Laurent Vivier <lvivier@redhat.com>, Max Gurtovoy <mgurtovoy@nvidia.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, linux-kernel@vger.kernel.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <elic@nvidia.com>
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
of bytes in a vringh_iov.

In order to keep vringh_iov consistent, let's reuse vringh_iov_xfer()
logic and skip bytes when the ptr is NULL.

Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---

I'm not sure if this is the best option, maybe we can add a new
function vringh_iov_skip().

Suggestions?
---
 drivers/vhost/vringh.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/vhost/vringh.c b/drivers/vhost/vringh.c
index 8bd8b403f087..ed3290946ad7 100644
--- a/drivers/vhost/vringh.c
+++ b/drivers/vhost/vringh.c
@@ -75,7 +75,9 @@ static inline int __vringh_get_head(const struct vringh *vrh,
 	return head;
 }
 
-/* Copy some bytes to/from the iovec.  Returns num copied. */
+/* Copy some bytes to/from the iovec.  Returns num copied.
+ * If ptr is NULL, skips at most len bytes.
+ */
 static inline ssize_t vringh_iov_xfer(struct vringh *vrh,
 				      struct vringh_kiov *iov,
 				      void *ptr, size_t len,
@@ -89,12 +91,16 @@ static inline ssize_t vringh_iov_xfer(struct vringh *vrh,
 		size_t partlen;
 
 		partlen = min(iov->iov[iov->i].iov_len, len);
-		err = xfer(vrh, iov->iov[iov->i].iov_base, ptr, partlen);
-		if (err)
-			return err;
+
+		if (ptr) {
+			err = xfer(vrh, iov->iov[iov->i].iov_base, ptr, partlen);
+			if (err)
+				return err;
+			ptr += partlen;
+		}
+
 		done += partlen;
 		len -= partlen;
-		ptr += partlen;
 		iov->consumed += partlen;
 		iov->iov[iov->i].iov_len -= partlen;
 		iov->iov[iov->i].iov_base += partlen;
-- 
2.26.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
