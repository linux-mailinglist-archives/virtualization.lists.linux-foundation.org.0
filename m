Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 282AF1EBC65
	for <lists.virtualization@lfdr.de>; Tue,  2 Jun 2020 15:06:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id CD89E876DB;
	Tue,  2 Jun 2020 13:06:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TCBfVfxQKrmf; Tue,  2 Jun 2020 13:06:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id D098F87668;
	Tue,  2 Jun 2020 13:06:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B606FC016E;
	Tue,  2 Jun 2020 13:06:23 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E4445C016E
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 Jun 2020 13:06:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id D3A6286B28
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 Jun 2020 13:06:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qV2ityMLD1zY
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 Jun 2020 13:06:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by whitealder.osuosl.org (Postfix) with ESMTPS id BC211876EB
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 Jun 2020 13:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591103177;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+9ArrlnZ76Z7x7tEJ0GmRFFHnk/lfGSrrAX14yhuVlU=;
 b=CE9grpJy+VzHjaCkVvD1Fkp/B+yVOU1Ct0924RKh5Uq+GP/kV3IIl4cMGKRs3YH/kKAm4+
 ilxqTZWDihYrDOZj3PIrplyvnzsw84kau/jD9yTVlTLp/X8MCE7LB3/We9PXPeCBKBR/Y3
 1fcMGa3jzM6AK875A/HBVhY2E1J8Reo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-101-fjizf6uGN8WjrSBEWeJEyQ-1; Tue, 02 Jun 2020 09:06:15 -0400
X-MC-Unique: fjizf6uGN8WjrSBEWeJEyQ-1
Received: by mail-wm1-f69.google.com with SMTP id g84so929128wmf.4
 for <virtualization@lists.linux-foundation.org>;
 Tue, 02 Jun 2020 06:06:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+9ArrlnZ76Z7x7tEJ0GmRFFHnk/lfGSrrAX14yhuVlU=;
 b=EPHxgqJmqed5c2aYc2mPy5I8o548yoQAFurNcMzGg4I6Go39ZOVT5RiKXp2a2tNedU
 peaWu2NQpan2JNiWupbkqOMAxPwUXO0ojFxeRn9Ma0OXL3DHt3kDpHoxzQs+Pa2Of2M4
 EaDeQgA+/Dk5hlBOGY/AizEbCkcHIPaUCzJTXOwG/EjN5Y7Qw0XBUae+HL32HT/W+ang
 vhHtp8pbHlD28cZtYzHqZUH+jMNdXS9zS6Df9t43bLbpFxof/8hMcau9qplrxECIxWPk
 lC7dORoggvXbOd1mSd1twGSwWxGKCCfoodb6rFm9ONZ3UCnoCnF3aAzzYRJVzVBhTf1d
 oyPQ==
X-Gm-Message-State: AOAM531yMW62D5UB1/+AbU4xYGpETLGv40n4VscrWPbHj9s79ih4xsMs
 3L9xHrtssa+9tuGrDmoyUds8ftHJa6skNiBte/VTWhFpiFBjVieHQicLlbJZ8mtTQnGmZdTi4Qs
 9oKzLg7h5anIEbFlnHvijaa5GtQrnJBxVxrKijBi8zQ==
X-Received: by 2002:a7b:c201:: with SMTP id x1mr4041711wmi.58.1591103172911;
 Tue, 02 Jun 2020 06:06:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxAQ1hhO0DwfriHXGOJkXG1RkMZz6fc+8BSr/fDJ8YL0qd5AbUcevXhy22swxOsw0LrNtT9bQ==
X-Received: by 2002:a7b:c201:: with SMTP id x1mr4041687wmi.58.1591103172611;
 Tue, 02 Jun 2020 06:06:12 -0700 (PDT)
Received: from redhat.com (bzq-109-64-41-91.red.bezeqint.net. [109.64.41.91])
 by smtp.gmail.com with ESMTPSA id
 s7sm3687653wrr.60.2020.06.02.06.06.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jun 2020 06:06:12 -0700 (PDT)
Date: Tue, 2 Jun 2020 09:06:10 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH RFC 07/13] vhost: format-independent API for used buffers
Message-ID: <20200602130543.578420-8-mst@redhat.com>
References: <20200602130543.578420-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200602130543.578420-1-mst@redhat.com>
X-Mailer: git-send-email 2.24.1.751.gd10ce2899c
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>, netdev@vger.kernel.org,
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

Add a new API that doesn't assume used ring, heads, etc.
For now, we keep the old APIs around to make it easier
to convert drivers.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 drivers/vhost/vhost.c | 52 ++++++++++++++++++++++++++++++++++---------
 drivers/vhost/vhost.h | 17 +++++++++++++-
 2 files changed, 58 insertions(+), 11 deletions(-)

diff --git a/drivers/vhost/vhost.c b/drivers/vhost/vhost.c
index b4a6e44d56a8..be822f0c9428 100644
--- a/drivers/vhost/vhost.c
+++ b/drivers/vhost/vhost.c
@@ -2292,13 +2292,12 @@ static int fetch_descs(struct vhost_virtqueue *vq)
  * number of output then some number of input descriptors, it's actually two
  * iovecs, but we pack them into one and note how many of each there were.
  *
- * This function returns the descriptor number found, or vq->num (which is
- * never a valid descriptor number) if none was found.  A negative code is
- * returned on error. */
-int vhost_get_vq_desc(struct vhost_virtqueue *vq,
-		      struct iovec iov[], unsigned int iov_size,
-		      unsigned int *out_num, unsigned int *in_num,
-		      struct vhost_log *log, unsigned int *log_num)
+ * This function returns a value > 0 if a descriptor was found, or 0 if none were found.
+ * A negative code is returned on error. */
+int vhost_get_avail_buf(struct vhost_virtqueue *vq, struct vhost_buf *buf,
+			struct iovec iov[], unsigned int iov_size,
+			unsigned int *out_num, unsigned int *in_num,
+			struct vhost_log *log, unsigned int *log_num)
 {
 	int ret = fetch_descs(vq);
 	int i;
@@ -2311,6 +2310,8 @@ int vhost_get_vq_desc(struct vhost_virtqueue *vq,
 	*out_num = *in_num = 0;
 	if (unlikely(log))
 		*log_num = 0;
+	buf->in_len = buf->out_len = 0;
+	buf->descs = 0;
 
 	for (i = vq->first_desc; i < vq->ndescs; ++i) {
 		unsigned iov_count = *in_num + *out_num;
@@ -2340,6 +2341,7 @@ int vhost_get_vq_desc(struct vhost_virtqueue *vq,
 			/* If this is an input descriptor,
 			 * increment that count. */
 			*in_num += ret;
+			buf->in_len += desc->len;
 			if (unlikely(log && ret)) {
 				log[*log_num].addr = desc->addr;
 				log[*log_num].len = desc->len;
@@ -2355,9 +2357,11 @@ int vhost_get_vq_desc(struct vhost_virtqueue *vq,
 				goto err;
 			}
 			*out_num += ret;
+			buf->out_len += desc->len;
 		}
 
-		ret = desc->id;
+		buf->id = desc->id;
+		++buf->descs;
 
 		if (!(desc->flags & VRING_DESC_F_NEXT))
 			break;
@@ -2365,7 +2369,7 @@ int vhost_get_vq_desc(struct vhost_virtqueue *vq,
 
 	vq->first_desc = i + 1;
 
-	return ret;
+	return 1;
 
 err:
 	for (i = vq->first_desc; i < vq->ndescs; ++i)
@@ -2375,7 +2379,15 @@ int vhost_get_vq_desc(struct vhost_virtqueue *vq,
 
 	return ret;
 }
-EXPORT_SYMBOL_GPL(vhost_get_vq_desc);
+EXPORT_SYMBOL_GPL(vhost_get_avail_buf);
+
+/* Reverse the effect of vhost_get_avail_buf. Useful for error handling. */
+void vhost_discard_avail_bufs(struct vhost_virtqueue *vq,
+			      struct vhost_buf *buf, unsigned count)
+{
+	vhost_discard_vq_desc(vq, count);
+}
+EXPORT_SYMBOL_GPL(vhost_discard_avail_bufs);
 
 static int __vhost_add_used_n(struct vhost_virtqueue *vq,
 			    struct vring_used_elem *heads,
@@ -2459,6 +2471,26 @@ int vhost_add_used(struct vhost_virtqueue *vq, unsigned int head, int len)
 }
 EXPORT_SYMBOL_GPL(vhost_add_used);
 
+int vhost_put_used_buf(struct vhost_virtqueue *vq, struct vhost_buf *buf)
+{
+	return vhost_add_used(vq, buf->id, buf->in_len);
+}
+EXPORT_SYMBOL_GPL(vhost_put_used_buf);
+
+int vhost_put_used_n_bufs(struct vhost_virtqueue *vq,
+			  struct vhost_buf *bufs, unsigned count)
+{
+	unsigned i;
+
+	for (i = 0; i < count; ++i) {
+		vq->heads[i].id = cpu_to_vhost32(vq, bufs[i].id);
+		vq->heads[i].len = cpu_to_vhost32(vq, bufs[i].in_len);
+	}
+
+	return vhost_add_used_n(vq, vq->heads, count);
+}
+EXPORT_SYMBOL_GPL(vhost_put_used_n_bufs);
+
 static bool vhost_notify(struct vhost_dev *dev, struct vhost_virtqueue *vq)
 {
 	__u16 old, new;
diff --git a/drivers/vhost/vhost.h b/drivers/vhost/vhost.h
index a67bda9792ec..6c10e99ff334 100644
--- a/drivers/vhost/vhost.h
+++ b/drivers/vhost/vhost.h
@@ -67,6 +67,13 @@ struct vhost_desc {
 	u16 id;
 };
 
+struct vhost_buf {
+	u32 out_len;
+	u32 in_len;
+	u16 descs;
+	u16 id;
+};
+
 /* The virtqueue structure describes a queue attached to a device. */
 struct vhost_virtqueue {
 	struct vhost_dev *dev;
@@ -193,7 +200,12 @@ int vhost_get_vq_desc(struct vhost_virtqueue *,
 		      unsigned int *out_num, unsigned int *in_num,
 		      struct vhost_log *log, unsigned int *log_num);
 void vhost_discard_vq_desc(struct vhost_virtqueue *, int n);
-
+int vhost_get_avail_buf(struct vhost_virtqueue *, struct vhost_buf *buf,
+			struct iovec iov[], unsigned int iov_count,
+			unsigned int *out_num, unsigned int *in_num,
+			struct vhost_log *log, unsigned int *log_num);
+void vhost_discard_avail_bufs(struct vhost_virtqueue *,
+			      struct vhost_buf *, unsigned count);
 int vhost_vq_init_access(struct vhost_virtqueue *);
 int vhost_add_used(struct vhost_virtqueue *, unsigned int head, int len);
 int vhost_add_used_n(struct vhost_virtqueue *, struct vring_used_elem *heads,
@@ -202,6 +214,9 @@ void vhost_add_used_and_signal(struct vhost_dev *, struct vhost_virtqueue *,
 			       unsigned int id, int len);
 void vhost_add_used_and_signal_n(struct vhost_dev *, struct vhost_virtqueue *,
 			       struct vring_used_elem *heads, unsigned count);
+int vhost_put_used_buf(struct vhost_virtqueue *, struct vhost_buf *buf);
+int vhost_put_used_n_bufs(struct vhost_virtqueue *,
+			  struct vhost_buf *bufs, unsigned count);
 void vhost_signal(struct vhost_dev *, struct vhost_virtqueue *);
 void vhost_disable_notify(struct vhost_dev *, struct vhost_virtqueue *);
 bool vhost_vq_avail_empty(struct vhost_dev *, struct vhost_virtqueue *);
-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
